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
            ensure_installed = {"lua", "rust", "zig", "c", "python"}, 
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
})

vim.opt.termguicolors = true -- Enable TrueColor
vim.opt.shell = 'zsh'
vim.opt.number = true -- Show line number

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.title = true -- show file name in window title bar
vim.opt.signcolumn = 'yes' -- add margin next to line number
vim.opt.showcmd = true -- show the command being enterd
vim.opt.mouse = 'a' -- enable mouse
vim.opt.hlsearch = true -- highlight search results

vim.opt.list = true -- show invisible characters as other symbols

