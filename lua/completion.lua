local blink = require("blink.cmp")
blink.setup({
    keymap = {
        preset = "none",
        ["<c-k>"] = {
            function(cmp)
                if cmp.is_visible() then
                    cmp.select_prev()
                    return true
                end
                return false
            end,
            "fallback",
        },
        ["<c-j>"] = {
            function(cmp)
                if cmp.is_visible() then
                    cmp.select_next()
                    return true
                end
                return false
            end,
            "fallback",
        },
        ["<c-d>"] = { "scroll_documentation_down", "fallback" },
        ["<c-f>"] = { "scroll_documentation_up", "fallback" },
        ["<enter>"] = { "select_and_accept", "fallback" },
        ["<tab>"] = { "snippet_forward", "fallback" },
        ["<s-tab>"] = { "snippet_backward", "fallback" },
    },
    cmdline = {
        enabled = true,
        completion = {
            menu = {
                auto_show = true,
            },
        },
        keymap = {
            ["<c-cr>"] = { "select_and_accept", "fallback" },
            ["<c-j>"] = { "select_next", "fallback" },
            ["<c-k>"] = { "select_prev", "fallback" },
        },
        sources = function()
            local type = vim.fn.getcmdtype()
            -- Search forward and backward
            if type == "/" or type == "?" then
                return { "buffer" }
            end
            -- Commands
            if type == ":" or type == "@" then
                return { "cmdline", "cmp_cmdline" }
            end
            return {}
        end,
    },
    fuzzy = {
        sorts = {
            "exact",
            -- defaults
            "score",
            "sort_text",
        },
    },
    signature = {
        enabled = false,
        window = {
            show_documentation = true,
        },
    },
    completion = {
        menu = {
            draw = {
                treesitter = { "lsp" },
                components = {
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
        documentation = {
            auto_show = false,
        },
    },
    snippets = {
        preset = "luasnip",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "omni" },
        providers = {
            path = {
                score_offset = 50,
            },
            lsp = {
                score_offset = 40,
            },
            snippets = {
                score_offset = 40,
            },
            cmp_cmdline = {
                name = "cmp_cmdline",
                module = "blink.compat.source",
                score_offset = -100,
                opts = {
                    cmp_name = "cmdline",
                },
            },
        },
    },
})

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup()
