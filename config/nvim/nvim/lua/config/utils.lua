local M = {}
-- check if windows
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

M.is_windows = function()
  return is_windows
end

M.get_visual = function(start_line, end_line)
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  return table.concat(lines, "\n")
end

return M
