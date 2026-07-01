# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Targets **Neovim 0.12+** on macOS.

## Prerequisites

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

On Apple Silicon, add Homebrew to your path:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### CLI Tools

```bash
brew install neovim           # Editor (0.12+)
brew install ripgrep           # Fast text search (used by Telescope live grep)
brew install node              # Required by many LSP servers
brew install tree-sitter-cli   # Required by nvim-treesitter to compile parsers
```

### Nerd Font (required for icons)

Install a Nerd Font — without it, file icons and UI glyphs show as question marks:

```bash
brew install --cask font-fira-code-nerd-font
```

Then set the font in your terminal:

- **iTerm2**: `Cmd + ,` > Profiles > Text > Font > **FiraCode Nerd Font Mono**
- **Alacritty / Kitty / WezTerm**: update the font family in your config file

### Optional Tools

```bash
brew install jesseduffield/lazygit/lazygit   # Terminal git UI (if you add lazygit.nvim)
brew install gofumpt                         # Go formatter (if working with Go)
```

## Installation

1. Back up any existing config:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. Clone this repo:

```bash
git clone <your-repo-url> ~/.config/nvim
```

3. Open Neovim:

```bash
nvim
```

On first launch, lazy.nvim will auto-install itself, then install all plugins. Treesitter parsers will download and compile automatically. Mason will install configured LSP servers and formatters. This takes a minute or two on the first run.

4. Verify everything is healthy:

```
:checkhealth
```

## Directory Structure

```
~/.config/nvim/
├── init.lua                          # Entry point
├── lazy-lock.json                    # Plugin version lock file
└── lua/jinhan/
    ├── core/
    │   ├── init.lua                  # Loads core modules
    │   ├── options.lua               # Neovim options
    │   ├── keymaps.lua               # General keymaps
    │   └── api.lua                   # Autocommands & :Claude command
    ├── lazy.lua                      # lazy.nvim bootstrap
    └── plugins/
        ├── init.lua                  # Foundation plugins (plenary, tmux-navigator)
        ├── colorscheme.lua           # Theme
        ├── treesitter.lua            # Syntax highlighting & indentation
        ├── nvim-ts-autotag.lua       # Auto close/rename HTML tags
        ├── nvim-treesitter-context.lua # Sticky function context
        ├── nvim-tree.lua             # File explorer
        ├── telescope.lua             # Fuzzy finder
        ├── nvim-cmp.lua              # Autocompletion
        ├── autopairs.lua             # Auto bracket pairs
        ├── surround.lua              # Surround text objects
        ├── formatting.lua            # Code formatting (conform.nvim)
        ├── trouble.lua               # Diagnostics panel
        ├── todo-comments.lua         # TODO/FIXME highlighting
        ├── gitsigns.lua              # Git signs & inline blame
        ├── lualine.lua               # Status line
        ├── bufferline.lua            # Tab line
        ├── indent-blankline.lua      # Indentation guides
        ├── markdown-preview.lua      # Live markdown preview in browser
        ├── scrollbar.lua             # Scrollbar with diagnostics
        ├── vim-illuminate.lua        # Highlight word under cursor
        ├── vim-maximizer.lua         # Maximize/restore splits
        ├── which-key.lua             # Keymap hints popup
        ├── dressing.lua              # Improved UI for inputs/selects
        └── lsp/
            ├── mason.lua             # LSP server installer & config
            └── lspconfig.lua         # LSP keymaps & diagnostics
```

## Core Settings

| Setting       | Value                                             |
| ------------- | ------------------------------------------------- |
| Leader key    | `Space`                                           |
| Line numbers  | Relative + absolute on cursor line                |
| Tabs          | 2 spaces                                          |
| Line wrap     | Off                                               |
| Search        | Case-insensitive (smart case when uppercase used) |
| Clipboard     | System clipboard                                  |
| Swapfile      | Disabled                                          |
| Scroll offset | 10 lines                                          |
| True color    | Enabled                                           |

## Plugins

### Theme & Appearance

