return {
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
}
