return {
    "pmizio/typescript-tools.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
        settings = {
            tsserver_preferences = {
                importModuleSpecifierPreference = "relative",
                importModuleSpecifierEnding = "minimal",
                includePackageJsonAutoImports = "off",
            },
            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
    config = function(_, opts)
        require("typescript-tools").setup(opts)
    end,
}
