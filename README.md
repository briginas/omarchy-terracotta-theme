# Terracotta

A dark Omarchy theme with clay-colored window borders, charcoal backgrounds and muted rose accents. It includes a Foot palette, a LazyVim integration for terracotta.nvim, eza directory colors and three 4K wallpapers (3840 × 2160).

[![Vinyl wallpaper](preview.png)](backgrounds/00-vinyl.webp)

## Install on Omarchy

Install the desktop palette and wallpapers with the Omarchy theme installer. Back up any existing local theme named `terracotta` first, as the installer replaces that directory.

```sh
omarchy theme install https://github.com/briginas/omarchy-terracotta-theme
```

## Neovim

[terracotta.nvim](https://github.com/briginas/terracotta.nvim) is the companion Neovim colorscheme, built on OldTale. Omarchy generates its own Neovim config for Git-installed themes. To follow the desktop theme in LazyVim, install the [plugin spec](neovim.lua) after installing the desktop theme.

```sh
install -Dm644 ~/.config/omarchy/themes/terracotta/neovim.lua ~/.config/nvim/lua/plugins/theme_terracotta.lua
```

Open Neovim with the Terracotta desktop theme active and run `:echo g:colors_name`. It should print `terracotta`. Switching desktop themes lets LazyVim follow the new selection. Use `:Lazy update terracotta.nvim` to update the Neovim highlights.

## Foot, eza and icons

The [Foot palette](foot.ini) uses `#4A4045` for the selection background and `#DFE1E5` for selected text. Omarchy generates its own Foot config for Git-installed themes.

[eza.yml](eza.yml) matches the folder colors in Neo-tree. To use it with eza, point `~/.config/eza/theme.yml` at `~/.local/state/omarchy/current/theme/eza.yml`.

The desktop icon preference references Oldtale-Blue, a separately installed local icon theme based on Yaru-blue. The icon pack is a separate dependency.

## Credits

The palette is derived from [WebStorm OldTale Dark](https://github.com/briginas/webstorm-oldtale-dark-theme). See the [license](LICENSE) and [third-party notices](THIRD_PARTY_NOTICES.md).
