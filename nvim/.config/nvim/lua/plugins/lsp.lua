return {
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		keys = {
			{ "<leader>rn", "<cmd>Lspsaga rename<cr>" },
			{ "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
			{ "<leader>o", "<cmd>Lspsaga outline<cr>" },
			{ "gf", "<cmd>Lspsaga lsp_finder<cr>" },
			{ "gD", "<cmd>Lspsaga peek_definition<cr>" },
			{ "gd", "<cmd>Lspsaga goto_definition<CR>" },
			{ "gt", "<cmd>Lspsaga goto_type_definition<CR>" },
			{ "gT", "<cmd>Lspsaga peek_type_definition<CR>" },
			{ "<leader>sh", "<cmd>Lspsaga hover_doc<cr>" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
			{ "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<cr>" },
		},
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		keys = {

			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
			{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
		},
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"simrat39/rust-tools.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
					},
				},
			})

			local masonconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
				capabilities = capabilities,
			})

			local servers = {
				"tsserver",
				"dockerls",
				"yamlls",
				"lua_ls",
				"jsonls",
				"rust_analyzer",
				"solidity_ls_nomicfoundation",
				"terraformls",
				"gopls",
				"eslint",
				"sqls",
			}

			masonconfig.setup({
				ensure_installed = servers,
			})

			masonconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup({
						tools = {
							autoSetHints = true,
							inlay_hints = {
								auto = true,
								show_parameter_hints = true,
							},
						},
						server = {
							settings = {
								["rust-analyzer"] = {
									checkOnSave = {
										enable = true,
										command = "clippy",
									},
									cargo = {
										allFeatures = true,
									},
									format = { enable = true },
								},
							},
						},
					})
				end,
				["tsserver"] = function()
					lspconfig.tsserver.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
						end,
					})
				end,
				["eslint"] = function()
					lspconfig.eslint.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
						end,
					})
				end,
				["lua_ls"] = function()
					require("neodev").setup({})

					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
								},
								completion = {
									callSnippet = "Replace",
								},
								diagnostics = {
									enable = true,
									globals = { "vim" },
								},
								format = {
									enable = false,
								},
							},
						},
					})
				end,
				["zls"] = function()
					lspconfig.zls.setup({
						cmd = { "zls" },
					})
				end,
				["solidity_ls_nomicfoundation"] = function()
					lspconfig.solidity_ls_nomicfoundation.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
							vim.api.nvim_create_autocmd("BufWritePre", {
								pattern = { "*.sol" },
								callback = function()
									vim.cmd("Neoformat solidity forge")
								end,
							})
						end,
					})
				end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
								},
								staticcheck = true,
								gofumpt = false,
							},
						},
					})
				end,
			})
		end,
	},
}
