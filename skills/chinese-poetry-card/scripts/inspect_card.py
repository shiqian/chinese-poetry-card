#!/usr/bin/env python3
"""Check basic dimensions and file integrity for a poetry-card image."""

from __future__ import annotations

import struct
import sys
from pathlib import Path


def dimensions(path: Path) -> tuple[int, int, str]:
    data = path.read_bytes()
    if data.startswith(b"\x89PNG\r\n\x1a\n") and len(data) >= 24:
        width, height = struct.unpack(">II", data[16:24])
        return width, height, "PNG"
    if data.startswith(b"\xff\xd8"):
        i = 2
        while i + 9 < len(data):
            if data[i] != 0xFF:
                i += 1
                continue
            marker = data[i + 1]
            i += 2
            if marker in (0xD8, 0xD9):
                continue
            if i + 2 > len(data):
                break
            length = struct.unpack(">H", data[i:i + 2])[0]
            if marker in range(0xC0, 0xC4):
                height, width = struct.unpack(">HH", data[i + 3:i + 7])
                return width, height, "JPEG"
            i += length
    raise ValueError("unsupported or unreadable image format")


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: inspect_card.py IMAGE", file=sys.stderr)
        return 2
    path = Path(sys.argv[1]).expanduser()
    if not path.is_file():
        print(f"FAIL: file not found: {path}", file=sys.stderr)
        return 1
    try:
        width, height, fmt = dimensions(path)
    except (OSError, ValueError) as exc:
        print(f"FAIL: {exc}", file=sys.stderr)
        return 1
    status = "PASS" if (width, height) == (1086, 1448) else "WARN"
    print(f"{status}: {path} | {fmt} | {width}x{height} | {path.stat().st_size} bytes")
    return 0 if status == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
