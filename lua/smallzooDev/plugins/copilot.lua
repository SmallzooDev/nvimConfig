-- import github/copilot plugin safely
local setup, copilot = pcall(require, "copilot")
if not setup then
    return
end


copilot.setup()
