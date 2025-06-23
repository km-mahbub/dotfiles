return {
    "thePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        local conf = require("telescope.config").values
        local wk = require("which-key")

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                save_on_change = true,
            },
        })

        -- NOTE: Experimenting
        -- Telescope into Harpoon function
        -- comment this function if you don't like it
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end
            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        --Harpoon Nav Interface
        wk.add({
            -- The first key you are pressing
            { "<leader>h", group = "harpoon" },
            {
                "<leader>hx",
                function()
                    harpoon:list():add()
                end,
                desc = "Mark file",
                mode = "n",
            },
            {
                "<leader>hn",
                function()
                    harpoon:list():next()
                end,
                desc = "Next file",
                mode = "n",
            },
            {
                "<leader>hp",
                function()
                    harpoon:list():prev()
                end,
                desc = "Previous file",
                mode = "n",
            },
            {
                "<leader>hm",
                ":Telescope harpoon marks<CR>",
                desc = "Telescope harpoon marks",
                mode = "n",
            },
            {
                "<leader>h1",
                function()
                    harpoon:list():select(1)
                end,
                desc = "Go to file 1",
                mode = "n",
            },
            {
                "<leader>h2",
                function()
                    harpoon:list():select(2)
                end,
                desc = "Go to file 2",
                mode = "n",
            },
            {
                "<leader>h3",
                function()
                    harpoon:list():select(3)
                end,
                desc = "Go to file 3",
                mode = "n",
            },
            {
                "<leader>h4",
                function()
                    harpoon:list():select(4)
                end,
                desc = "Go to file 4",
                mode = "n",
            },
            {
                "<leader>hh",
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Toggle quick menu",
                mode = "n",
            },
            {
                "<leader>hf",
                function()
                    toggle_telescope(harpoon:list())
                end,
                desc = "Toggle telescope harpoon menu",
                mode = "n",
            },
        })
    end,
}
