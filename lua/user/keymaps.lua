-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better line navigation
keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "$", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Move current line / block with Alt-j/k ala vscode.
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- Move iurrent line / block with Alt-j/k ala vscode.
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- navigition
keymap("i", "<A-Up>", "<C-\\><C-N><C-w>k", opts)
keymap("i", "<A-Down>", "<C-\\><C-N><C-w>j", opts)
keymap("i", "<A-Left>", "<C-\\><C-N><C-w>h", opts)
keymap("i", "<A-Right>", "<C-\\><C-N><C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected line / block of text in visual mode
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)

-- Move current line / block with Alt-j/k ala vscode.
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
