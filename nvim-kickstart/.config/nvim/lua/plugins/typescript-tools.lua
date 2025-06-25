return {
    "pmizio/typescript-tools.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
        settings = {
            typescript = {
                inlayHints = {
                    -- You can set this to 'all' or 'literals' to enable more hints
                    includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all'
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = false,
                    includeInlayVariableTypeHints = false,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = false,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    -- You can set this to 'all' or 'literals' to enable more hints
                    includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all'
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayVariableTypeHints = false,
                    includeInlayFunctionParameterTypeHints = false,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = false,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },
}
