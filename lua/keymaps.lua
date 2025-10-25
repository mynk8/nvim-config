-- Keymaps configuration
-- This file contains all keymaps for the Neovim configuration

local map = vim.keymap.set

-- ============================================================================
-- GENERAL KEYMAPS
-- ============================================================================

-- Clear search highlights
map({ "i", "n" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Quick save
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Quick quit
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })

-- Toggle line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Copy whole file
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ============================================================================
-- INSERT MODE KEYMAPS
-- ============================================================================

-- Better insert mode navigation
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- ============================================================================
-- VISUAL MODE KEYMAPS
-- ============================================================================

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Better paste
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- ============================================================================
-- BUFFER NAVIGATION
-- ============================================================================

map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- ============================================================================
-- TELESCOPE KEYMAPS
-- ============================================================================

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Find all files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep (alt)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Pick hidden term" })

-- ============================================================================
-- NVIM-TREE KEYMAPS
-- ============================================================================

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- ============================================================================
-- TERMINAL KEYMAPS
-- ============================================================================

map("n", "<leader>t", "<cmd>terminal<CR>", { desc = "Open terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode (alt)" })

-- ============================================================================
-- TROUBLE KEYMAPS
-- ============================================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle diagnostics for current buffer" })
map("n", "<leader>cs", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>", { desc = "Toggle error diagnostics" })
map("n", "<leader>cl", "<cmd>Trouble loclist toggle<cr>", { desc = "Toggle location list" })
map("n", "<leader>cq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Toggle quickfix list" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle filter.buf=0<cr>", { desc = "Toggle location list for current buffer" })
map("n", "<leader>xQ", "<cmd>Trouble quickfix toggle filter.buf=0<cr>", { desc = "Toggle quickfix list for current buffer" })

-- ============================================================================
-- COMMENT KEYMAPS
-- ============================================================================

map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- ============================================================================
-- FORMATTING KEYMAPS
-- ============================================================================

map({ "n", "x" }, "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- ============================================================================
-- LSP KEYMAPS
-- ============================================================================

-- These will be set up in the LSP configuration
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open float" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
