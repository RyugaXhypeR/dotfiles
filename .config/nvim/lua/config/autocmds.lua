-- Autocommand to disable LSP when opening a ``__test__*`` file.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "__test__*" },
	callback = function()
		vim.b.autoformat = false
		vim.diagnostic.disable()
	end,
})

-- Set indentation to 2 spaces for some filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua", "html", "css", "tex", "conf" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.filetype.add({
	pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})

-- Use internal formatting for bindings like gq.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})
