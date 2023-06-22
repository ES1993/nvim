local utils = require("utils")

local clear_search = function(char)
	if vim.fn.mode() == "n" then
		local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))

		if vim.opt.hlsearch:get() ~= new_hlsearch then
			vim.opt.hlsearch = new_hlsearch
		end
	end
end

vim.on_key(clear_search, utils.namespace("auto_hlsearch"))

utils.autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = utils.augroup("highlightyank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

utils.autocmd({ "BufNewFile" }, {
	desc = "user open file",
	callback = function()
		print("nihao a")
	end,
})
