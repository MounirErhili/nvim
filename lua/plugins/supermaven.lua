return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-Enter>",
				clear_suggestion = "<C-x>",
				accept_word = "<C-j>",
			},
			log_level = "off",
			ignore_filetypes = { "markdown" },
		})
	end,
}
