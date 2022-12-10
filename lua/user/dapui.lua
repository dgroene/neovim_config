local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    -- send message to user
    print("dapui-nvim not found")
    return
end
require("dapui").setup()
