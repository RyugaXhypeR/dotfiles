return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {

				-- Lua
				lua_ls = {
					hint = {
						enabled = true,
						setType = true,
						paramType = true,
					},
				},

				-- Python
				basedpyright = {
					analysis = {
						diagnosticMode = "openFilesOnly",
						inlayHints = {
							callArgumentNames = true,
						},
					},
					diagnosticSeverityOverrides = {
						reportUnusedCallResult = false,
					},
				},
			},
		},
	},
}
