---
name: chinese-poetry-card
description: Create a matched pair of Chinese classical-poetry learning-card images in an existing reference series: one poet-introduction card and one poem-analysis card, with a dynasty-prefixed author label such as [唐]李白 or [宋]杨万里 and 羽言课堂 branding. Use when the user asks to generate, continue, or batch-create a Tang/Song poetry study card from a poem title, author, or reference image, especially for the 1086x1448 illustrated card format.
---

# Chinese Poetry Card

Generate two polished, child-friendly Chinese poetry learning cards from an existing card reference whenever the user provides a poem title: a poet-introduction card and a poem-analysis card. Preserve the reference series' visual language, dimensions, branding, and information hierarchy while changing the poem-specific illustration and copy.

## Workflow

### 1. Resolve inputs

- Identify the poem title, author, and the dynasty in which the poet lived.
- Unless the user explicitly requests only one card, plan two outputs: `诗人介绍卡` and `诗歌解析卡`.
- Use the user-provided reference image when available. If none is provided, find the most relevant existing card in the current workspace, preferring the latest image in a named card directory.
- Use the requested output directory; otherwise save beside the reference image.
- Preserve the reference dimensions. For this series, use 1086×1448 pixels.
- If the poem text is not supplied and exact wording matters, verify it from a reliable local or web source before generating. Do not invent lines.

### 2. Prepare card content

Use the exact simplified-Chinese title, dynasty-prefixed author label, and poem text. Format the author label as `[朝代]作者`, for example `[唐]李白`, `[唐]柳宗元`, `[宋]王安石`, or `[宋]杨万里`.

Prepare two content records:

- `诗人介绍卡`: poet name, dynasty, concise life overview, literary achievements, writing style, and representative works. Use reliable, widely accepted facts; distinguish uncertain or disputed dates rather than presenting them as certain.
- `诗歌解析卡`: poem title, author label, complete poem text, and three short child-friendly explanation bullets describing imagery and meaning without unsupported interpretation.

Default fixed copy unless the user requests otherwise:

- Section label on the poem-analysis card: `诗意小课堂`
- Footer brand on both cards: `羽言课堂`
- Add one small, elegant feather element beside or near the footer brand; keep it subtle and consistent with the cream, gold, and dark-green palette.

For a batch request, make one content record per poem and use stable, readable filenames such as `12_mei_hua.png`.

### 3. Generate the image

Use the built-in image generation tool. Treat the reference as a style/layout reference, not as an edit target: create two new cards with:

- ornate cream-and-gold vintage border;
- large cream title plaque at the top;
- small author plaque below it;
- full central hand-painted Chinese picture-book scene;
- cream poem plaque in the lower-left/center area;
- rounded cream `诗意小课堂` plaque in the lower-right area;
- scroll-shaped footer ribbon.

For the `诗人介绍卡`, use the same hierarchy but replace the poem plaque with a readable biography plaque and use a central scene that evokes the poet's life, era, or literary world. Include a small, child-friendly portrait or period scene only when it helps explain the poet; avoid invented specific events or facial likeness claims.

For the `诗歌解析卡`, use a central scene that directly expresses the poem's key imagery and retain the poem plaque plus `诗意小课堂` plaque.

Keep the composition readable at poster size. Match the reference's warm parchment, restrained gold, dark green type, textured gouache/watercolor, and gentle ink-wash finish. Make the central scene directly express the poem's key imagery. Avoid modern objects, logos, watermarks, English text, extra captions, and unrelated people or animals.

Put all required text in each prompt verbatim and explicitly request accurate, legible simplified Chinese. If the generator produces malformed text, run one targeted regeneration with the exact text repeated and a simpler composition; do not silently accept unreadable copy.

### 4. Validate and save

- Inspect the generated image visually before saving.
- Check each card against its own content record: poet name, dynasty, biography copy, poem title, dynasty-prefixed author label, all poem lines, section label, bullets, and `羽言课堂` footer brand.
- Check that the output is portrait-oriented and matches the target dimensions.
- Run `scripts/inspect_card.py` for deterministic file/dimension checks when the generated file is local.
- Save both cards non-destructively. Never overwrite an existing card unless the user explicitly asks; increment filenames instead.
- Report both final absolute paths and show the generated images when the app supports inline image display.

## Prompt template

Use this compact structure when calling image generation:

```text
Create a new 1086x1448 vertical Chinese classical-poetry learning card matching the supplied reference image's series style, layout hierarchy, ornate cream-and-gold frame, parchment plaques, and hand-painted children’s picture-book finish.

Topic: <title>; author label: [<朝代>]<author>.
Central scene: <poem-specific winter/spring/night/travel scene>.

Use this exact simplified Chinese text and no other text:
<title>
[<朝代>]<author>
<line 1>
<line 2>
<line 3>
<line 4>
诗意小课堂
• <bullet 1>
• <bullet 2>
• <bullet 3>
羽言课堂

Add one small elegant feather element near the footer brand. Preserve the title, author, poem plaque, explanation plaque, and footer positions. No English, watermark, or extra text.

For the poet-introduction card, replace the poem lines and poem plaque with the poet biography content record and use the same footer brand and feather element.
```

## Bundled resources

- Read [references/card-layout.md](references/card-layout.md) when matching the visual series or choosing a composition.
- Read [references/text-validation.md](references/text-validation.md) when checking poem copy or explanation bullets.
- Run `scripts/inspect_card.py <image>` after saving a local output.
