#!/usr/bin/env bash
# Every SKILL.md must stay inside the limits its hosts enforce. A frontmatter that
# breaks one fails quietly: claude.ai refuses a description over 1,024 characters,
# Claude Code truncates description + when_to_use past 1,536 characters in the skill
# listing, and a frontmatter that does not parse loads the body with no description,
# so the skill stops routing. None of these show up as a test failure elsewhere.
#
# Limits checked (Anthropic "Skill authoring best practices" and the Claude Code
# skills page):
#   name         lowercase letters, digits, hyphens; <= 64 chars; no "anthropic" or
#                "claude"; equal to the skill's directory name
#   description  1-1,024 chars; no "<" or ">"
#   description + when_to_use <= 1,536 chars
#   body         < 500 lines
#   frontmatter  opens on line 1 and parses
#
# The script runs a negative self-test first: a deliberately broken sample must
# produce one error per rule, or the checker itself is broken.
set -uo pipefail
cd "$(dirname "$0")/.."
PY=$(command -v python3 || command -v python)
[ -n "$PY" ] || { echo "FAIL: python3 is required"; exit 1; }

"$PY" - <<'EOF'
import glob, json, os, re, sys

def parse_frontmatter(text):
    """Return (fields, body) or raise ValueError."""
    if not text.startswith('---\n'):
        raise ValueError('frontmatter does not open on line 1')
    end = text.find('\n---\n', 4)
    if end < 0:
        raise ValueError('frontmatter is not closed')
    raw, body = text[4:end], text[end + 5:]
    try:
        import yaml
        fields = yaml.safe_load(raw)
        if not isinstance(fields, dict):
            raise ValueError('frontmatter is not a mapping')
    except ImportError:
        # Fallback without PyYAML: one `key: value` per line, value either a
        # double-quoted string or a plain scalar with no ": " inside it.
        fields = {}
        for line in raw.split('\n'):
            m = re.match(r'^([a-z_-]+): (.*)$', line)
            if not m:
                raise ValueError(f'unparseable frontmatter line: {line[:60]}')
            key, val = m.groups()
            if val.startswith('"'):
                try:
                    val = json.loads(val)
                except json.JSONDecodeError as e:
                    raise ValueError(f'{key}: bad quoted string ({e})')
            elif ': ' in val:
                raise ValueError(f'{key}: unquoted value contains ": "')
            fields[key] = val
    except Exception as e:  # yaml.YAMLError and the checks above
        raise ValueError(f'frontmatter does not parse: {e}')
    return fields, body

def check(text, dirname):
    errs = []
    try:
        f, body = parse_frontmatter(text)
    except ValueError as e:
        return [str(e)]
    name = str(f.get('name', ''))
    desc = str(f.get('description', ''))
    wtu = str(f.get('when_to_use', '') or '')
    if not re.fullmatch(r'[a-z0-9-]{1,64}', name):
        errs.append(f'name "{name}" is not 1-64 lowercase letters, digits or hyphens')
    if re.search(r'anthropic|claude', name, re.I):
        errs.append(f'name "{name}" contains a reserved word')
    if name != dirname:
        errs.append(f'name "{name}" differs from directory "{dirname}"')
    if not 1 <= len(desc) <= 1024:
        errs.append(f'description is {len(desc)} chars (limit 1,024)')
    if re.search(r'[<>]', desc):
        errs.append('description contains "<" or ">"')
    if len(desc) + len(wtu) > 1536:
        errs.append(f'description + when_to_use is {len(desc) + len(wtu)} chars (limit 1,536)')
    n = body.count('\n')
    if n >= 500:
        errs.append(f'body is {n} lines (limit: under 500)')
    return errs

# Negative self-test: every rule must fire on this sample.
bad = ('---\nname: Claude_Tool\ndescription: "' + 'x' * 1100 + ' <b>"\n'
       'when_to_use: "' + 'y' * 500 + '"\n---\n' + 'line\n' * 500)
got = check(bad, 'other-dir')
expected = ['is not 1-64', 'reserved word', 'differs from directory',
            'limit 1,024', '"<" or ">"', 'limit 1,536', 'limit: under 500']
missing = [e for e in expected if not any(e in g for g in got)]
if missing or check('name: x\n', 'x') == [] or check('---\nname: a: b\n---\n', 'a') == []:
    print(f'FAIL: self-test — the checker missed: {missing or "a parse error"}')
    sys.exit(1)

status = 0
files = sorted(glob.glob('plugin/skills/*/SKILL.md'))
for p in files:
    text = open(p, encoding='utf-8', newline='').read().replace('\r\n', '\n')
    for e in check(text, os.path.basename(os.path.dirname(p))):
        print(f'FAIL: {p}: {e}')
        status = 1
if status == 0:
    print(f'OK: frontmatter and body limits hold for {len(files)} skills')
sys.exit(status)
EOF
