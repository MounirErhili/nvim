return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = true,
	-- 			transparent = false,
	-- 			overrides = function(colors)
	-- 				return {
	-- 					["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
	-- 					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
	-- 					["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
	-- 					["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
	-- 					["@markup.list.markdown"] = { link = "Function" }, -- + list
	-- 					["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
	-- 					["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
	-- 				}
	-- 			end,
	-- 		})
	--
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- 	build = function()
	-- 		vim.cmd("KanagawaCompile")
	-- 	end,
	-- },
}
