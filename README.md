# Terracotta

A dark Omarchy theme with clay-colored window borders, charcoal backgrounds and muted rose accents. It includes a Foot palette, an OldTale configuration for LazyVim, eza directory colors and four wallpapers.

![Terracotta preview](preview.png)

## Install on Omarchy

On a fresh setup, run the following to let VS Code and VS Code Insiders keep their own themes while Terracotta is active. The links follow Omarchy’s active theme directory. If you already have a theme-sync preference, keep your existing setting.

```sh
toggles="$HOME/.local/state/omarchy/toggles"
mkdir -p "$toggles"
for flag in skip-vscode-theme-changes skip-vscode-insiders-theme-changes; do
  if [ ! -e "$toggles/$flag" ] && [ ! -L "$toggles/$flag" ]; then
    ln -s ../current/theme/skip-vscode-theme-changes "$toggles/$flag"
  fi
done
```

Install the desktop palette and wallpapers with the Omarchy theme installer. Back up any existing local theme named `terracotta` first, as the installer replaces that directory.

```sh
omarchy theme install https://github.com/briginas/omarchy-terracotta-theme
```

## Foot, LazyVim and icons

Omarchy generates terminal and Neovim configs for Git-installed themes. The exact local customizations are included as [foot.ini](foot.ini) and [neovim.lua](neovim.lua) for review and use in your own configuration. Foot uses `#4A4045` for the selection background and `#DFE1E5` for selected text. The LazyVim plugin spec configures [OldTale](https://github.com/topazape/oldtale.nvim) and includes distinct LSP highlights for TypeScript and TSX.

[eza.yml](eza.yml) matches the folder colors in Neo-tree. To use it with eza, point `~/.config/eza/theme.yml` at `~/.local/state/omarchy/current/theme/eza.yml`.

The desktop icon preference references Oldtale-Blue, a separately installed local icon theme based on Yaru-blue. The icon pack is a separate dependency.

## Credits

The palette is derived from [WebStorm OldTale Dark](https://github.com/briginas/webstorm-oldtale-dark-theme). See the [license](LICENSE) and [third-party notices](THIRD_PARTY_NOTICES.md).
