local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", ";;", "<ESC>A;", opts)
keymap("i", ",,", "<ESC>A,", opts)
keymap("v", "vv", "<ESC>", opts)
keymap("c", "vv", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("v", "˚", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

keymap('v', 'y', 'myy`y', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)

-- Visual Block --
-- Move text up and down
keymap("n", "∆", ":move .+1<CR>==", opts)
keymap("n", "˚", ":move .-2<CR>==", opts)
keymap("i", "∆", "<Esc>:move .+1<CR>==gi", opts)
keymap("i", "˚", "<Esc>:move .-2<CR>==gi", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, no_ignore = true }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>s", ":SearchSession<CR>", opts)


-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- DAP
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl_open()<cr>", opts)
keymap("n", "<leader>rl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>rn", "<cmd>lua require'dap'.run()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opts)

-- Copy/paste using the System clipboard
keymap("v", "<leader>y", "\"*y", opts)
keymap("v", "<leader>yy", "\"*yy", opts)
keymap("n", "<leader>p", "\"*p", opts)
keymap("n", "<leader><S-p>", "\"*P", opts)
