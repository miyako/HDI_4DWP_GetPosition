# HDI_4DWP_GetPosition

**How Do I get the position of any element in a 4D Write Pro document?**

A 4D "How Do I" (HDI) example showing how to use `WP Get position` to find out where a range, paragraph or bookmark sits in a 4D Write Pro document: section, page, column, line and position in line.

![4D](https://img.shields.io/badge/4D-17%2B-blue) ![License](https://img.shields.io/badge/license-see%20LICENSE-lightgrey)

## Overview

| | |
|---|---|
| **Topic** | 4D Write Pro: document layout and positions |
| **Key commands** | `WP Get position`, `WP Selection range`, `WP Get elements`, `WP Bookmark range`, `WP GET BOOKMARKS`, `WP SELECT` |
| **Minimum version** | 4D 17 |
| **Licence needed** | 4D Write Pro |
| **Project type** | 4D project (`.4DProject`), converted from a 4D v17 binary database |

## Features

- **Live selection position:** select text in the Write Pro area and see its start/end index and where it begins (section, page, column, line, position in line).
- **Layout modes:** switch between Page, Draft and Web view, plus the *HTML WYSIWYG* option. The position is reported for the matching `wk 4D Write Pro layout` or `wk html wysiwyg` option, and the displayed code snippet follows.
- **Paragraph positions:** a list box shows the position of every paragraph in the body; selecting a row selects the paragraph in the document.
- **Bookmark positions:** the same for every bookmark, using `WP Bookmark range`.
- **Insert table sample:** the input form of the `[INFO]` table shows how to insert a table into a Write Pro field.

## Getting started

1. Open `Project/HDI_4DWP_GetPosition.4DProject` with 4D (a Write Pro licence is required).
2. Run **File > Demo** (`Cmd/Ctrl+K`), or let the `00_Start` method run on startup.
3. On the splash window, click **Demo** and play with the selection, view mode and the tabs on the right.

If the 4D version or licence is not sufficient, the splash window explains why and the button becomes **Close**.

## Points of interest

- **`GetRangeInfo`:** the core of the example. It reads the current selection, picks the layout option from the *HTML WYSIWYG* action state (`Action info`), then calls `WP Get position`. To get where a range ends, create a range at the end position and call `WP Get position` on it (see the comments in the method).
- **Paragraphs and bookmarks:** `WP Get position` also accepts element and bookmark ranges, so the same call fills the sections, pages, columns, lines and positions arrays.
- **Startup pattern:** `00_Start` uses `CALL WORKER` and a non-blocking `DIALOG(...; *)`, reuses an already open splash window, and passes state through `Form` (no interprocess variables). The *Demo* button object method opens the main form.
- **Standard actions:** Quit, Undo, Cut, Copy, Paste, etc. in `menus.json` use the `"action"` property instead of wrapper methods.
- **Localisation:** all UI strings are in XLIFF (`Resources/en.lproj`, `Resources/ja.lproj`); forms use `:xliff:` references and methods use `Localized string`.
- **Dark mode and Liquid Glass:** `styleSheets.css` adapts colours with `prefers-color-scheme` and `"automatic"` values; `styleSheets_mac.css` sets push button heights (27px Liquid Glass / 23px classic) through `form-theme` media queries.
- **List boxes:** `truncateMode: none`, `resizingMode: legacy` and `automaticAlternate` row fills.

## Project structure

```
Project/
  Sources/
    Methods/            00_Start (startup), GetRangeInfo (position logic)
    Forms/HDI/          splash window ("About" screen)
    Forms/HDI2/         main demo form
    TableForms/1/       [INFO] input / output forms
    menus.json          menu bar (standard actions)
    styleSheets*.css    dark mode, Liquid Glass, fonts
Resources/
  en.lproj, ja.lproj    XLIFF localisation
  INFO.4ie / INFO.4si   sample data imported on first start
```

## References

- Blog post: [Get the position of any part of a 4D Write Pro document](https://blog.4d.com/get-the-position-of-any-part-of-a-4d-write-pro-document/)
- Command: [`WP Get position`](https://developer.4d.com/docs/WritePro/commands/wp-get-position)
- Original v17 download: https://download.4d.com/Demos/4D_v17/HDI_4DWP_GetPosition.zip
- [4D Write Pro documentation](https://developer.4d.com/docs/WritePro/overview)

## Origin

Originally a 4D v17 binary `.4DB` HDI database, converted to the project architecture with 4D 21 and modernised with GitHub Copilot.

## License

See [LICENSE](LICENSE).
