#!/usr/bin/env python3
"""Convert an Anki "Notes as plain text" export into supabase/seed.sql.

Usage: python scripts/convert_anki.py "All Decks.txt" supabase/seed.sql
"""
import csv
import html
import re
import sys

src, dst = sys.argv[1], sys.argv[2]


def clean(s: str) -> str:
    s = re.sub(r"(?i)<br\s*/?>", "\n", s)
    s = re.sub(r"(?i)</div>\s*<div>", "\n", s)
    s = re.sub(r"(?i)</?div[^>]*>", "\n", s)
    s = re.sub(r"<[^>]+>", "", s)
    s = html.unescape(s).replace("\xa0", " ")
    s = re.sub(r"\n{3,}", "\n\n", s)
    return s.strip()


def q(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"


with open(src, encoding="utf-8", newline="") as f:
    lines = [l for l in f.read().splitlines(keepends=True) if not l.startswith("#")]

rows = list(csv.reader(lines, delimiter="\t", quotechar='"'))
cards = []
for r in rows:
    if len(r) < 5:
        continue
    deck, front, back = r[2].strip(), clean(r[3]), clean(r[4])
    if front and back:
        cards.append((deck, front, back))
    elif front and not back:
        cards.append((deck, front, "(no answer yet)"))

decks = sorted({c[0] for c in cards})
out = ["-- Generated from Anki export. Run AFTER schema.sql.\n"]
for d in decks:
    out.append(f"insert into decks (name) values ({q(d)}) on conflict (name) do nothing;\n")
out.append("\n")
for d, fr, bk in cards:
    out.append(
        f"insert into cards (deck_id, front, back) "
        f"select id, {q(fr)}, {q(bk)} from decks where name = {q(d)};\n"
    )

with open(dst, "w", encoding="utf-8") as f:
    f.writelines(out)

print(f"{len(cards)} cards in {len(decks)} decks: {decks}")
