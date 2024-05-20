return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "j-hui/fidget.nvim", opts = {} }, -- LSP status updates
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer" },
		})
		local lsp = require("lsp-zero")
		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
			local opts = { buffer = bufnr, remap = false, desc = "Go to definition" }
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
		end)
		lsp.setup()

		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},
		})

		require("lspconfig").rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						features = "all",
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						globals = { "vim" },
					},
					-- workspace = {
					--     checkThirdParty = true,
					-- },
				},
			},
		})
	end,
}
