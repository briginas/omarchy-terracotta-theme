# Terracotta

A dark Omarchy theme with clay-colored window borders, charcoal backgrounds and muted rose accents. It includes a Foot palette, eza directory colors and four 4K wallpapers (3840 × 2160).

[![Vinyl wallpaper](preview.png)](backgrounds/00-vinyl.webp)

## Install on Omarchy

Install the desktop palette and wallpapers with the Omarchy theme installer. Back up any existing local theme named `terracotta` first, as the installer replaces that directory.

```sh
omarchy theme install https://github.com/briginas/omarchy-terracotta-theme
```

## Neovim

A matching Neovim colorscheme is available separately as [terracotta.nvim](https://github.com/briginas/terracotta.nvim).

## Foot, eza and icons

The [Foot palette](foot.ini) uses `#322E32` for the selection background and `#DFE1E5` for selected text. Omarchy generates its own Foot config for Git-installed themes.

To use Terracotta’s sage (`#94C0A4`) for the Git branch, the modified-file dot and the `?` for untracked files, copy the settings from [starship-git.toml](starship-git.toml) into the matching sections of `~/.config/starship.toml`.

[eza.yml](eza.yml) matches the folder colors in Neo-tree. To use it with eza, point `~/.config/eza/theme.yml` at `~/.local/state/omarchy/current/theme/eza.yml`.

The desktop icon preference references Oldtale-Blue, a separately installed local icon theme based on Yaru-blue. The icon pack is a separate dependency.

## Credits

The palette is derived from [WebStorm OldTale Dark](https://github.com/briginas/webstorm-oldtale-dark-theme). See the [license](LICENSE) and [third-party notices](THIRD_PARTY_NOTICES.md).
