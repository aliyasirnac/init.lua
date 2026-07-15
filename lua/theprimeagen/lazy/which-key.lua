return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      delay = 300,
    })

    which_key.add({
      { "<leader>a", desc = "Add harpoon file" },
      { "<leader>d", desc = "Delete without yank", mode = { "n", "v" } },
      { "<leader>e", group = "Errors" },
      { "<leader>ee", desc = "Insert Go error check" },
      { "<leader>f", desc = "Format buffer" },
      { "<leader>g", group = "Git" },
      { "<leader>gs", desc = "Git status" },
      { "<leader>j", desc = "Previous location list item" },
      { "<leader>k", desc = "Next location list item" },
      { "<leader>m", group = "Misc" },
      { "<leader>mp", desc = "Format prettier" },
      { "<leader>mr", desc = "Make it rain" },
      { "<leader>p", group = "Project/Paste" },
      { "<leader>p", desc = "Paste without yank", mode = "x" },
      { "<leader>pf", desc = "Find files" },
      { "<leader>ps", desc = "Grep string" },
      { "<leader>pv", desc = "Project view" },
      { "<leader>pWs", desc = "Grep WORD under cursor" },
      { "<leader>pws", desc = "Grep word under cursor" },
      { "<leader>s", desc = "Substitute word under cursor" },
      { "<leader>t", group = "Test/Trouble/Git push" },
      { "<leader>tc", desc = "Run nearest test" },
      { "<leader>tt", desc = "Toggle trouble" },
      { "<leader>u", desc = "Toggle undo tree" },
      { "<leader>v", group = "LSP/Vim" },
      { "<leader>vca", desc = "Code action" },
      { "<leader>vd", desc = "Line diagnostics" },
      { "<leader>vh", desc = "Help tags" },
      { "<leader>vpp", desc = "Edit nvim packer config" },
      { "<leader>vrn", desc = "Rename symbol" },
      { "<leader>vrr", desc = "References" },
      { "<leader>vwm", desc = "Start Vim With Me" },
      { "<leader>vws", desc = "Workspace symbol" },
      { "<leader>x", desc = "Make file executable" },
      { "<leader>y", desc = "Yank to clipboard", mode = { "n", "v" } },
      { "<leader>z", group = "Zen" },
      { "<leader>zz", desc = "Zen mode" },
      { "<leader><leader>", desc = "Source current file" },
    })
  end,
}
