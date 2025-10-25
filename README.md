# Neovim Configuration

## Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── options.lua       # Neovim options and settings
│   ├── keymaps.lua       # All key mappings
│   ├── autocommands.lua  # Autocommands
│   ├── utils.lua         # Utility functions
│   ├── plugins.lua       # Plugin specifications
│   ├── lspconf.lua       # LSP configuration
│   ├── treesitter.lua    # Treesitter configuration
│   ├── nvimtree.lua      # File explorer configuration
│   └── blinkcmp.lua      # Completion configuration
└── README.md             # This file
```

## Key Mappings

### General
- `<leader>` = Space
- `<C-s>` = Save file
- `<leader>q` = Quit
- `<leader>wq` = Save and quit
- `<Esc>` = Clear search highlights

### Navigation
- `<C-h/j/k/l>` = Window navigation
- `<C-Up/Down/Left/Right>` = Resize windows
- `<S-h/l>` = Buffer navigation
- `<leader>bd` = Delete buffer

### File Operations
- `<leader>ff` = Find files
- `<leader>fa` = Find all files (including hidden)
- `<leader>fg` = Live grep
- `<leader>fb` = Find buffers
- `<C-n>` = Toggle file explorer
- `<leader>e` = Focus file explorer

### LSP
- `gd` = Go to definition
- `gD` = Go to declaration
- `gr` = References
- `gi` = Go to implementation
- `K` = Hover documentation
- `<leader>rn` = Rename
- `<leader>ca` = Code actions
- `[d` / `]d` = Navigate diagnostics

### Comments
- `<leader>/` = Toggle comment (normal/visual mode)

### Formatting
- `<leader>fm` = Format file

### Diagnostics
- `<leader>xx` = Toggle diagnostics
- `<leader>xX` = Toggle buffer diagnostics
- `<leader>cs` = Toggle error diagnostics
