# mochalate - Yazi

A Yazi flavor for the [mochalate](https://github.com/mochalate-theme/nvim) colorscheme family, a cozy
fusion of [gruvbox](https://github.com/morhetz/gruvbox)'s warm earthiness and
[catppuccin](https://github.com/catppuccin/nvim)'s soft pastels in mochalate tones.

Dark-only. Warm brown-black backgrounds, burnt coral reds, amber yellows, sage greens and
muted teals.

## Features

- Full coverage of all yazi UI elements: manager, tabs, mode, status bar, which, confirm,
  spot, notify, pick, input, completion, tasks, help, and filetype rules.
- Semantic file-type coloring by MIME type.
- Custom icon rules for directories, executables, symlinks, and special files.

## Requirements

- [Yazi](https://yazi-rs.github.io) v0.2.4+

## Installation

```bash
# Via ya package manager
ya pkg add mochalate-theme/yazi
```

Or use the install script:

```sh
./install.sh
```

Or clone manually:

```bash
git clone https://github.com/mochalate-theme/yazi ~/.config/yazi/flavors/mochalate.yazi
```

## Usage

Set the content of your `~/.config/yazi/theme.toml`:

```toml
[flavor]
dark = "mochalate"
```

Make sure your `theme.toml` doesn't contain anything other than `[flavor]`, unless you want
to override certain styles of this flavor.

## Customization

Override specific styles in your `theme.toml` after the `[flavor]` section:

```toml
[flavor]
dark = "mochalate"

[mgr]
cwd = { fg = "#f0b870" }

[status]
perm_write = { fg = "#c88060" }
```

## Palette

| Key          | Value     | Role                       |
| ------------ | --------- | -------------------------- |
| `bg`         | `#1c1815` | editor background          |
| `bg_alt`     | `#242019` | panels, inactive tabs      |
| `bg_menu`    | `#2c261e` | floats, popups             |
| `border`     | `#3e3630` | window separators          |
| `border_alt` | `#4e463e` | float borders              |
| `fg`         | `#e8d5c4` | default text               |
| `fg_dim`     | `#a89278` | secondary text             |
| `fg_muted`   | `#7a6850` | line numbers, whitespace   |
| `accent`     | `#e8a050` | cwd, borders, status       |
| `keyword`    | `#d06850` | cut markers, errors        |
| `func`       | `#e0a060` | archives, warm accents     |
| `type`       | `#78a890` | select mode, images        |
| `string`     | `#a8b878` | sage accents               |
| `annotation` | `#c88060` | unset mode, permissions    |
| `constant`   | `#d8a050` | amber accents              |
| `ok`         | `#90b070` | copied markers, success    |
| `warn`       | `#d8a050` | selected markers, warnings |
| `err`        | `#e06058` | error states               |
| `comment`    | `#8a7560` | muted text                 |
| `debug`      | `#b890c0` | debug elements             |

## Credits

- [morhetz/gruvbox](https://github.com/morhetz/gruvbox): the warm, earthy foundation.
- [catppuccin/nvim](https://github.com/catppuccin/nvim): the soft pastel accent palette.

## License

[MIT](LICENSE)
