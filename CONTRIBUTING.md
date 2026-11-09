# Contributing

Thanks for your interest in improving Neobrutalism. Bug reports, ideas and pull requests are all welcome.

## Reporting a bug

Please [open an issue](https://github.com/LennZone/Neobrutalism/issues/new/choose) and include:

- your Obsidian version and platform (Windows, macOS, Linux, Android, iOS)
- light or dark mode
- a screenshot of the problem
- other themes, snippets or plugins that change the look (for example Style Settings), if any

## Suggesting a change

For larger changes, please open an issue first so I can give feedback on the idea before you spend time on it. Not every good idea fits the style of the theme.

## Design rules

Every change should keep the look consistent:

- **Boxes**: panels are separate boxes with a border, a hard shadow and rounded corners.
- **Pastel color zones**: each area has its own pastel color, the writing area stays calm and easy to read.
- **Tokens first**: new values use the existing tokens (`--nb-*`) from sections 01 and 02 of `theme.css` instead of hard coded colors, borders or shadows.

## Working on the theme

The whole theme lives in `theme.css`. The table of contents at the top of the file lists its sections.

1. Fork the repository and clone it.
2. Link or copy the folder into a test vault at `.obsidian/themes/Neobrutalism`.
3. Select the theme under Settings, Appearance, Themes.
4. After saving `theme.css`, reload the theme (switch to another theme and back, or run "Reload app without saving").

Before opening a pull request, please check:

- light and dark mode
- desktop and, if you can, mobile
- that the [Style Settings](https://github.com/mgmeyers/obsidian-style-settings) options still work, if you touched a token

## Fonts

The fonts are embedded in section 13 of `theme.css` as base64. Do not edit that section by hand, it is generated:

1. Run `scripts/subset-fonts.sh` to shrink the original variable fonts in `fonts/source/` into `fonts/` (needs fontTools with brotli, see the comment at the top of the script).
2. Run `python3 scripts/embed-fonts.py` to rewrite section 13 from `fonts/fonts.json` and the files in `fonts/`.

New fonts must use a license that allows embedding, for example the SIL Open Font License. Please add the credit to `fonts/fonts.json` and to the README.

## Pull requests

- Keep a pull request focused on one change.
- Add before and after screenshots for visual changes.
- Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages, for example `fix: align tab bar icons` or `feat: add option for square corners`.

## License

By contributing, you agree that your contributions are licensed under the [MIT License](LICENSE).
