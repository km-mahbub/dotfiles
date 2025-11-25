return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            biome = {
                require_cwd = true,
            },
            zigfmt = {
                command = "zig",
                args = { "fmt", "--stdin" },
                stdin = true,
            },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt" },
            -- Conform will run the first available formatter
            javascript = { "dprint", "biome", "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "dprint", "biome", "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "dprint", "biome", "prettierd", "prettier", stop_after_first = true },
            typescript = { "dprint", "biome", "prettierd", "prettier", stop_after_first = true },
            -- css = { "prettierd", "prettier", stop_after_first = true },
            -- html = { "prettierd", "prettier", stop_after_first = true },
            json = { "dprint", "biome", "prettierd", "prettier", stop_after_first = true },
            zig = { "zigfmt" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            -- lsp_format = "fallback",
        },
    },
}
