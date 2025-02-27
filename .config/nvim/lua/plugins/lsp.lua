return {
	{
		"neovim/nvim-lspconfig",

		config = function(_, opts)
			local lsp_path = "lua/plugins/lsp/"
			local lsp_configs = vim.fn.globpath(lsp_path, "*.lua", false, true)

			for _, file in pairs(lsp_configs) do
				local module = file:gsub("/", "."):gsub(".lua$", "")
				local ok, err = pcall(require, module)
				if not ok then
					print("Error loading LSP config: " .. err)
				end
			end
		end,
	},
}
