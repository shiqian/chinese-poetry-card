# Chinese Poetry Card

`chinese-poetry-card` is a reusable Codex skill for creating calm, child-friendly Chinese classical-poetry learning series for `羽言课堂`.

The primary audience is children aged 4–8 and the parents who read with them.

## What it creates

For each poem, the skill produces a matched four-card series in a portrait 3:4 format:

1. **诗歌学习卡** — the complete poem and a simple plain-language meaning.
2. **诗人简介卡** — an integrated introduction to the poet, including a memorable, source-supported distinction and a short description of poetic style.
3. **诗歌背景卡** — non-obvious historical, geographic, cultural, and literary context that helps parents explain the poem.
4. **成语学习卡** — a related idiom with a child-friendly definition and examples from daily life.

The four cards are complementary rather than repetitive: poem → poet → hidden context → modern idiom use.

## Design principles

- Use 3:4 portrait cards with consistent dimensions across a set.
- Keep the first three cards visually continuous in their poet, period, and classical setting.
- Use a modern child-centered scene for the idiom card while retaining the series frame and brand system.
- Use simple, concrete language suitable for ages 4–8.
- Prefer familiar, imageable idioms; avoid unnecessarily rare, abstract, or allusion-heavy choices.
- Keep poem meaning separate from historical background so each card has a distinct purpose.
- Verify historical claims and distinguish primary sources, later records, modern scholarship, and disputed traditions.

## Skill contents

```text
skills/chinese-poetry-card/
├── SKILL.md
├── agents/openai.yaml
├── assets/yueke-style-reference/   # style and content-architecture references
├── references/
│   ├── card-layout.md
│   ├── content-framework.md
│   ├── fact-checking.md
│   ├── post-review-checklist.md
│   └── text-validation.md
└── scripts/
    ├── inspect_card.py
    └── ocr_validate.swift
```

The Yueke reference images are used as series references for visual treatment and information architecture only. New poems must use their own verified text, people, facts, scenes, and idioms.

## Validation

Check card dimensions and set consistency:

```bash
python3 skills/chinese-poetry-card/scripts/inspect_card.py path/to/cards
```

For generated text on macOS, prepare a UTF-8 source-text file containing the exact visible copy and run the Vision OCR gate:

```bash
swift skills/chinese-poetry-card/scripts/ocr_validate.swift \
  path/to/card.png path/to/source-text.txt 0.80
```

OCR must match the normalized source text exactly and every observation must meet the confidence threshold. Manual Chinese proofreading is still required for names, poem lines, place names, dates, punctuation, and visually similar characters.

## Outputs not included in the core skill

A4 printing layouts, narrated videos, and platform-specific covers are downstream exports. They should be generated from the verified four-card set without changing the card content.

## License

This project is available under the [MIT License](LICENSE).