| Plugin                                                                          | Description                                                                         |
| ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| [onedark.nvim](https://github.com/navarasu/onedark.nvim)                        | One Dark colorscheme with transparent background                                    |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                    | Status line at the bottom showing mode, file, git branch, diagnostics               |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                   | Tab bar at the top with slant-style separators                                      |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Vertical indentation guide lines                                                    |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)                  | Scrollbar on the right showing cursor, search matches, diagnostics, and git changes |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)             | File type icons used by many plugins (requires Nerd Font)                           |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)                      | Better-looking UI for rename prompts, code action menus, and other input dialogs    |

### Navigation & File Management

| Plugin                                                                                   | Description                                                                  |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                              | File explorer sidebar with git status indicators                             |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                       | Fuzzy finder for files, text, LSP symbols, diagnostics, and more             |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorting algorithm for Telescope (faster matching)                        |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)                  | Seamless navigation between Neovim splits and tmux panes with `Ctrl+h/j/k/l` |
| [vim-maximizer](https://github.com/szw/vim-maximizer)                                    | Toggle maximize/restore for the current split window                         |

### Syntax & Editing

| Plugin                                                                                | Description                                                              |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                 | Treesitter-based syntax highlighting, indentation, and code parsing      |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Shows the current function/class/block as a sticky header when scrolling |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                          | Auto close and auto rename HTML/JSX tags                                 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                            | Auto close brackets, quotes, and other pairs                             |
| [nvim-surround](https://github.com/kylechui/nvim-surround)                            | Add, change, and delete surrounding characters (`ys`, `cs`, `ds`)        |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate)                            | Highlights all occurrences of the word under the cursor                  |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                     | Highlights TODO, FIXME, HACK, NOTE comments and lets you search them     |

### Autocompletion & Snippets

| Plugin                                                               | Description                                             |
| -------------------------------------------------------------------- | ------------------------------------------------------- |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                      | Completion engine with multiple sources                 |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)              | LSP completion source                                   |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                  | Buffer text completion source                           |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                      | File path completion source                             |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                       | Snippet engine                                          |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Collection of VS Code-style snippets for many languages |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim)              | VS Code-like icons in the completion menu               |

### LSP & Diagnostics

| Plugin                                                                                    | Description                                                         |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                | Configurations for Neovim's built-in LSP client                     |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                  | Package manager for LSP servers, formatters, and linters            |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)              | Bridges Mason with lspconfig for automatic server setup             |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-installs formatters and linters via Mason                      |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim)                                     | Neovim Lua API completions and type checking for plugin development |
| [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)        | Syncs file renames/moves with LSP (updates imports automatically)   |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                     | Pretty diagnostics list, quickfix, and TODO viewer                  |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                  | Code formatter with format-on-save                                  |

### Git

| Plugin                                                      | Description                                                                |
| ----------------------------------------------------------- | -------------------------------------------------------------------------- |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git change indicators in the sign column, inline blame on the current line |

### Markdown

| Plugin                                                                   | Description                                                 |
| ------------------------------------------------------------------------ | ----------------------------------------------------------- |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Live markdown preview in the browser via `:MarkdownPreview` |

### Utilities

| Plugin                                                    | Description                                                             |
| --------------------------------------------------------- | ----------------------------------------------------------------------- |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)  | Lua utility library used by Telescope, todo-comments, and others        |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup showing available keybindings when you start pressing a key combo |

## LSP Servers (auto-installed via Mason)

| Server          | Language                      |
| --------------- | ----------------------------- |
| `ts_ls`         | TypeScript / JavaScript       |
| `lua_ls`        | Lua                           |
| `bashls`        | Bash                          |
| `html`          | HTML                          |
| `cssls`         | CSS                           |
| `tailwindcss`   | Tailwind CSS                  |
| `eslint`        | JavaScript/TypeScript linting |
| `biome`         | JavaScript/TypeScript         |
| `graphql`       | GraphQL                       |
| `pyright`       | Python                        |
| `gopls`         | Go                            |
| `rust_analyzer` | Rust                          |
| `dockerls`      | Dockerfile                    |
| `yamlls`        | YAML                          |
| `ltex`          | LaTeX / Markdown (grammar)    |
| `solang`        | Solidity                      |

## Formatters (auto-installed via Mason)

| Formatter  | Languages                                                                  |
| ---------- | -------------------------------------------------------------------------- |
| `prettier` | JS, TS, JSX, TSX, CSS, HTML, JSON, YAML, Markdown, GraphQL, Svelte, Liquid |
| `stylua`   | Lua                                                                        |
| `black`    | Python                                                                     |

Format-on-save is enabled by default. Manual format: `<leader>mp`.

## Keymaps

### General

| Keymap       | Mode     | Action                  |
| ------------ | -------- | ----------------------- |
| `jk`         | Insert   | Exit insert mode        |
| `<C-s>`      | Normal   | Save file               |
| `<C-S-s>`    | Normal   | Save without formatting |
| `<leader>nh` | Normal   | Clear search highlights |
| `<leader>+`  | Normal   | Increment number        |
| `<leader>-`  | Normal   | Decrement number        |
| `<C-[>`      | Terminal | Exit terminal mode      |

### Window & Tab Management

