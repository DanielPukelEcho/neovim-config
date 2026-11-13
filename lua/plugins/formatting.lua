return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },

                rust = { "rustfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },

                javascript = { "prettier" },
                typescript = { "prettier" },
                svelte = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
    }
}
