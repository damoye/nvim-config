return {
  name = "run",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { file }
    if vim.bo.filetype == "go" then
      cmd = { "go", "run", file }
    end
    return {
      cmd = cmd,
      components = {
        { "open_output", on_start = "always" },
        "default",
      },
    }
  end,
  condition = { filetype = { "sh", "python", "go" } },
}
