local opts = { noremap = true, silent = true }

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
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Replace highlighted text on paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)


-- which-key

local status, wk = pcall(require, "which-key")
if not (status) then
    vim.notify("couldn't load which-key, skipping mappings")
    return
end

local which_key_map = {}

which_key_map["w"] = {"<Cmd>w<CR>", "save file"}
which_key_map["q"] = {":q<CR>", "quit"}
which_key_map["x"] = {"<Cmd>x<CR>", "save & quit"}
which_key_map["."] = {":NvimTreeToggle<CR>", "explorer"}
which_key_map['/'] = {':noh<CR>', 'no search hl'}

which_key_map.b = {
    name = "+buffer",
    k = {"<Cmd>bd<CR><Cmd>tabclose<CR>", "close"},
    y = {"<Cmd>let @+=expand('%:p')<CR>", "yank path"},
}

-- tabs
which_key_map.t = {
    name = '+tabs',
    n = {':tabnew<CR>', 'new'},
    t = {':tabnew %<CR><C-o>', 'new current'},
    o = {':tabonly<CR>', 'close others'},
    c = {':tabclose<CR>', 'close'},
}

which_key_map.c = {
    name = '+code',
    D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "goto declaration"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "goto definition"},
    s = {"<cmd>lua vim.lsp.buf.hover()<CR>", "summary"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
    S = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature"},
    l = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', "line diagnostics"}
}


wk.register(which_key_map, {prefix = "<leader>"})
