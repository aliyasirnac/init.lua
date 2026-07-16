return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      direction = "float",
      shade_terminals = true,
      float_opts = {
        border = "curved",
      },
    })

    vim.keymap.set("n", "<leader>ot", "<cmd>ToggleTerm direction=float<CR>")
    vim.keymap.set("n", "<leader>oh", "<cmd>ToggleTerm size=15 direction=horizontal<CR>")
    vim.keymap.set("n", "<leader>ov", "<cmd>ToggleTerm size=80 direction=vertical<CR>")
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end,
}
