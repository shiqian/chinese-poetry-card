---
name: poetry-learning-cards
description: Create or revise five illustrated 羽言课堂 Chinese poetry learning cards for parents reading with children, using the 秋词 visual references and ImageGen. Covers the poem, a memorable researched poet introduction, hidden context, and a related idiom.
---

# 羽言课堂诗歌学习卡

制作适合家长与孩子共读的一套五张中文卡片：封面、诗歌、诗人简介、背景、关联成语。本技能独立使用；不读取或继承旧版 chinese-poetry-card 的规则、模板或脚本。

## 执行顺序

1. 确认诗题、作者和所选篇目；同题多首时先确定具体诗文。建立本套目录。
2. 阅读 [卡片内容](references/card-contract.md) 和 [资料核查](references/research-and-sourcing.md)，核实原诗，筛选有依据的诗人故事与背景，选定关联成语。保存研究记录及五张卡的定稿文字。
3. 阅读 [视觉系统](references/visual-system.md)，查看随附的五张秋词参考图，写出本诗的场景与诗人人物设定。
4. **绘图前必须读取并使用当前可用的 imagegen 技能。所有卡片插画、人物、场景及其修改均使用内置 ImageGen；不得用程序绘图或 SVG/HTML 占位图代替。** 先生成封面，再逐张生成其余四张卡。每张使用独立提示词，并明确参考图的作用、准确文字及人物设定。工具不可用时说明阻碍；仅经用户明确选择才使用 imagegen 技能的 CLI/API 备选流程。
5. 按 [验收](references/validation.md) 检查生成后的实际文字、内容分工及图像。发现文字错误时用 ImageGen 定点修改或重新生成并复查。程序仅用于尺寸处理、OCR及文件检查等辅助工作。
6. 展示并链接五张成品，简述所用生成方式及未解决的问题（如有）。

## 文件归档

本项目默认根目录为 `/Users/xiaoqian/Documents/Summer school/outputs/poetry-learning-cards/`；用户明确指定位置时遵从用户。每套存入 `<诗人>_<诗题>/`，五张成品直接放在该目录：

```text
00_封面_<诗题>.png
01_诗歌学习卡_<诗题>.png
02_诗人简介卡_<诗人>.png
03_诗歌背景卡_<诗题>.png
04_成语学习卡_<成语>.png
```

所有中间材料也归入本套目录，按需使用 `research/`、`source_text/`、`prompts/`、`素材/`、`previews/`；不建立空目录。保存资料依据、定稿文字、人物设定、每次生成/修改提示词、生成素材及检查预览。ImageGen 自动保存到其他位置时，将本次生成的素材及时复制到本套目录，不能只引用工具默认位置。已有同名成品且用户未要求覆盖时，使用版本子目录保存整套新成果。
