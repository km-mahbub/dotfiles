# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow "package" — its contents mirror the `$HOME` directory structure and get symlinked there.

## Applying Dotfiles

```bash
# Symlink a package to $HOME
stow <package>          # e.g., stow zsh, stow nvim-kickstart

# Remove symlinks for a package
stow -D <package>

# Restow (remove + re-apply)
stow -R <package>
```

Run stow from the repo root (`~/dotfiles`).

## Repository Structure

| Directory | Target | Purpose |
|-----------|--------|---------|
| `zsh/` | `~/.zshrc` | Zsh config: starship, nvm, pnpm, cargo, lm studio |
| `nvim-kickstart/` | `~/.config/nvim/` | **Primary** Neovim config (lazy.nvim, built from scratch) |
| `nvchad/` | `~/.config/nvim/` | NvChad-based Neovim config (alternative) |
| `nvim-scratch/` | `~/.config/nvim/` | Experimental Neovim config |
| `tmux/` | `~/.config/tmux/` | Tmux config + TPM plugins (bundled) |
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal config |
| `alacritty/` | `~/.config/alacritty/` | Alacritty terminal config |
| `starship/` | `~/.config/starship.toml` | Starship prompt |
| `scripts/` | `~/scripts/` | Shell scripts (tmux-sessionizer) |

Only one Neovim config can be active at a time — use stow to switch between them.

## Neovim (nvim-kickstart) Architecture

Entry point: `nvim-kickstart/.config/nvim/init.lua` loads `config.lazy`, `current-theme`, `config.autocmd`, and `terminalpop`.

```
lua/
  config/         # Core settings
    lazy.lua      # lazy.nvim bootstrap and plugin loading
    keymaps.lua   # Global keymaps
    options.lua   # Vim options
    autocmd.lua   # Autocommands
  plugins/        # One file per plugin spec (returned as lazy.nvim plugin tables)
  current-theme.lua
  terminalpop.lua
```

Plugins of note: `fzf-lua` (fuzzy finder), `blink-cmp` (completion), `conform.nvim` (formatting), `nvim-lint`, `oil.nvim` (file explorer), `harpoon`, `rustacean.nvim`, `typescript-tools`, `nvim-dap`, `neotest`, `snacks.nvim`, `noice.nvim`.

## Tmux Key Bindings

- Prefix: `C-a`
- `prefix + r` — reload tmux.conf
- `prefix + |` / `prefix + -` — split horizontal/vertical
- `prefix + f` — launch tmux-sessionizer (fzf over `~/dotfiles` and `~/dev`)
- `prefix + o` — tmux-sessionx session picker
- `prefix + m` — maximize/zoom pane
- `prefix + v` — enter copy mode (vi keys: `v` to select, `y` to yank)

TPM plugins: catppuccin theme, vim-tmux-navigator, sessionx, resurrect, continuum, online-status, battery.

## Ghostty Key Bindings

Uses `cmd+s` as a leader key:
- `cmd+s > r` — reload config
- `cmd+s > \` / `cmd+s > -` — split right/down
- `cmd+s > h/j/k/l` — navigate splits
- `cmd+s > c` — new tab, `cmd+s > 1-9` — go to tab

## tmux-sessionizer

`scripts/scripts/tmux-sessionizer` — searches `~/dotfiles` and `~/dev` with `fd + fzf`, then creates or switches to a tmux session named after the selected directory. Triggered via `prefix + f` in tmux.

Must be installed at `~/scripts/tmux-sessionizer` and made executable (`chmod +x`).

## macOS Window Management

Requires Raycast + Karabiner Elements. CapsLock is configured as a Hyper key via Karabiner. Raycast handles window snapping via `option+H/J/K/L/M`.