| Keymap       | Mode   | Action                         |
| ------------ | ------ | ------------------------------ |
| `<leader>sv` | Normal | Split window vertically        |
| `<leader>sh` | Normal | Split window horizontally      |
| `<leader>se` | Normal | Make splits equal size         |
| `<leader>sx` | Normal | Close current split            |
| `<leader>sm` | Normal | Maximize/restore current split |
| `<leader>to` | Normal | Open new tab                   |
| `<leader>tx` | Normal | Close current tab              |
| `<leader>tn` | Normal | Go to next tab                 |
| `<leader>tp` | Normal | Go to previous tab             |
| `<leader>tf` | Normal | Open current buffer in new tab |

### File Explorer (nvim-tree)

| Keymap       | Mode   | Action                          |
| ------------ | ------ | ------------------------------- |
| `<C-S-e>`    | Normal | Toggle file explorer            |
| `<leader>ef` | Normal | Toggle explorer on current file |
| `<leader>ec` | Normal | Collapse all folders            |
| `<leader>er` | Normal | Refresh explorer                |

### Fuzzy Finder (Telescope)

| Keymap       | Mode   | Action                             |
| ------------ | ------ | ---------------------------------- |
| `<C-p>`      | Normal | Find files                         |
| `<leader>fr` | Normal | Recent files                       |
| `<leader>fs` | Normal | Live grep (search text in project) |
| `<leader>fc` | Normal | Find string under cursor           |

Inside Telescope: `<C-k>`/`<C-j>` to navigate, `<C-q>` to send to quickfix.

### LSP

| Keymap       | Mode          | Action                                   |
| ------------ | ------------- | ---------------------------------------- |
| `gd`         | Normal        | Go to definition                         |
| `gD`         | Normal        | Go to declaration                        |
| `gR`         | Normal        | Show references                          |
| `gi`         | Normal        | Show implementations                     |
| `gt`         | Normal        | Show type definitions                    |
| `H`          | Normal        | Hover documentation (like VS Code hover) |
| `<leader>ca` | Normal/Visual | Code actions                             |
| `<leader>rn` | Normal        | Rename symbol                            |
| `<leader>d`  | Normal        | Show line diagnostics                    |
| `<leader>D`  | Normal        | Show buffer diagnostics                  |
| `[d`         | Normal        | Go to previous diagnostic                |
| `]d`         | Normal        | Go to next diagnostic                    |
| `<leader>rs` | Normal        | Restart LSP                              |

### Formatting

| Keymap       | Mode          | Action                   |
| ------------ | ------------- | ------------------------ |
| `<leader>mp` | Normal/Visual | Format file or selection |

### Diagnostics (Trouble)

| Keymap       | Mode   | Action                |
| ------------ | ------ | --------------------- |
| `<leader>xw` | Normal | Workspace diagnostics |
| `<leader>xd` | Normal | Document diagnostics  |
| `<leader>xq` | Normal | Quickfix list         |
| `<leader>xl` | Normal | Location list         |
| `<leader>xt` | Normal | TODOs                 |

### Surround

| Keymap             | Mode   | Action                                                        |
| ------------------ | ------ | ------------------------------------------------------------- |
| `ys{motion}{char}` | Normal | Add surrounding (e.g., `ysiw"` to surround word with quotes)  |
| `cs{old}{new}`     | Normal | Change surrounding (e.g., `cs"'` to change `"` to `'`)        |
| `ds{char}`         | Normal | Delete surrounding (e.g., `ds"` to remove surrounding quotes) |

### Word Highlight (vim-illuminate)

| Keymap  | Mode   | Action                                          |
| ------- | ------ | ----------------------------------------------- |
| `<M-n>` | Normal | Jump to next reference of word under cursor     |
| `<M-p>` | Normal | Jump to previous reference of word under cursor |

### Claude CLI

| Command   | Action                                |
| --------- | ------------------------------------- |
| `:Claude` | Open Claude CLI in a new tab terminal |

## WSL Support

If running inside WSL, the config automatically hooks into `clip.exe` for system clipboard integration on yank.

## Updating

To update all plugins:

```
:Lazy sync
```

To update treesitter parsers:

```
:TSUpdate
```

To update LSP servers and formatters:

```
:Mason
```

Then press `U` to update all.

## Troubleshooting

- **Icons show as question marks**: Make sure a Nerd Font is installed and set as your terminal font
- **Treesitter parsers fail to compile**: Make sure `tree-sitter-cli` is installed (`brew install tree-sitter-cli`) and a C compiler is available
- **LSP server not starting**: Run `:Mason` to check install status, then `:LspInfo` to see active servers
- **Format on save not working**: Check `:ConformInfo` to verify the formatter is detected
- **Telescope live grep not working**: Make sure `ripgrep` is installed (`brew install ripgrep`)
