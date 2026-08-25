# Text validation reference

Prepare one UTF-8 source record for the cover and one for each of the four cards before generation. It must contain the exact visible text, including titles, names, dates, punctuation, quotations, idiom examples, and 羽言课堂.

## Automated gate

On macOS, run:

    swift scripts/ocr_validate.swift <image> <source-text.txt> 0.80

Require exact normalized comparison and confidence at or above 0.80. A mismatch or low-confidence observation is a failed card. If OCR is unavailable, say so and do not claim automated validation passed.

## Manual gate

Read each card top-to-bottom once for meaning and once character-by-character against its source record. Check especially:

- poem order and edition;
- names, place names, dynasty labels, dates, quotations, punctuation, and simplified/traditional forms;
- look-alike, missing, duplicated, or invented Chinese characters;
- duplicate headings and extra captions;
- 羽言课堂 and the cover's 一诗一成语 mark.

Never deliver a card with text that cannot be confirmed visually.
