return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "nvim-mini/mini.nvim",
        version = false,
        config = function()
            require("mini.statusline").setup()
        end,
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
}
