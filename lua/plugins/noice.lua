return {
	"folke/noice.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		{ "MunifTanjim/nui.nvim", version = "*" },
		{ "rcarriga/nvim-notify", version = "*" },
	},
	keys = {
		{ "<C-c>", "<CMD>NoiceDismiss<CR>", mode = { "n", "i" }, desc = "Dismiss Noice" },
	},
}
