return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "roslyn_ls",
                "svelte",
                "ts_ls",
                "tailwindcss",
                "lua_ls",
            },
        },
    },
}
