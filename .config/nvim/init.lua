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
    "EdenEast/nightfox.nvim",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
		config = function()
			local configs = require("tokyonight")
			configs.setup({
				style = "night", 
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

-- vim.cmd("colorscheme nightfox")
vim.cmd[[colorscheme tokyonight]]
require"lualine-config"

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.signcolumn = 'yes'
vim.opt.showcmd = true
vim.opt.mouse = 'a' 
vim.opt.hlsearch = true
vim.opt.shell = 'zsh'
vim.opt.termguicolors = true

