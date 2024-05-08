return {
	-- add symbols-outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		opts = {
			-- add your options that should be passed to the setup() function here
			position = "right",
		},
	},

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		opts = {
			inlay_hints = {
				enabled = true,
			},

			ensure_installed = {
				-- python
				"ruff",
				"black",
				"isort",
				"mypy",

				-- rust
				"rust-analyzer",

				-- c
				"clang",
				"clang-format",

				-- asm
				"asm-lsp",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				underline = false,
				update_in_insert = true,
				virtual_text = {
					enabled = true,
					prefix = "",
					spacing = 4,
				},
			},
			inlay_hints = {
				enabled = true,
			},
			codelens = {
				enabled = true,
			},
		},

		servers = {
			asm_lsp = {
				command = "asm-lsp",
				filetypes = { "asm", "s", "S" },
				bashls = {},
			},
			clangd = { "c", "cpp", "c++", "cxx", "cc", "h" },

			lua_ls = {
				single_file_support = true,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						misc = {
							parameters = {
								"--log-level=trace",
							},
						},
						hover = { expandAlias = false },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Enabled",
							semicolon = "Enabled",
							arrayIndex = "Enabled",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							-- enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "tab",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			},
			pyright = {
				capabilities = function(_, _)
					local capabilities = require("lsp-status").capabilities
					capabilities.workspace.didChangeConfiguration.dynamicRegistration = false
					return capabilities
				end,
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								reportWildcardImportFromLibrary = "none",
								reportUnusedImport = "information",
								reportUnusedClass = "information",
								reportUnusedFunction = "information",
							},
						},
					},
					pyright = {
						disableTaggedHints = true,
					},
				},
			},

			rust = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						cargo = {
							loadOutDirsFromCheck = true,
						},
						procMacro = {
							enable = true,
						},
					},
				},
			},
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>cR", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Code Action", buffer = bufnr })
					vim.keymap.set("n", "<leader>dr", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "Rust Debuggables", buffer = bufnr })
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						-- Add clippy lints for Rust.
						checkOnSave = {
							allFeatures = true,
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
	},
}
