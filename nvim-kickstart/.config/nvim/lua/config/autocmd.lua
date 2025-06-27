vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    pattern = "*",
    command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        vim.schedule(function()
            pcall(vim.keymap.del, "n", "<C-l>", { buffer = true })
            vim.keymap.set("n", "<leader>er", function()
                require("oil.actions").refresh.callback()
            end, { buffer = true, desc = "Oil: Refresh" })
        end)
    end,
})
