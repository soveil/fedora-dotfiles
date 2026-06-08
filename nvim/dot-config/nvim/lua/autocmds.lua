vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = "jcrql"
	end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
