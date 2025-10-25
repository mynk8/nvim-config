-- Utility functions
-- This file contains helper functions used throughout the configuration

local M = {}

-- ============================================================================
-- GENERAL UTILITIES
-- ============================================================================

-- Check if a plugin is available
function M.has(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
end

-- Check if a command exists
function M.has_command(command)
    return vim.fn.executable(command) == 1
end

-- ============================================================================
-- BUFFER UTILITIES
-- ============================================================================

-- Get the current buffer name
function M.get_buffer_name()
    return vim.api.nvim_buf_get_name(0)
end

-- Check if current buffer is empty
function M.is_buffer_empty()
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

-- ============================================================================
-- WINDOW UTILITIES
-- ============================================================================

-- Get current window width
function M.get_window_width()
    return vim.api.nvim_win_get_width(0)
end

-- Get current window height
function M.get_window_height()
    return vim.api.nvim_win_get_height(0)
end

-- ============================================================================
-- STRING UTILITIES
-- ============================================================================

-- Trim whitespace from string
function M.trim(str)
    return str:match("^%s*(.-)%s*$")
end

-- Check if string starts with prefix
function M.starts_with(str, prefix)
    return str:sub(1, #prefix) == prefix
end

-- Check if string ends with suffix
function M.ends_with(str, suffix)
    return str:sub(-#suffix) == suffix
end

-- ============================================================================
-- TABLE UTILITIES
-- ============================================================================

-- Deep copy a table
function M.deep_copy(orig)
    local copy
    if type(orig) == "table" then
        copy = {}
        for key, value in next, orig, nil do
            copy[M.deep_copy(key)] = M.deep_copy(value)
        end
        setmetatable(copy, M.deep_copy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

-- Merge two tables
function M.merge(t1, t2)
    local result = M.deep_copy(t1)
    for k, v in pairs(t2) do
        result[k] = v
    end
    return result
end

-- ============================================================================
-- NOTIFICATION UTILITIES
-- ============================================================================

-- Show notification with title
function M.notify(message, level, title)
    vim.notify(message, level, { title = title or "Neovim" })
end

-- Show error notification
function M.notify_error(message, title)
    M.notify(message, vim.log.levels.ERROR, title)
end

-- Show warning notification
function M.notify_warn(message, title)
    M.notify(message, vim.log.levels.WARN, title)
end

-- Show info notification
function M.notify_info(message, title)
    M.notify(message, vim.log.levels.INFO, title)
end

return M