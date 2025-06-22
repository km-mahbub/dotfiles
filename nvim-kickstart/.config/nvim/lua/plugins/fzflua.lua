return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find Files in project directory",
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "Find by grepping in project directory",
        },
        {
            "<leader>fc",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find in neovim configuration",
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "[F]ind [H]elp",
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[F]ind [K]eymaps",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "[F]ind [B]uiltin FZF",
        },
        {
            "<leader>fw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "[F]ind current [W]ord",
        },
        {
            "<leader>fW",
            function()
                require("fzf-lua").grep_cWORD()
            end,
            desc = "[F]ind current [W]ORD",
        },
        {
            "<leader>fd",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "[F]ind [D]iagnostics",
        },
        {
            "<leader>fr",
            function()
                require("fzf-lua").resume()
            end,
            desc = "[F]ind [R]esume",
        },
        {
            "<leader>fo",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "[F]ind [O]ld Files",
        },
        {
            "<leader><leader>",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[,] Find existing buffers",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            desc = "[/] Live grep the current buffer",
        },
        {
            "<leader>ths",
            function()
                -- Defined themes from colorscheme.lua
                local themes = {
                    "rose-pine",
                    "gruvbox",
                    "kanagawa",
                    "solarized-osaka",
                    "tokyonight",
                }

                require("fzf-lua").fzf_exec(themes, {
                    prompt = "Themes> ",
                    actions = {
                        ["default"] = function(selected)
                            if selected and #selected > 0 then
                                local theme = selected[1]
                                vim.cmd("colorscheme " .. theme)

                                -- Optional: persist the theme
                                local config_path = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
                                local file = io.open(config_path, "w")
                                if file then
                                    file:write(string.format('vim.cmd("colorscheme %s")\n', theme))
                                    file:close()
                                end
                            end
                        end,
                    },
                    previewer = false,
                })
            end,
            desc = "Theme Switcher",
        },
    },
}
