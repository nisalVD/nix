return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = { spelling = true },
        key_labels = { ["<leader>"] = "," },
      })
      wk.register({
        mode = { "n", "v" },
        ["<leader>p"] = { name = "+files" },
      })

      wk.register({
        mode = { "n", "v" },
        y = { '"+y', "copy to clipboard" },
      }, { prefix = "<leader>" })

      wk.register({
        mode = { "n", "v" },
        x = { '"+x', "delete to clipboard" },
      }, { prefix = "<leader>" })
    end,
  },
}
