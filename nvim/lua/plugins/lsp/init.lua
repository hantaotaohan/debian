vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guifg=#6f737b guibg=#2f333c]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#6f737b guibg=#282C34]])

return {

	--   ╭──────────────────────────────────────────────────────────────────────╮
	--   │                                                                      │
	--   │                              LspConfig                               │
	--   │                                                                      │
	--   │               https://github.com/neovim/nvim-lspconfig               │
	--   │                                                                      │
	--   ╰──────────────────────────────────────────────────────────────────────╯

	{
		"neovim/nvim-lspconfig",

		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/cmp-nvim-lsp",
				cond = function()
					return require("config.utility").has("nvim-cmp")
				end,
			},
		},

		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				-- virtual_text = {
				-- 	spacing = 8,
				-- 	prefix = "▊ ",
				-- 	source = "always",
				-- },
				float = {
					header = "",
					border = "rounded",
					source = "always",
					focusable = false,
				},
				severity_sort = true,
			},
			-- Automatically format on save
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			servers = {

				jsonls = {
					cmd = { "vscode-json-language-server", "--stdio" },
					filetypes = { "json", "jsonc" },
					init_options = {
						provideFormatter = true,
					},
					single_file_support = true,
				},

				pyright = {
					cmd = { "pyright-langserver", "--stdio" },
					filetypes = { "python" },
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
							},
						},
					},
					single_file_support = true,
				},

				vimls = {
					cmd = { "vim-language-server", "--stdio" },
					filetypes = { "vim" },
					init_options = {
						diagnostic = {
							enable = true,
						},
						indexes = {
							count = 3,
							gap = 100,
							projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
							runtimepath = true,
						},
						isNeovim = true,
						iskeyword = "@,48-57,_,192-255,-#",
						runtimepath = "",
						suggest = {
							fromRuntimepath = true,
							fromVimruntime = true,
						},
						vimruntime = "",
					},
					single_file_support = true,
				},

				bashls = {
					cmd = { "bash-language-server", "start" },
					cmd_env = {
						GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
					},
					filetypes = { "sh" },
					single_file_support = true,
				},

				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							cmd = { "lua-language-server" },
							filetypes = { "lua" },
							single_file_support = true,
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
								library = vim.api.nvim_get_runtime_file("", true),
							},
							completion = {
								callSnippet = "Replace",
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
			},

			setup = {

				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		---@param opts PluginLspOpts
		config = function(_, opts)
			-- setup autoformat
			require("plugins.lsp.format").autoformat = opts.autoformat
			-- setup formatting and keymaps
			require("config.utility").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			-- diagnostics
			for name, icon in pairs(require("config.utility").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			-- temp fix for lspconfig rename
			-- https://github.com/neovim/nvim-lspconfig/pull/2439
			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local available = have_mason and mlsp.get_available_servers() or {}

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			if have_mason then
				mlsp.setup({ ensure_installed = ensure_installed })
				mlsp.setup_handlers({ setup })
			end
		end,
	},

	--   ╭──────────────────────────────────────────────────────────────────────╮
	--   │                                                                      │
	--   │                               Null_Ls                                │
	--   │                                                                      │
	--   │          https://github.com/jose-elias-alvarez/null-ls.nvim          │
	--   │                                                                      │
	--   ╰──────────────────────────────────────────────────────────────────────╯

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},

	--   ╭──────────────────────────────────────────────────────────────────────╮
	--   │                                                                      │
	--   │                                Mason                                 │
	--   │                                                                      │
	--   │              https://github.com/williamboman/mason.nvim              │
	--   │                                                                      │
	--   ╰──────────────────────────────────────────────────────────────────────╯

	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"shfmt",
				"stylua",
				"flake8",
				"lua-language-server",
				"bash-language-server",
				"vim-language-server",
				"pyright",
				"djlint",
				"json-lsp",
			},
			github = {
				download_url_template = os.getenv("GITHUB") .. "%s/releases/download/%s/%s",
			},
			pip = {
				upgrade_pip = false,
				install_args = {
					"--index-url",
					"https://pypi.tuna.tsinghua.edu.cn/simple",
					"--trusted-host",
					"pypi.tuna.tsinghua.edu.cn",
				},
			},
		},

		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
}
