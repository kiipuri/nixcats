local function colorCallback()
    vim.cmd.colorscheme("base16-catppuccin-mocha")
    local colors = require("base16-colorscheme").colors
    require("lualine").setup({
        componentSeparators = { left = "", right = "" },
        options = { globalstatus = true, theme = "base16" },
        sectionSeparators = { left = "", right = "" },
        sections = {
            lualine_a = {
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    "diagnostics",
                    always_visible = true,
                    color = { bg = colors.base02, fg = colors.base01 },
                    colored = true,
                    padding = 0,
                    sections = { "error", "warn" },
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " " },
                    update_in_insert = false,
                },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
            lualine_b = {
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { "hostname", color = { bg = colors.base02, fg = colors.base08 }, padding = 0 },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
            lualine_c = {
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { "filename", color = { bg = colors.base02, fg = colors.base09 }, padding = 0 },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
            lualine_x = {
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    '(function()\n  local clients = vim.lsp.get_clients()\n  local client_names = ""\n  for k, c in pairs(clients) do\n    client_names = client_names .. c.config.name .. " "\n  end\n\n  if client_names ~= "" then\n    client_names = client_names:sub(1, -2)\n  end\n\n  return client_names\nend)()\n',
                    color = { bg = colors.base02, fg = colors.base05 },
                    padding = 0,
                },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
            lualine_y = {
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    "filetype",
                    color = { bg = colors.base02, fg = colors.base0A },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
            lualine_z = {
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    '(function()\n  return "%P/%L"\nend)()\n',
                    color = { bg = colors.base02, fg = colors.base0B },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                {
                    '(function()\n  return ""\nend)()\n',
                    color = { bg = colors.base00, fg = colors.base02 },
                    padding = 0,
                    separator = { left = nil, right = nil },
                },
                { '(function()\n  return " "\nend)()\n', color = { bg = colors.base00 }, padding = 0 },
            },
        },
    })

    local highlights = {
        IlluminatedWordRead = { link = "Visual" },
        IlluminatedWordText = { link = "Visual" },
        IlluminatedWordWrite = { link = "Visual" },
        -- SLError = { bg = colors.base02, fg = "#f38ba8" },
        -- SLWarning = { bg = colors.base02, fg = "#cba6f7" },
        StatusLine = { bg = colors.base00, fg = colors.base02 },
        lualine_c_command = { bg = "NONE", fg = "NONE" },
        lualine_c_inactive = { bg = "NONE", fg = "NONE" },
        lualine_c_insert = { bg = "NONE", fg = "NONE" },
        lualine_c_normal = { bg = "NONE", fg = "NONE" },
        lualine_c_replace = { bg = "NONE", fg = "NONE" },
        lualine_c_terminal = { bg = "NONE", fg = "NONE" },
        lualine_c_visual = { bg = "NONE", fg = "NONE" },
    }

    for k, v in pairs(highlights) do
        vim.api.nvim_set_hl(0, k, v)
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = colorCallback,
})

require("lze").load({
    "lualine.nvim",
    event = "DeferredUIEnter",
    after = function()
        colorCallback()
    end,
})
