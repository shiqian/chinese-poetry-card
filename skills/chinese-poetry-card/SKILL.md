---
name: chinese-poetry-card
description: "Create a reusable five-image Chinese classical-poetry learning series for children: cover, poem, poet, background, and related-idiom cards. Use for creating, revising, or reviewing 羽言课堂 poetry-card sets in the illustrated 3:4 format."
---

# Chinese Poetry Card

Create one coherent five-image lesson for children aged 4–8 and their parents:

1. 00_封面_<诗名>.png
2. 01_诗歌学习卡_<诗名>.png
3. 02_诗人简介卡_<作者>.png
4. 03_诗歌背景卡_<诗名>.png
5. 04_成语学习卡_<成语>.png

The default canvas is one exact 3:4 size for all five images (1080×1440 preferred; preserve a supplied reference size when appropriate). A4 and video exports are downstream tasks, not extra core cards.

## Non-negotiable principles

- One series: share the same dimensions, frame, parchment/gold palette, illustration finish, title hierarchy, footer, and exact 羽言课堂 brand placement. Keep the cover and first three cards in one historically connected world; make the idiom scene modern but calm and compatible.
- Reference, do not copy: use every image in assets/yueke-style-reference/ to learn the five-card division, layout rhythm, information density, and visual language. Do not copy the reference poet's face, costume, props, scene, poem, facts, idiom, or poem-specific decoration.
- New poet identity: define a short visual brief before generation (age, face, hair/headwear, clothing, temperament, setting) and use it consistently on the cover and first three cards. Change action and framing, not identity.
- Own decoration: keep the brand and series system, but derive plants, objects, weather, and footer ornaments from the new poem and its learner-facing scene.
- Interesting and useful: each card must add something distinct and memorable. Avoid textbook biography, empty praise, obvious paraphrase, stereotypes, and unsupported anecdotes.
- Exact Chinese: prepare the final text before generation. Never accept a malformed, missing, duplicated, invented, or uncertain Chinese character.

## Fixed content architecture

Read references/content-framework.md before writing. The four cards must answer different questions:

- 诗歌卡：诗里写了什么？ Show the complete poem and a short plain-language meaning only.
- 诗人卡：写诗的人是什么样的人？ Use one integrated introduction with dates, one memorable sourced distinction, literary identity, and a brief child-friendly style note.
- 背景卡：诗句背后有什么知识？ Add non-obvious, source-supported history, geography, calendar, customs, people, objects, or literary context; do not repeat the poem meaning.
- 成语卡：这个意思今天怎么说、怎么用？ Choose a concrete, age-appropriate related idiom, simple definition, and one or two child-life examples.

## Cover and visual reference

Generate the cover first. Its layout must follow assets/yueke-style-reference/00_cover-style.png: same title-panel placement, recurring-column mark, author/related-idiom hierarchy, illustration-to-text balance, and footer-brand position. Replace only the poem-specific content, poet identity, setting, and restrained motifs. Use this exact cover hierarchy:

一诗一成语 → 《诗名》 → 作者 → 关联成语：<成语> → 羽言课堂

Do not add 每日一诗 or explanatory slogans unless explicitly requested. Keep one main title per card. On the poem card, use the proven calm asymmetry: narrower poem area on the left, wider 诗意小课堂 panel on the right; do not make it a rigid table.

## Workflow

1. Resolve the poem text, title, author, dynasty, output directory, and related idiom. Read references/fact-checking.md for non-obvious claims.
2. Write the four content records and the poet-identity brief before generating.
3. Generate the cover, then the four cards, using exact text in the prompt and the reference assets for style/structure only.
4. Inspect all five in posting order: cover → poem → poet → background → idiom.
5. Run the image/size check:

   python scripts/inspect_card.py <image-or-directory>

   Then run references/text-validation.md: OCR exact comparison where available, followed by manual Chinese proofreading. Any OCR mismatch, low-confidence text, or unresolved visual character is a failed card.

Read references/post-review-checklist.md before delivery. Report five absolute paths and show the images when inline display is available.
