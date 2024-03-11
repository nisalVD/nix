local M = {}
M.source = function()
  local cwd = vim.fn.getcwd(-1, -1)

  if cwd == "c:\\Users\\nisal\\code\\opengl\\learnopengl" then
    local function run_code()
      local compile_and_run = "bin\\build.bat && bin\\run.bat"
      local run_cmd = ":20 sp | :terminal " .. compile_and_run
      vim.cmd(run_cmd)
    end

    local opts = { noremap = true, silent = true, prefix = "<leader>" }
    require("which-key").register({
      c = {
        r = { run_code, "build and run" },
      },
    }, opts)
  elseif cwd == "c:\\Users\\nisal\\code\\cpp\\cpp_test" then
    local function run_code()
      local compile_and_run = "bin\\build.bat && bin\\run.bat"
      local run_cmd = ":20 sp | :terminal " .. compile_and_run
      vim.cmd(run_cmd)
    end

    local opts = { noremap = true, silent = true, prefix = "<leader>" }
    require("which-key").register({
      c = {
        r = { run_code, "build and run" },
      },
    }, opts)
  elseif cwd == "/Users/nisaldon/apps/cpp/learnopengl" then
    local function run_code()
      local compile_and_run = "bin/build.sh && bin/run.sh"
      local run_cmd = ":20 sp | :terminal " .. compile_and_run
      vim.cmd(run_cmd)
    end

    local opts = { noremap = true, silent = true, prefix = "<leader>" }
    require("which-key").register({
      c = {
        r = { run_code, "build and run" },
      },
    }, opts)
  end
end

return M
