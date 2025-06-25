return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            biome = {
                require_cwd = true,
            },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt" },
            -- Conform will run the first available formatter
            javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
            -- css = { "prettierd", "prettier", stop_after_first = true },
            -- html = { "prettierd", "prettier", stop_after_first = true },
            json = { "biome", "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
