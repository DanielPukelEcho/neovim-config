local group = vim.api.nvim_create_augroup("UserConfig", {
    clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = {
        "javascript",
        "typescript",
        "svelte",
        "html",
        "css",
        "json",
    },
    callback = function()
        vim.opt_local.shiftwidth = 2
    end,
    desc = "Use two-space indentation for web files",
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "rust", "cs" },
    callback = function(args)
        if vim.bo[args.buf].filetype == "rust" then
            vim.bo[args.buf].makeprg = "cargo build --message-format=short"
            vim.bo[args.buf].errorformat = "%Eerror%*[^:]: %m,%Wwarning: %m,%f:%l:%c: %m"
        else
            vim.bo[args.buf].makeprg = "dotnet build --nologo"
            vim.bo[args.buf].errorformat = "%f(%l\\,%c): %t%*[^:]: %m"
        end
    end,
    desc = "Configure build commands for Rust and C#",
})
