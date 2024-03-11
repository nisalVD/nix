local leet_arg = "leetcode.nvim"

return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv()[1],
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local wk = require("which-key")
      local wk_opts = { noremap = true, silent = true, prefix = "<leader>" }
      wk.register({
        l = {
          r = { "<cmd>Leet run<cr>", "leetcode run" },
          t = { "<cmd>Leet console<cr>", "toggle leetcode console" },
        },
      }, wk_opts)
      require("leetcode").setup({
        arg = leet_arg,
        lang = "javascript",
      })
    end,
  },
}
