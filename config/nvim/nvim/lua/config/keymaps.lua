local keymap = vim.keymap.set
local jira_stuff = require("config.jira-stuff")

-- rebind alternate file key to alt enter
keymap("n", "<leader>f", ":Ex<cr>", { noremap = true })

-- open todo
keymap("n", "<leader>jt", function()
  jira_stuff.open_markdown_window("/Users/nisaldon/personal/todo.md")
end, { noremap = true })
-- conver to jira link
keymap("n", "<leader>jl", function()
  jira_stuff.convert_jira_link()
end, { noremap = true })
