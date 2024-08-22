vim.g.mapleader = " "

local keymap = vim.keymap

-- Placeholders
-- keymap.set("n", "<leader>x", "", { desc = "" })
-- keymap.set("i", "<leader>x", "", { desc = "" })

-- Weird
--keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear highlights
keymap.set("n", "<leader><ESC>",   ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<ESC><ESC><ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v",         { desc = "Split V" })
keymap.set("n", "<leader>sh", "<C-w>s",         { desc = "Split H" })
keymap.set("n", "<leader>se", "<C-w>=",         { desc = "Equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Change focus with <leader>Arrow
keymap.set("n", "<leader><Left>",  "<C-w>h", { desc = "Focus left" })
keymap.set("n", "<leader><Down>",  "<C-w>j", { desc = "Focus down" })
keymap.set("n", "<leader><Up>",    "<C-w>k", { desc = "Focus up" })
keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "Focus right" })

-- Tabs
keymap.set("n", "<leader>to",  "<cmd>tabnew<CR>",   { desc = "Open new tab" })
keymap.set("n", "<leader>tx",  "<cmd>tabclose<CR>", { desc = "Close current tab" })

keymap.set("n", "<leader>tn",  "<cmd>tabn<CR>",     { desc = "Go to next tab" })
keymap.set("n", "<A-S-Right>", "<cmd>tabn<CR>",     { desc = "Go to next tab" })
keymap.set("n", "<A-.>",       "<cmd>tabn<CR>",     { desc = "Go to next tab" })

keymap.set("n", "<leader>tp",  "<cmd>tabp<CR>",     { desc = "Go to previous tab" })
keymap.set("n", "<A-S-Left>",  "<cmd>tabp<CR>",     { desc = "Go to previous tab" })
keymap.set("n", "<A-,>",      "<cmd>tabp<CR>",      { desc = "Go to previous tab" })

keymap.set("n", "<leader>tf",  "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Move forward/back in history
keymap.set("n", "<A-Left>",  "<C-O>", { desc = "Go back" })
keymap.set("n", "<A-Right>", "<C-i>", { desc = "Go forward" })

-- Search for selected text. "*" is annoying to type and remember. 
keymap.set("v", "/",         "*<ESC>", { desc = "Search for selected text and exit visual mode" })
keymap.set("n", "<leader>/", "*",      { desc = "Search for selected text" })

