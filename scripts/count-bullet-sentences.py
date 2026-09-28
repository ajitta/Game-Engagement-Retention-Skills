#!/usr/bin/env python3
"""Grade the contract's two-sentence limit per bullet by counting, not by judging.

Usage: count-bullet-sentences.py [--max N] < answer.md
Prints every bullet over the limit and a final line 'OVERALL: PASS' or 'OVERALL: FAIL'.
Exit status is 0 on PASS, 1 on FAIL.

Why a script: across seven Opus 5.5 rounds an LLM judge applying "at most two sentences
per bullet" disagreed with itself between runs, and the rule is mechanical. A bullet is a
markdown list item (-, *, +, or 1.) together with its wrapped continuation lines; table
rows, headings and code are not bullets. A sentence ends at . ! ? or 。 followed by
whitespace or end of text. A leading bold label (**Feedback:**) is not a sentence.
Decimals (0.35s), version numbers, ellipses and a small set of abbreviations are not
sentence ends, and a trailing tag or bracket citation ([assumed], [source | year]) is not a
sentence.
"""
import re
import sys

ABBREV = re.compile(r"\b(e\.g|i\.e|vs|etc|approx|cf|incl|min|max|sec|no|fig)\.$", re.I)
BULLET = re.compile(r"^(\s*)([-*+]|\d+[.)])\s+(.*)$")
LABEL = re.compile(r"^\*\*[^*]{1,60}\*\*\s*[:：—–-]?\s*")
END = re.compile(r"[.!?。](?=[\"'”’)\]]*(\s|$))")


def bullets(text):
    items, cur, in_code = [], None, False
    for line in text.splitlines():
        if line.lstrip().startswith("```"):
            in_code = not in_code
            continue
        if in_code:
            continue
        m = BULLET.match(line)
        if m:
            if cur:
                items.append(cur)
            cur = m.group(3)
        elif cur is not None and line.strip() and not line.lstrip().startswith(("#", "|", ">")) \
                and line.startswith((" ", "\t")):
            cur += " " + line.strip()
        else:
            if cur:
                items.append(cur)
            cur = None
    if cur:
        items.append(cur)
    return items


def sentences(item):
    body = LABEL.sub("", item.strip())
    body = re.sub(r"`?\[[^\]]*\]`?", "", body)     # tags and bracket citations: [assumed], [src | pop | year]
    body = re.sub(r"`[^`]*`", "x", body)           # code spans
    body = re.sub(r"\.{2,}|…", " ", body)          # ellipses
    n, start = 0, 0
    for m in END.finditer(body):
        piece = body[start:m.end()].strip()
        if ABBREV.search(piece):
            continue
        if re.search(r"\w", piece):
            n += 1
        start = m.end()
    if re.search(r"\w", body[start:]):
        n += 1
    return n


def main():
    limit = 2
    if len(sys.argv) > 2 and sys.argv[1] == "--max":
        limit = int(sys.argv[2])
    text = sys.stdin.read()
    over = [(sentences(b), b) for b in bullets(text)]
    over = [(n, b) for n, b in over if n > limit]
    for n, b in over:
        print(f"{n} sentences: {b[:160]}")
    print("OVERALL: " + ("FAIL" if over else "PASS"))
    return 1 if over else 0


if __name__ == "__main__":
    sys.exit(main())
