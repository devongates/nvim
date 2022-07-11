local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  ttimeoutlen = 10,
  undofile = true,                         -- enable persistent undo
  updatetime = 1000,                       -- faster completion (4000ms default)
  tabstop = 4,                             -- insert 2 spaces for a tab
  shiftwidth = 0,                          -- the number of spaces inserted for each indentation
  expandtab = true,                        -- convert tabs to spaces
  softtabstop = -1,
  shiftround = true,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  signcolumn = "yes:1",                    -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  whichwrap = vim.opt.whichwrap:append "<>[]hl",
  iskeyword = vim.opt.iskeyword:append "-",
  listchars = { eol = "↲", tab = "▶ ", trail = "•", precedes = "«", extends = "»", nbsp = "␣", space = "." },
  syntax = "ON",        -- str:  Allow syntax highlighting
  wildignore = { ".git", ".hg", ".svn", "*.pyc", "*.o", "*.out", "*.jpg", "*.jpeg", "*.png", "*.gif", "*.zip" },
  wildignore = vim.opt.wildignore + { "**/node_modules/**", "**/bower_modules/**", "__pycache__", "*~", "*.DS_Store" },
  wildignore = vim.opt.wildignore + { "**/undo/**", "*[Cc]ache/" },
  wildignorecase = true,
  infercase = true,
  lazyredraw = true,
  showmatch = true,
  matchtime = 2,
  synmaxcol = 128, -- avoid slow rendering for long lines
  pumblend = 15,
  linebreak = true,
  wrap = true,
  mouse = "a",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.formatoptions = "l"
vim.opt.formatoptions = vim.opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

