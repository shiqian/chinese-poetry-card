# Text validation reference

Create four content records before generation:

```text
title: <诗名>
dynasty: <朝代>
author: <作者>
author_label: [<朝代>]<作者>
poem_lines: [<诗句1>, <诗句2>, <诗句3>, <诗句4>]
poem_meaning: <不重复背景知识的白话说明>
poet_intro: <融合基本身份、人物反差、品性、文学身份和诗风的短文>
poem_background: [<非显性背景1>, <非显性背景2>, ...]
idiom: <相关成语>
idiom_definition: <儿童可理解的释义>
idiom_examples: [<例句1>, <例句2>]
footer_brand: 羽言课堂
```

## Required checks

### Automated OCR gate

- Prepare a UTF-8 source-text file containing exactly the visible text expected on each card.
- Run `swift scripts/ocr_validate.swift <image> <source-text.txt> 0.80` on macOS Vision.
- Require exact normalized comparison after removing whitespace and punctuation; any missing, added, or changed Chinese character fails the card.
- Require every OCR observation to meet the configured minimum confidence (default `0.80`); low confidence is a failure, not a pass with warning.
- If OCR is unavailable, do not claim automated text validation passed; use the manual review only as an explicitly limited fallback.

### Manual Chinese proofreading

- Compare every title, author character, dynasty label, and poem line character-for-character with the record.
- Keep the author label exactly `[朝代]作者`.
- Preserve poem line order and punctuation unless the user requests a different edition.
- Confirm the poem card contains only plain-language meaning; do not duplicate the background card's explanations.
- Confirm the poet card has one integrated information panel and no duplicate `诗人简介` or `冷知识` heading.
- Confirm the poet card's dates and genealogical claims use cautious wording when sources disagree.
- Confirm the background card adds useful, source-supported context rather than obvious paraphrase.
- Confirm the idiom definition and examples are natural, simple, and suitable for young children.
- Confirm the idiom itself is appropriate for ages 4–8; relevance to the poem alone is not enough.
- Confirm `羽言课堂` appears exactly and the feather motif is present on all four cards.
- Treat garbled, missing, duplicated, or invented characters as a failed generation.
- Pay special attention to visually similar Chinese characters, simplified/traditional variants, names, place names, quotation marks, punctuation, and repeated headings.
- Read the card once top-to-bottom for meaning and once character-by-character against the source-text file.

## Content boundaries

- Do not use ordinary textbook biography as the sole point of interest; add one memorable, source-supported detail or contrast.
- Do not present a later anecdote as a primary historical record without identifying it as a later source.
- Keep the four cards complementary: poem meaning, poet, hidden context, and modern idiom application.
- If a fact is disputed, either omit it, qualify it, or present both positions briefly in working notes rather than forcing certainty into the image.
