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
				require("lspsaga").setup()
			end
		},
		{
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup()
			end
		}
	},
	keys = {
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
		{ "<leader>o",  "<cmd>Lspsaga outline<cr>" },
		{ "gf",         "<cmd>Lspsaga lsp_finder<cr>" },
		{ "gD",         "<cmd>Lspsaga peek_definition<cr>" },
		{ "gd",         "<cmd>Lspsaga goto_definition<CR>" },
		{ "gt",         "<cmd>Lspsaga goto_type_definition<CR>" },
		{ "gT",         "<cmd>Lspsaga peek_type_definition<CR>" },
		{ "<leader>sh", "<cmd>Lspsaga hover_doc<cr>" },
		{ "[d",         "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
		{ "]d",         "<cmd>Lspsaga diagnostic_jump_next<cr>" },
	},
	config = function()
		require("rust-tools").setup()
		require("neodev").setup()
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
				require("lspconfig")[server_name].setup()
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
				lspconfig.rust_analyzer.setup()
			end,
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.gitsigns,
			},
		})
	end
}
