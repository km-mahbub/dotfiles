return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = {
                enabled = false,
                auto_trigger = true,
                hide_during_completion = true,
                keymap = {
                    accept = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                },
            },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    {
        "giuxtaposition/blink-cmp-copilot",
        dependencies = {
            "zbirenbaum/copilot.lua",
        },
    },

    -- Copilot Chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            window = {
                layout = "float",
                border = "rounded",
                width = 0.85,
                height = 0.85,
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")
            chat.setup(opts)

            ---------------------------------------------------------------------
            -- Helper: get visual selection text
            ---------------------------------------------------------------------
            local function get_visual_selection()
                local bufnr = vim.api.nvim_get_current_buf()
                local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
                local end_pos = vim.api.nvim_buf_get_mark(bufnr, ">")

                local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[1] - 1, end_pos[1], false)

                if #lines == 0 then
                    return ""
                end

                lines[1] = string.sub(lines[1], start_pos[2] + 1)
                lines[#lines] = string.sub(lines[#lines], 1, end_pos[2])

                return table.concat(lines, "\n")
            end

            ---------------------------------------------------------------------
            -- Keymaps
            ---------------------------------------------------------------------

            -- Open chat window
            vim.keymap.set("n", "<leader>cco", function()
                chat.open()
            end, { desc = "Copilot Chat: Open" })

            -- Close chat window
            vim.keymap.set("n", "<leader>ccq", function()
                chat.close()
            end, { desc = "Copilot Chat: Close" })

            -- Model picker
            vim.keymap.set("n", "<leader>ccm", function()
                chat.select_model()
            end, { desc = "Copilot Chat: Model Picker" })

            -- Prompt picker
            vim.keymap.set("n", "<leader>ccs", function()
                chat.select_prompt()
            end, { desc = "Copilot Chat: Prompt Picker" })

            -- Ask about entire file
            vim.keymap.set("n", "<leader>ccp", function()
                chat.ask("Explain the code in this file.")
            end, { desc = "Copilot Chat: Explain buffer" })

            -- Explain visual selection
            vim.keymap.set("v", "<leader>cce", function()
                local text = get_visual_selection()
                chat.ask("Explain the following code:\n\n" .. text)
            end, { desc = "Copilot Chat: Explain selection" })

            -- Fix visual selection
            vim.keymap.set("v", "<leader>ccf", function()
                local text = get_visual_selection()
                chat.ask("Fix issues in the following code and explain changes:\n\n" .. text)
            end, { desc = "Copilot Chat: Fix selection" })

            -- Toggle Copilot completion (blink-cmp)
            vim.keymap.set("n", "<leader>ct", ":CopilotToggleCmp<CR>", {
                desc = "Toggle Copilot Completion",
            })
        end,
    },
}
