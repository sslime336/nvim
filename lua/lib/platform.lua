-- 用于设置跟平台相关的配置

---@class platform
---@field line_seperator string
---@field OSType OSType
local M = {
    ---@class OSType
    ---@field Windows string
    ---@field macos string
    ---@field Linux string
    OSType = {
        Windows = "Windows",
        macos = "macos",
        Linux = "Linux",
    }
}

local is_windows = package.config:sub(1, 1) == "\\"
local sysname = vim.uv.os_uname().sysname or ""

if sysname == "Darwin" then
    -- macOS
    M.line_seperator = '/'
    M.os = M.OSType.macos
elseif sysname == "Linux" then
    -- Linux
    M.line_seperator = '/'
    M.os = M.OSType.Linux
elseif is_windows then
    -- Windows
    M.line_seperator = '\\'
    M.os = M.OSType.Windows
end

return M
