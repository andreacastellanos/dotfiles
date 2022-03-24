require("bufferline").setup{
	options = {
		offsets = { {
		    filetype = "NvimTree",
		    text = "File Tree",
		    highlight = "Directory",
		    text_align = "left"
		} },
		custom_filter = function(buf_number, buf_numbers)
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "*cider-nrepl*" then -- <- regex this?
				return true
			end
		end,
	}
}
