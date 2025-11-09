return {
	"MeanderingProgrammer/render-markdown.nvim",
	version = "*",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	}, -- if you use standalone mini plugins
	opts = {
		render_modes = { "c", "n", "t" },
	},
}
