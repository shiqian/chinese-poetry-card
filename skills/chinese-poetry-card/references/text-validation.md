# Text validation reference

Before generation, create a content record with these exact fields:

```text
card_types: [诗人介绍卡, 诗歌解析卡]
title: <诗名>
dynasty: <朝代>
author: [<朝代>]<作者>
poet_intro: <经过核实的儿童友好版生平与文学成就>
representative_works: [<作品1>, <作品2>, <作品3>]
lines: [<诗句1>, <诗句2>, <诗句3>, <诗句4>]
bullets: [<解释1>, <解释2>, <解释3>]
section: 诗意小课堂
footer_brand: 羽言课堂
footer_motif: 羽毛
```

Check the following after generation:

- Compare every title and author character with the content record.
- Require the author label to use the exact format `[朝代]作者`; do not omit the brackets or dynasty.
- Verify the dynasty is historically correct for the poet before generation. Common examples: `[唐]李白`, `[唐]杜甫`, `[唐]柳宗元`, `[宋]王安石`, `[宋]杨万里`, `[宋]苏轼`.
- Compare every poem line character-for-character, including `鸟`, `踪`, `蓑`, `笠`, `凌`, `遥`, and other easily misgenerated characters.
- Ensure line order is unchanged.
- Ensure `诗意小课堂` is present and not replaced with a similar phrase.
- Ensure the footer brand is exactly `羽言课堂` and a small feather motif is present on both cards.
- Verify the poet-introduction card contains only concise, historically supported biography content; do not add invented anecdotes, dates, quotations, or portraits presented as factual likenesses.
- Verify the two cards form a matched pair with the same dimensions, border, palette, footer, and visual language.
- Treat garbled, missing, duplicated, or invented characters as a failed generation.

If image text cannot be confidently verified visually, regenerate with a simpler layout and a stronger exact-text constraint. Do not claim the card passed text validation when only the filename or prompt has been checked.
