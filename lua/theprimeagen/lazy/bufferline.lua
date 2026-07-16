return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })

    vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
    vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious)
    vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
    vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>")
    vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>")
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>")
    vim.keymap.set("n", "<leader>bo", function()
      local current = vim.api.nvim_get_current_buf()
      for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        if buffer ~= current and vim.bo[buffer].buflisted then
          vim.api.nvim_buf_delete(buffer, { force = false })
        end
      end
    end)
  end,
}
