---
name: chinese-poetry-card
description: "Create a reusable five-image Chinese classical-poetry learning series for children: one cover plus poem-learning, poet-introduction, poem-background, and related-idiom cards. Use when the user asks to create, continue, batch-create, review, or revise a 羽言课堂 poetry-card set, especially in the 3:4 illustrated format."
---

# Chinese Poetry Card

Create a matched five-image learning series for one Chinese classical poem. The primary audience is children aged 4–8 and the parents who read with them, so every content choice must be understandable, explainable, and visually approachable for this age group. The default output is one cover plus four 3:4 portrait PNG cards with the `羽言课堂` brand:

1. `诗歌学习卡`: complete poem plus simple white-language meaning.
2. `诗人简介卡`: one integrated, child-friendly portrait of the poet.
3. `诗歌背景卡`: non-obvious historical, geographic, cultural, and literary context.
4. `成语学习卡`: one related idiom with a simple definition and one or two examples.

Do not add A4 or video deliverables unless explicitly requested; treat those as downstream export tasks.

## Required series cover

Create a cover as a required first asset for every complete series. The standard deliverable is five images: one cover plus the four learning cards. The cover is separate from the four card content roles but must be generated and delivered with them.

- Default canvas: the same exact 3:4 pixel dimensions as the card set; use `00_封面_<诗名>.png`. The cover must not merely share the ratio—it must share the exact width and height.
- Use the poem card as a visual reference so the cover shares the same border, palette, illustration finish, ancient setting, and poet identity.
- The cover layout must follow the reference cover in `assets/yueke-style-reference/00_cover-style.png`: preserve its overall title-panel placement, recurring-column mark position, author/related-idiom information hierarchy, illustration-to-text balance, and footer-brand placement. Adapt the poem-specific text and scene, but do not invent a different cover composition for a new poem.
- Use this fixed information hierarchy:
  1. small series label: `一诗一成语`
  2. largest text: `《诗名》`
  3. author: `作者`
  4. secondary hook: `关联成语：<成语>`
  5. footer brand: `羽言课堂`
- Do not write `每日一诗` by default: it promises a publishing frequency the user may not be able to maintain. Add it only when the user explicitly wants that commitment.
- Do not add explanatory slogans such as `一首诗，读懂诗人……`; the poem title and related idiom should provide the hook.
- Keep the cover calm and uncluttered. The poem title must dominate, while `一诗一成语` functions as the recurring column mark. Use exact text in the image-generation prompt and reject duplicate headings, extra labels, English, watermarks, or malformed Chinese.
- For a cover in a 9:16 video canvas, create a separate complete variant in one exact size for the whole video set (1080×1920 is preferred). Preserve the hierarchy and style but recompose the artwork for 9:16; do not simply stretch the 3:4 image or mix pixel sizes within one set.

## Workflow

### 1. Resolve inputs

- Identify poem title, exact poem text, author, dynasty, and requested output directory.
- Verify the poem text before generation when it is not supplied or when any character is uncertain.
- Use `assets/yueke-style-reference/` as the canonical series reference. The images provide visual-system and content-architecture references: learn the four-card division of labor, information hierarchy, amount of copy, panel composition, and progression from poem → poet → background → idiom, as well as layout, palette, border, typography, spacing, illustration finish, footer, and brand placement. They must not become a character or scene template: never copy Zhao Shixiu's face, hairstyle, clothing, pose, body type, room, props, landscape, poem text, poet facts, historical claims, idiom, or other poem-specific content into a new poem's cards.
- Default canvas: portrait 3:4; use one exact pixel width and height consistently across the cover and all four cards (1080×1440 is preferred for new sets, or preserve the supplied reference size). Matching only the aspect ratio is not sufficient.
- Use stable filenames: `01_诗歌学习卡_<诗名>.png`, `02_诗人简介卡_<作者>.png`, `03_诗歌背景卡_<诗名>.png`, `04_成语学习卡_<成语>.png`.

### 2. Prepare four content records

Read [references/content-framework.md](references/content-framework.md) for the card-specific writing rules and content boundaries.

