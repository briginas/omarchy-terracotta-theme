# Terracotta

A dark Omarchy theme with clay-colored window borders, charcoal backgrounds and muted rose accents. It includes a Foot palette, an OldTale configuration for LazyVim, eza directory colors and four wallpapers.

[![Terracotta’s default vinyl wallpaper](preview.png)](backgrounds/01-vinyl.png)

## Install on Omarchy

Install the desktop palette and wallpapers with the Omarchy theme installer. Back up any existing local theme named `terracotta` first, as the installer replaces that directory.

```sh
omarchy theme install https://github.com/briginas/omarchy-terracotta-theme
```

## OldTale for LazyVim

Omarchy generates a Neovim config for Git-installed themes. To enable Terracotta’s [OldTale](https://github.com/topazape/oldtale.nvim) highlights, install the [plugin spec](neovim.lua) in your LazyVim config after installing the desktop theme.

```sh
install -Dm644 ~/.config/omarchy/themes/terracotta/neovim.lua ~/.config/nvim/lua/plugins/theme_terracotta.lua
```

Open Neovim and run `:echo g:colors_name` to check the active scheme. Terracotta selects `oldtale` and applies its TypeScript and TSX highlights. When you switch desktop themes, LazyVim follows the selected theme. Repeat the copy after updating the theme to pick up changes to the highlights.

## Foot, eza and icons

The [Foot palette](foot.ini) uses `#4A4045` for the selection background and `#DFE1E5` for selected text. Omarchy generates its own Foot config for Git-installed themes.

[eza.yml](eza.yml) matches the folder colors in Neo-tree. To use it with eza, point `~/.config/eza/theme.yml` at `~/.local/state/omarchy/current/theme/eza.yml`.

The desktop icon preference references Oldtale-Blue, a separately installed local icon theme based on Yaru-blue. The icon pack is a separate dependency.

## Credits

The palette is derived from [WebStorm OldTale Dark](https://github.com/briginas/webstorm-oldtale-dark-theme). See the [license](LICENSE) and [third-party notices](THIRD_PARTY_NOTICES.md).
