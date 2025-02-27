local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				black = { enabled = false },
				autopep8 = { enabeld = false },
				pylint = { enabled = false },
				pylsp_mypy = { enabled = true },
				pylsp_isort = { enabled = false },
			},
		},
	},
})

lspconfig.ruff.setup({
	init_options = {
		settings = {
			organizeImports = true,
		},
		configuration = {
			format = {
				["quoting-style"] = "single",
			},
		},
	},
})
