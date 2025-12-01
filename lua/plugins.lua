-- Plugin configuration
-- This file contains all plugin specifications and their configurations

return {
    -- ============================================================================
    -- DEPENDENCIES
    -- ============================================================================
    
    "nvim-lua/plenary.nvim", -- Required by many plugins

    -- ============================================================================
    -- COLORSCHEMES
    -- ============================================================================
    
	"rebelot/kanagawa.nvim",
	
    -- ============================================================================
    -- LSP & COMPLETION
    -- ============================================================================
    
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = function()
            require("lspconf")
        end,
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            { "windwp/nvim-autopairs", opts = {} },
        },
        opts = function()
            return require("blinkcmp")
        end,
    },

    -- ============================================================================
    -- TREESITTER
    -- ============================================================================
    
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require("treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- ============================================================================
    -- FILE EXPLORER
    -- ============================================================================
    
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require("nvimtree")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    -- ============================================================================
    -- TELESCOPE
    -- ============================================================================
    
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = {
            defaults = {
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top" },
                },
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
        end,
    },

    -- ============================================================================
    -- DIAGNOSTICS & TROUBLESHOOTING
    -- ============================================================================
    
    {
        "folke/trouble.nvim",
        opts = {
            auto_close = true,
            modes = {
                preview_float = {
                    mode = "diagnostics",
                    preview = {
                        type = "float",
                        relative = "editor",
                        border = "rounded",
                        title = "Preview",
                        title_pos = "center",
                        position = { 0, -2 },
                        size = { width = 0.3, height = 0.3 },
                        zIndex = 200,
                    }
                }
            }
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        }
    },

    -- ============================================================================
    -- FORMATTING
    -- ============================================================================
    
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = { 
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                markdown = { "prettier" },
            },
        },
    },

    -- ============================================================================
    -- GIT
    -- ============================================================================
    
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- ============================================================================
    -- COMMENTS
    -- ============================================================================
    
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },

    -- ============================================================================
    -- STATUSLINE
    -- ============================================================================
    
    {
        "echasnovski/mini.statusline",
        lazy = false,
        opts = {},
        config = function()
            require('mini.statusline').setup()
        end,
    },
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end
	}
}
