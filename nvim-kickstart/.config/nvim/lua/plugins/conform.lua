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
            dprint = {
                condition = function()
                    -- Get current buffer's filename directly (no ctx)
                    local filename = vim.api.nvim_buf_get_name(0)
                    if filename == nil or filename == "" then
                        return false
                    end

                    -- Directory of the current file
                    local dir = vim.fs.dirname(filename)
                    if not dir then
                        return false
                    end

                    -- Search upward for dprint config
                    local found = vim.fs.find(
                        { "dprint.json", "dprint.jsonc" },
                        { path = dir, upward = true, type = "file" }
                    )

                    return not vim.tbl_isempty(found)
                end,
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
