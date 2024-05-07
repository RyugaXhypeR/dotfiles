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

-- Molten
-- automatically import output chunks from a jupyter notebook
-- tries to find a kernel that matches the kernel in the jupyter notebook
-- falls back to a kernel that matches the name of the active venv (if any)
local imb = function(e) -- init molten buffer
	vim.schedule(function()
		local kernels = vim.fn.MoltenAvailableKernels()
		local try_kernel_name = function()
			local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
			return metadata.kernelspec.name
		end
		local ok, kernel_name = pcall(try_kernel_name)
		if not ok or not vim.tbl_contains(kernels, kernel_name) then
			kernel_name = nil
			local venv = os.getenv("VIRTUAL_ENV")
			if venv ~= nil then
				kernel_name = string.match(venv, "/.+/(.+)")
			end
		end
		if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
			vim.cmd(("MoltenInit %s"):format(kernel_name))
		end
		vim.cmd("MoltenImportOutput")
	end)
end

-- automatically import output chunks from a jupyter notebook
vim.api.nvim_create_autocmd("BufAdd", {
	pattern = { "*.ipynb" },
	callback = imb,
})

-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.ipynb" },
	callback = function(e)
		if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
			imb(e)
		end
	end,
})

-- automatically export output chunks to a jupyter notebook on write
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.ipynb" },
	callback = function()
		if require("molten.status").initialized() == "Molten" then
			vim.cmd("MoltenExportOutput!")
		end
	end,
})

-- change the configuration when editing a python file
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function(e)
		if string.match(e.file, ".otter.") then
			return
		end
		if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
			vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
			vim.fn.MoltenUpdateOption("virt_text_output", false)
		else
			vim.g.molten_virt_lines_off_by_1 = false
			vim.g.molten_virt_text_output = false
		end
	end,
})

-- Undo those config changes when we go back to a markdown or quarto file
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.qmd", "*.md", "*.ipynb" },
	callback = function(e)
		if string.match(e.file, ".otter.") then
			return
		end
		if require("molten.status").initialized() == "Molten" then
			vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
			vim.fn.MoltenUpdateOption("virt_text_output", true)
		else
			vim.g.molten_virt_lines_off_by_1 = true
			vim.g.molten_virt_text_output = true
		end
	end,
})

-- Manually activatin quarto 
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function(_)
		require("quarto").activate()
	end,
})
