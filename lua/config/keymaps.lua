vim.keymap.set("n", "<leader><Tab>", "<C-^>", {
    desc = "Switch to alternate buffer",
})

vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", {
    desc = "Open file explorer"
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<Caps-Lock>", "<Esc>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Tab navigation
vim.keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>", {
    desc = "Previous tab",
})

vim.keymap.set("n", "<leader>l", "<cmd>tabnext<CR>", {
    desc = "Next tab",
})

-- Files and text
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Find text" })
vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fr", require("fzf-lua").resume, { desc = "Resume search" })
vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Find help" })

-- LSP
vim.keymap.set("n", "grr", require("fzf-lua").lsp_references, { desc = "Find references" })
vim.keymap.set("n", "gri", require("fzf-lua").lsp_implementations, { desc = "Find implementations" })
vim.keymap.set("n", "<leader>fs", require("fzf-lua").lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", require("fzf-lua").lsp_workspace_symbols, { desc = "Workspace symbols" })

-- Diagnostics and quickfix
vim.keymap.set("n", "<leader>fd", require("fzf-lua").diagnostics_document, { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>fq", require("fzf-lua").quickfix, { desc = "Find quickfix entries" })

-- Quickfix
vim.keymap.set("n", "<C-l>", "<cmd>cnext<cr>", { desc = "Next quickfix entry" })
vim.keymap.set("n", "<C-h>", "<cmd>cprev<cr>", { desc = "Previous quickfix entry" })
vim.keymap.set("n", "<leader>qo", "<cmd>copen<cr>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<cr>", { desc = "Close quickfix" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    desc = "Go to definition"
})

vim.keymap.set("n", "sn", function()
    require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
end, { desc = '[S]earch [N]eovim configuration' })

vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({
        async = true,
        lsp_format = "fallback",
    })
end, { desc = "Format file" })

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
})

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true,   -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float {
                bufnr = bufnr,
                scope = 'cursor',
                focus = false,
            }
        end,
    },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
    desc = "Show diagnostic",
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

-- vim.keymap.set("c", "<Down>", function()
--     return vim.fn.wildmenumode() == 1 and "<Right>" or "<Down>"
-- end, { expr = true })
--
-- vim.keymap.set("c", "<Up>", function()
--     return vim.fn.wildmenumode() == 1 and "<Left>" or "<Up>"
-- end, { expr = true })
