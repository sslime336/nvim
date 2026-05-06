local M = {}

M.map = function(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc or rhs
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
