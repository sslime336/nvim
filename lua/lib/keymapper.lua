local M = {}

local opts = {
    noremap = true,
    silent = true,
}

M.norenmap = function(lhs, rhs, desc)
    opts = opts or {}
    opts.desc = desc or rhs
    vim.keymap.set('n', lhs, rhs, opts)
end

M.noreimap = function(lhs, rhs, desc)
    opts = opts or {}
    opts.desc = desc or rhs
    vim.keymap.set('i', lhs, rhs, opts)
end

M.norevmap = function(lhs, rhs, desc)
    opts = opts or {}
    opts.desc = desc or rhs
    vim.keymap.set('v', lhs, rhs, opts)
end


M.noretmap = function(lhs, rhs, desc)
    opts = opts or {}
    opts.desc = desc or rhs
    vim.keymap.set('t', lhs, rhs, opts)
end


return M
