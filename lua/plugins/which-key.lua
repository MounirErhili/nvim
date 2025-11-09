return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	version = "*",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.setup()

		-- Document existing key chains
		wk.add({
			{ "<Backspace>", desc = "Decrement Selection", mode = "x" },
			{ "<Enter>", desc = "Increment Selection", mode = { "x", "n" } },

			{ "<Leader>l", group = "[L]sp" },
			{ "<Leader>c", group = "[C]lose buffer" },
			{ "<Leader>d", group = "[D]ebuging" },
			-- { "<Leader>g", group = "[R]ename" },
			{ "<Leader>s", group = "[S]earch" },
			{ "<Leader>f", group = "[F]ind" },
			{ "<Leader>w", group = "[W]orkspace" },
		})
	end,
}
