-- bootstrap a plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", 
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugin list
require("lazy").setup({
    -- colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night", 
            trasparent = true, 
            on_colors = function(colors) end, 
            on_highlights = function(highlights, colors) end, 
        }, 
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd([[colorscheme tokyonight]])
        end
    }, 

    -- syntax highlight
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true }, 
            indent = { enable = true }, 
            ensure_installed = {"lua", "rust", "zig", "c", "python", "cpp", "java"}, 
        }, 
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim", 
        opts = {
            options = { theme = "tokyonight" }, 
        }
    }, 

    -- Rust lsp
    {
        "neovim/nvim-lspconfig", 
        opts = {
            on_attach = function(client, bufnr)
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end, 
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = true, 
                    check = { command = "clippy", features = "all" }, 
                    diagnostics = {
                        enable = true, 
                    }, 
                    cargo = {
                        features = "all", 
                    }, 
                    inlayHints = {
                        typeHints = true, 
                    }, 
                }, 
            }, 
        }, 
        config = function(_, opts)
            require("lspconfig").rust_analyzer.setup(opts)
        end 
    }, 

    -- file explorer
    {
        "nvim-telescope/telescope-file-browser.nvim", 
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }, 
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = { hidden = { file_browser = true }}, 
                }, 
            })
            vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")
        end
    }, 

    -- git
    {
        "lewis6991/gitsigns.nvim", 
        config = function()
            require("gitsigns").setup()
        end
    }, 
})

require("options")

