return {
	"ibhagwan/fzf-lua",
	commit = "1cc70fb",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<Leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind in neovim [C]onfiguration",
		},
		{
			"<Leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [F]iles in project directory",
		},
		{
			"<Leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind by [G]repping in project directory",
		},
		{
			"<Leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<Leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltin FZF",
		},
		{
			"<Leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<Leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [O]ld files",
		},
	},
}
