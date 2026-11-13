return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").install({
                "lua",
                "c",
                "cpp",
                "rust",
                "c_sharp",
                "html",
                "css",
                "javascript",
                "typescript",
                "svelte",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua",
                    "c",
                    "cpp",
                    "rust",
                    "cs",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "svelte",
                },
                callback = function()
                    vim.treesitter.start()

                    vim.wo.foldmethod = "expr"
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo.foldlevel = 99
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            select = {
                lookahead = true,
            },
            move = {
                set_jumps = true,
            },
        },

        keys = {
            {
                "af",
                function()
                    require("nvim-treesitter-textobjects.select")
                        .select_textobject("@function.outer", "textobjects")
                end,
                mode = { "x", "o" },
                desc = "Outer function",
            },
            {
                "if",
                function()
                    require("nvim-treesitter-textobjects.select")
                        .select_textobject("@function.inner", "textobjects")
                end,
                mode = { "x", "o" },
                desc = "Inner function",
            },
            {
                "aa",
                function()
                    require("nvim-treesitter-textobjects.select")
                        .select_textobject("@parameter.outer", "textobjects")
                end,
                mode = { "x", "o" },
                desc = "Outer parameter",
            },
            {
                "ia",
                function()
                    require("nvim-treesitter-textobjects.select")
                        .select_textobject("@parameter.inner", "textobjects")
                end,
                mode = { "x", "o" },
                desc = "Inner parameter",
            },
            {
                "]m",
                function()
                    require("nvim-treesitter-textobjects.move")
                        .goto_next_start("@function.outer", "textobjects")
                end,
                mode = { "n", "x", "o" },
                desc = "Next function",
            },
            {
                "[m",
                function()
                    require("nvim-treesitter-textobjects.move")
                        .goto_previous_start("@function.outer", "textobjects")
                end,
                mode = { "n", "x", "o" },
                desc = "Previous function",
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
    },
}
