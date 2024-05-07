return {
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				lua = { "stylua" },
				rust = { "rust-analyzer" },
				java = { "google-java-format" },
				latex = { "latexindent", "bibtex-tidy" },
				sh = { "shfmt" },

				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
			},
		},
	},
}
