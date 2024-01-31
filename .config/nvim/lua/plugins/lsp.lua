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
		servers = {
			asm_lsp = {},
			bashls = {},
			clangd = {},
			cmake = {},
			cssls = {},
			htmlls = {},
			dockerls = {},
			texlab = {},
			jsonls = {},

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
		},

		pyright = {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "basic",
						stubPath = vim.fn.stdpath("data") .. "/stubs",
						stubs = {
							"numpy-stubs",
							"pandas-stubs",
							"matplotlib-stubs",
							"scipy-stubs",
							"sklearn-stubs",
							"torch-stubs",
							"torchvision-stubs",
						},
					},
				},
			},
		},
	},

	{
		"lervag/vimtex",
		init = function()
			vim.g.vimtex_compiler_progname = "nvr"
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	{ "elkowar/yuck.vim" },
}
