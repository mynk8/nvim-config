-- Autocommands configuration
-- This file contains all Neovim autocommands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ============================================================================
-- GENERAL AUTOCMD GROUPS
-- ============================================================================

local general = augroup("General", { clear = true })
local lsp = augroup("LSP", { clear = true })
local formatting = augroup("Formatting", { clear = true })

-- ============================================================================
-- GENERAL AUTOCMDS
-- ============================================================================

-- Highlight on yank
autocmd("TextYankPost", {
    group = general,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
    group = general,
    pattern = "*",
    command = "wincmd =",
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
    group = general,
    pattern = "*",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- ============================================================================
-- LSP AUTOCMDS
-- ============================================================================

-- LSP attach autocommand
autocmd("LspAttach", {
    group = lsp,
    pattern = "*",
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = ev.buf,
                callback = function()
                    vim.diagnostic.open_float(nil, { focus = false })
                end,
            })
        end
    end,
})

-- ============================================================================
-- FORMATTING AUTOCMDS
-- ============================================================================

-- Auto-format on save for specific file types
autocmd("BufWritePre", {
    group = formatting,
    pattern = { "*.lua", "*.js", "*.ts", "*.json", "*.html", "*.css", "*.md" },
    callback = function()
        require("conform").format { lsp_fallback = true }
    end,
})