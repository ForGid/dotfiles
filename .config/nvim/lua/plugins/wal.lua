return {
  "arizzoni/wal.nvim",
  config = function()
    local home = os.getenv("HOME") or vim.fn.expand("~")
    vim.g.wal_path = home .. "/.cache/wal/colors.json"
    vim.cmd("colorscheme wal")
  end
}
