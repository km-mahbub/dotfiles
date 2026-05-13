# AGENTS.md

## Stow mechanics

This repo uses GNU Stow. All packages must be applied/removed from the repo root (`~/dotfiles`).

```bash
stow <package>       # e.g., stow zsh, stow tmux
stow -D <package>    # remove symlinks
stow -R <package>    # restow (remove + re-apply)
```

## Neovim config conflict

Three directories all symlink to `~/.config/nvim/` — only one can be active at a time:

| Directory | Config type |
|-----------|-------------|
| `nvim-kickstart/` | Primary (lazy.nvim, built from scratch) |
| `nvchad/` | NvChad-based alternative |
| `nvim-scratch/` | Experimental |

Switch by restowing the desired package. The others' symlinks will be removed automatically.

## Scripts path gotcha

Scripts are in a nested `scripts/scripts/` directory:

- tmux-sessionizer lives at `scripts/scripts/tmux-sessionizer`
- Must be installed to `~/scripts/tmux-sessionizer` and made executable (`chmod +x`)
- Triggered via tmux prefix + `f`

## OpenCode config location

OpenCode config is nested under `opencode/.config/opencode/opencode.json`, not at the repo root. This includes provider/model definitions.

## macOS window management prerequisites

Window tiling requires two external tools (documented in README.md):
- **Raycast** — handles window snapping via option+H/J/K/L/M
- **Karabiner Elements** — CapsLock is remapped to Hyper key; Raycast extension uses hyper+C for window focus cycling
