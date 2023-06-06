---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

--Set the movement keys to keep screen centered when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "<leader>fl", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- more keybinds!

return M
