return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-go")({
                        args = { "-count=1", "-timeout=60s" },
                        experimental = {
                            test_table = true,
                        },
                    }),
                    require("neotest-rust")({
                        args = { "--no-capture" },
                    }),
                    require("neotest-vitest"),
                    require("neotest-plenary").setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
            vim.keymap.set("n", "<leader>tf", function()
                neotest.run.run(vim.fn.expand("%"))
            end)
            vim.keymap.set("n", "<leader>ta", function()
                neotest.run.run(vim.fn.getcwd())
            end)
            vim.keymap.set("n", "<leader>to", function()
                neotest.output.open({ enter = true })
            end)
            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle()
            end)
        end,
    },
}
