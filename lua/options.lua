vim.o.completeopt = "menu,menuone,popup,fuzzy" -- Modern completion menu
vim.o.pumheight = 10                           -- Max height of completion menu
vim.o.foldenable = true                        -- Enable folding
vim.o.foldlevel = 99                           -- Start editing with all folds opened
vim.o.foldmethod = "expr"                      -- Use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.termguicolors = true                     -- Enable RGB colors
vim.o.cursorline = true                        -- Highlight current line
vim.o.number = true                            -- Show line numbers
vim.o.relativenumber = true                    -- Show relative line numbers
vim.o.signcolumn = "yes"                       -- Always show sign column
vim.o.clipboard = "unnamedplus"

-- Special characters for list mode
vim.o.list = true -- Show special characters
vim.opt.listchars = {
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
}
vim.o.ignorecase = true                -- Case-insensitive search
vim.o.smartcase = true                 -- Case-sensitive when uppercase in pattern
vim.o.smartindent = true               -- Auto-indenting for new lines
vim.o.shiftround = true                -- Round indent to multiple of shiftwidth
vim.o.shiftwidth = 0                   -- 0 to follow tabstop value
vim.o.tabstop = 4                      -- Tab width
vim.o.undofile = true                  -- Enable persistent undo
vim.o.undolevels = 10000               -- 10x more undo levels

vim.o.updatetime = 200                 -- Save swap file with 200ms debouncing
vim.o.confirm = true                   -- Show dialog for unsaved files before quit
vim.opt.diffopt:append("linematch:60") -- Second stage diff to align lines
vim.g.netrw_banner = 0                 -- Disable netrw banner
vim.cmd("colorscheme retrobox")
