local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status_ok then
  return
end

gruvbox.setup({
 --   contrast = "soft",
})

vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
