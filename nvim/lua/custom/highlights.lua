-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { bg = "cyan" },
  NvimTreeOpenedFile = { fg = "green", bold = true },
  NvimTreeOpenedFolderIcon = { fg = "green" },
  NvimTreeFileDirty = { fg = "nord_blue" },
}

return M
