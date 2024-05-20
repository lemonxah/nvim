return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "c", "rust" },
			sync_install = true,
			auto_install = true,

			highlight = {
				enable = true,
				-- enable = false,
				additional_vim_regex_highlighting = false,
			},
			modules = {},
			ignore_install = {},
		})
	end,
}
