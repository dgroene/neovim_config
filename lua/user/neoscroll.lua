local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

require("neoscroll").setup({
  -- Configuration here, or leave empty to use defaults
})
