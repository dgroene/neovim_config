local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

require("indent_blankline").setup({
  -- Configuration here, or leave empty to use defaults
  filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "telescopePrompt", "NvimTree", "TelescopeResults" },
  buftype_exclude = { "terminal", "NvimTree" },
})

