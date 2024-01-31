if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>ch", function()
		vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "Toggle Inlay Hints" })
end

-- Toggle term
-- vim.keymap.set("n", "<C-i>", ":ToggleTerm direction=float<cr>", { desc = "Toggle Float Term" })
-- vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Term" })
-- vim.keymap.set("n", "<C-v>", ":ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Term" })
