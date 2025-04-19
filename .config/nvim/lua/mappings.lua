require("nvchad.mappings")
local wk = require("which-key")

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>da", vim.diagnostic.open_float, { desc = "Show error message" })

-- map({ "n", "i", "v" }i, "<C-s>", "<cmd> w <cr>")

-- Normal mode: Move current line up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode: Move selected lines up/down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Harpoon Which-key mappings
local harpoon = require("harpoon")

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
})

-- terminal
nomap("n", "<leader>v")
nomap("n", "<leader>h")

-- lsp code action
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code action" })
