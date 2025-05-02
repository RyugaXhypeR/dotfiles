return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				html = { "prettier" },
				htmldjango = { "djlint" },
			},
		},
	},
}
