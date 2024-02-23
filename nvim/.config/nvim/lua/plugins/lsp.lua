return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"simrat39/rust-tools.nvim",
		"folke/neodev.nvim",
		{
			"glepnir/lspsaga.nvim",
			keys = {
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
				{ "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<cr>" },
			},
			config = function()
				require("lspsaga").setup({
					symbol_in_winbar = {
						enable = false
					}
				})
			end
		},
		{
			"folke/trouble.nvim",
			keys = {

				{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
				{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
				{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
				{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
				{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
			},
			config = function()
				require("trouble").setup({})
			end
		},
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

		local servers = {
			"eslint",
			"tsserver",
			"dockerls",
			"yamlls",
			"lua_ls",
			"jsonls",
			"rust_analyzer",
			"solidity_ls_nomicfoundation",
			"terraformls",
			"gopls"
		}

		masonconfig.setup({
			ensure_installed = servers,
		})

		require("neodev").setup({})
		local rust_format_augroup = vim.api.nvim_create_augroup("RustFormatting", {})
		require("rust-tools").setup({
			tools = {
				autoSetHints = true,
				inlay_hints = {
					auto = true,
					show_parameter_hints = true
				}
			},
			server = {
				on_attach = function(client, bufnr)
					vim.api.nvim_clear_autocmds({ group = rust_format_augroup, buffer = bufnr })
					client.server_capabilities.documentFormattingProvider = true
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = rust_format_augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr
							})
						end,
					})
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							enable = true,
							command = "clippy"
						},
						cargo = {
							allFeatures = true
						},
						format = { enable = false },
					}
				}
			}
		})

		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
		-- 	capabilities = capabilities
		-- })

		lspconfig.dockerls.setup({})
		lspconfig.yamlls.setup({})
		lspconfig.jsonls.setup({})

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

		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
			end,
		})


		local tsserver_format_augroup = vim.api.nvim_create_augroup("TsServerFormatting", {})
		lspconfig.tsserver.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_clear_autocmds({ group = tsserver_format_augroup, buffer = bufnr })
				client.server_capabilities.documentFormattingProvider = false
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = tsserver_format_augroup,
					callback = function()
						vim.cmd("Neoformat prettierd")
					end
				})
			end,
		})

		local zig_format_augroup = vim.api.nvim_create_augroup("ZigFormatting", {})
		lspconfig.zls.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_clear_autocmds({ group = zig_format_augroup, buffer = bufnr })
				client.server_capabilities.documentFormattingProvider = true
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = zig_format_augroup,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr
						})
					end,
				})
			end,
			cmd = { "zls" }
		})

		local solidity_format_augroup = vim.api.nvim_create_augroup("SolidityFormat", {})

		lspconfig.solidity_ls_nomicfoundation.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_clear_autocmds({ group = solidity_format_augroup, buffer = bufnr })
				client.server_capabilities.documentFormattingProvider = false;
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = { "*.sol" },
					group = solidity_format_augroup,
					callback = function()
						vim.cmd("Neoformat solidity forge")
					end
				})
			end
		})

		lspconfig.terraformls.setup {
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = { "*.tf", "*.tfvars" },
					callback = function()
						vim.lsp.buf.format()
					end
				})
			end
		}

		lspconfig.gopls.setup({
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},

			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = { "*.go" },
					callback = function()
						vim.lsp.buf.format()
					end
				})
			end
		})
		lspconfig.sqls.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = { "*.sql" },
					callback = function()
						vim.cmd("Neoformat sleek")
					end
				})
			end
		})
	end
}
