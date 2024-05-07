return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		-- dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			-- vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")
		end,
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	opts = {
	-- 		backend = "kitty",
	-- 		max_width = 100,
	-- 		max_height = 12,
	-- 		max_height_window_percentage = math.huge,
	-- 		max_width_window_percentage = math.huge,
	-- 		window_overlap_clear_enabled = true,
	-- 		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	-- 	},
	-- },

	{
		"quarto-dev/quarto-nvim",
		dev = false,
		opts = {
			lspFeatures = {
				chunks = "all",
				languages = { "r", "python", "bash", "html" },
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
				ft_runner = {
					python = "molten",
					markdown = "molten",
				},
			},

			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},

			completion = { enabled = true },
		},
		dependencies = {
			"jmbuhr/otter.nvim",
		},
	},

	{
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "md",
					style = "markdown",
					force_ft = "markdown",
				},
			},
		},
	},

	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},
}
