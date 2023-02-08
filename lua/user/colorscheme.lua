local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#A7C080"})
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#D699B6"})
