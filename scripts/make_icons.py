#!/usr/bin/env python3
"""Generate app icons from assets/cat.png.

iOS fills transparent icon backgrounds with black, so the cat is placed on a
solid colour. Change BG to restyle, then run:  python3 scripts/make_icons.py
"""
from PIL import Image

BG = (255, 243, 214, 255)  # soft cream
SRC = "assets/cat.png"


def make(size: int, scale: float, out: str):
    cat = Image.open(SRC).convert("RGBA")
    canvas = Image.new("RGBA", (size, size), BG)
    c = int(size * scale)
    cat = cat.resize((c, c), Image.LANCZOS)
    canvas.alpha_composite(cat, ((size - c) // 2, (size - c) // 2))
    canvas.convert("RGB").save(out, "PNG", optimize=True)
    print("wrote", out)


make(180, 0.80, "public/apple-touch-icon.png")   # iPhone home screen
make(192, 0.80, "public/icon-192.png")
make(512, 0.80, "public/icon-512.png")
make(512, 0.62, "public/icon-maskable-512.png")  # keeps cat inside the safe zone

# favicon: cat only, transparent
cat = Image.open(SRC).convert("RGBA").resize((64, 64), Image.LANCZOS)
cat.save("app/favicon.ico", sizes=[(16, 16), (32, 32), (64, 64)])
print("wrote app/favicon.ico")
