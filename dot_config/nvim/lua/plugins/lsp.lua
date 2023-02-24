return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		"simrat39/rust-tools.nvim",
		"folke/neodev.nvim",
		{
			"glepnir/lspsaga.nvim",
			config = function()
				require("lspsaga").setup({})
			end
		},
		{
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({})
			end
		}
	},
	keys = {
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
		{ "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>" },
		{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>" },
		{ "[d",         "<cmd>lua vim.diagnostic.goto_prev()<cr>" },
		{ "]d",         "<cmd>lua vim.diagnostic.goto_next()<cr>" },
		{ "<leader>sh", "<cmd>lua vim.lsp.buf.hover()<cr>" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
	},
	config = function()
		require("neodev").setup({})
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
				},
			},
		})

		local masonconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local null_ls = require("null-ls")

		local servers = {
			"eslint",
			"tsserver",
			"dockerls",
			"yamlls",
			"lua_ls",
			"jsonls",
			"rust_analyzer",
		}

		masonconfig.setup({
			ensure_installed = servers,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
			capabilities = capabilities,
		})

		masonconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								enable = true,
								-- globals = { "vim" }
							},
							format = {
								enable = true,
								defaultConfig = {
									quote_style = "double"
								}
							}
						}
					}
				})
			end,
			["eslint"] = function()
				local augroup = vim.api.nvim_create_augroup("EslintFormatting", {})
				lspconfig.eslint.setup({
					on_attach = function(client, bufnr)
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						client.server_capabilities.documentFormattingProvider = true
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr
								})
							end,
						})
					end,
					settings = {
						format = { enable = false },
					},
				})
			end,
			["tsserver"] = function()
				lspconfig.tsserver.setup({
					on_attach = function(client, _)
						client.server_capabilities.documentFormattingProvider = false
					end,
				})
			end,
			["rust_analyzer"] = function()
				require("rust-tools").setup({})
				lspconfig.rust_analyzer.setup({})
			end,
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.gitsigns,
			},
		})
	end
}
