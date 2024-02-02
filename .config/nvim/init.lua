-- Lazy.nvim
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

-- Plugin list
require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
		config = function()
			local configs = require("tokyonight")
			configs.setup({
				style = "night", 
				transparent = true, 
				on_colors = function(colors) end, 
				on_highlights = function(highlights, colors) end, 
			})
		end
    }, 
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {"lua", "rust", "zig", "c", "python"},
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    "nvim-lualine/lualine.nvim",
})

vim.cmd[[colorscheme tokyonight]]
vim.opt.termguicolors = true -- Enable TrueColor

vim.opt.shell = 'zsh'

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true -- Show line number

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- vim.opt.cursorline = true
vim.opt.title = true -- Show file name in window title bar
vim.opt.signcolumn = 'yes' -- Add margin next to line number
vim.opt.showcmd = true -- Show the command being enterd
vim.opt.mouse = 'a' -- Enable mouse
vim.opt.hlsearch = true -- Highlight search results

vim.list = true -- Show invisible characters as other symbols
vim.listchars = { tab = '>>>>', trail = '-', nbsp = '+' }

require"lualine-config"
