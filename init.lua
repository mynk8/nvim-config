-- Neovim Configuration
-- Main entry point for the Neovim configuration

-- ============================================================================
-- LEADER KEY SETUP
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- LAZY.NVIM SETUP
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- PLUGIN MANAGER CONFIGURATION
-- ============================================================================

local lazy = require("lazy")
lazy.setup({
    spec = {
        { import = "plugins" },
    },
    defaults = { lazy = true },
    install = { colorscheme = { "oxocarbon" } },
    performance = {
        rtp = {
            disabled_plugins = {
                -- Disable built-in plugins for better performance
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})

-- ============================================================================
-- CONFIGURATION LOADING
-- ============================================================================

-- Load core configuration
require("options")        -- Basic Neovim options
require("keymaps")        -- Key mappings
require("autocommands")   -- Autocommands
