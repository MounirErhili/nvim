return {
	"SmiteshP/nvim-navic",
	config = function()
		local icons = require("config.icons")
		require("nvim-navic").setup({
			icons = icons.kind,
			highlight = true,
			separator = " " .. icons.ui.ChevronRight .. " ",
			click = true,
			depth_limit = 0,
			depth_limit_indicator = "...",
			lsp = {
				auto_attach = true,
			},
		})
	end,
}