Before generating, prepare one record for each card. Keep every card's job distinct: the poem card explains the poem, the poet card explains the person, the background card explains hidden context, and the idiom card transfers the mood or idea to children's modern life.

### 3. Verify facts

Read [references/fact-checking.md](references/fact-checking.md) when researching the poet, historical setting, geography, literary history, anecdotes, dates, or disputed claims. Record source notes before putting a fact into an image. Use cautious wording for uncertain dates or traditional genealogical claims.

### 4. Generate the cards

Use the built-in image-generation tool. Treat a supplied image as a style/layout reference unless the user explicitly requests an edit. Put all required text in the prompt verbatim and ask for accurate, legible simplified Chinese.

Before generation, create a short poet-identity brief for the new series: age impression, facial features, hairstyle/headwear, clothing silhouette and colors, temperament, pose language, and historically appropriate setting. Use that same brief for the cover and the first three cards. The poet may appear in different actions or compositions, but must remain recognizably the same person across the series. The fourth idiom card should use a modern child-centered scene and should not reuse the poet's character unless explicitly requested.

Common visual rules:

- ornate cream-and-gold frame, parchment plaques, restrained dark-green typography, and hand-painted picture-book / gouache texture;
- same dimensions, border, footer ribbon, feather motif, typography hierarchy, and `羽言课堂` brand on the cover and all four cards;
- the decorative motifs flanking the bottom brand ribbon must be designed for the new poem and its setting; never mechanically copy bamboo, plants, clouds, or other poem-specific ornaments from the reference set. Choose restrained motifs from the poem's own imagery, place, season, weather, or child-life scene, and keep them subordinate to the brand mark. For this West Lake rain poem, suitable motifs include lotus leaves, willow, water ripples, rain clouds, and lake stones; use child-friendly meadow/flower motifs on the idiom card when appropriate;
- the cover and first three cards share the new poem's own poet identity, historical mood, and connected ancient setting; they must not inherit the reference poet's identity;
- the idiom card uses a modern child-centered scene, linked by mood rather than by copying the poem's objects;
- poem-card lower panels should favor calm asymmetry—narrower poem slip on the left, wider `诗意小课堂` panel on the right, subtly staggered edges, and no heavy center divider;
- one main title per card; no duplicate section titles;
- no English, watermarks, unrelated characters, modern objects in ancient scenes, or unsupported decorative captions.

When generating a new poem, treat the reference images as structural exemplars, not character or content templates. Reuse the proven combination pattern—plain poem meaning, integrated poet portrait, non-obvious background knowledge, and child-friendly idiom application—but write all content and the poet-identity brief for the new poem. Replace every poem-specific word, person, fact, face, costume, scene, prop, and idiom.

If generated text is malformed, regenerate with a simpler layout and the exact text repeated. Do not accept unreadable, duplicated, or invented text.

Generate the required cover as the first asset in the series, then generate the four cards. Use the poem card as the style/continuity reference, include only the fixed cover text above, inspect it visually, and save it alongside the four cards. The final review must cover all five images in posting order: cover → poem → poet → background → idiom.

### 5. Review before delivery

Read [references/post-review-checklist.md](references/post-review-checklist.md). Inspect every image visually, then run:

```bash
python scripts/inspect_card.py <image-or-directory>
```

For generated text, also prepare a UTF-8 source-text file containing exactly the text that should appear on the card and run the macOS Vision OCR check:

```bash
swift scripts/ocr_validate.swift <image> <source-text.txt> 0.80
```

The OCR check must pass exact normalized text comparison and the minimum confidence threshold. Any mismatch or low-confidence observation is a failed card, not a warning. Then complete the manual Chinese proofreading checklist; OCR does not replace visual review.

Confirm text, facts, exact pixel dimensions, visual continuity, poem-specific bottom ornaments, non-duplication, footer branding, and file naming. Report the five absolute paths and show the images when inline display is available.

## Optional downstream outputs

- A4 printing: create a separate export workflow that places the four final 3:4 cards on A4 pages without changing card content.
- Douyin video: create a separate video workflow that uses the four cards in this order: poem → poet → background → idiom, with timing and narration appropriate for reading.
