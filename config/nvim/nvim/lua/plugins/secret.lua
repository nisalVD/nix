return {
  {
    "nvim-lua/plenary.nvim",
    dependencies = {
      {
        "rcarriga/nvim-notify",
        "folke/which-key.nvim",
        {
          "mrjones2014/op.nvim",
          build = "make install",
          config = function()
            require("op").setup({})
          end,
        },
      },
    },
    event = "InsertEnter",
    config = function()
      local create_secret_link = function(start_line, end_line)
        local text = require("config.utils").get_visual(start_line, end_line)
        if text == "" then
          require("notify")("No text selected")
          return
        end
        local data =
          require("op.api").item.get({ "onetimesecret_api", "--fields", "credential", "--fields", "username" })
        local data_without_string = string.gsub(data[1], "%s+", "")
        local data_arr = vim.split(data_without_string, ",")

        local api_key = data_arr[1]
        local username = data_arr[2]
        local query = { secret = text }

        local curl = require("plenary.curl")
        local auth = username .. ":" .. api_key
        local res = curl.post("https://onetimesecret.com/api/v1/share", {
          auth = auth,
          query = query,
        })
        local body = vim.json.decode(res.body)
        local secret_key = body and body["secret_key"]

        local secret_link = "https://onetimesecret.com/secret/" .. secret_key
        vim.fn.setreg("+", secret_link)
        require("notify")("secret link saved to clipboard")
      end

      vim.api.nvim_create_user_command("CreateSecretLink", function(opts)
        local line1 = opts.line1
        local line2 = opts.line2
        create_secret_link(line1, line2)
      end, { range = "%", bang = true })
    end,
  },
}
