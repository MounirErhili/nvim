return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl_shortcut = "Include"
			return b
		end

		dashboard.section.header.val = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		}

		dashboard.section.buttons.val = {
			button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			button("f", " " .. " Find file", ":lua require('fzf-lua').files() <CR>"),
			button("g", " " .. " Find text", ":lua require('fzf-lua').live_grep() <CR>"),
			button("r", " " .. " Recent files", ":lua require('fzf-lua').oldfiles() <CR>"),
			-- button("s", " " .. " Restore Session", [[:lua require("persistence").load() <CR>]]),
			button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			button("q", " " .. " Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = "Mounir Erhili"
		dashboard.section.header.opts.hl = "Keyword"
		dashboard.section.buttons.opts.hl = "Include"
		dashboard.section.footer.opts.hl = "Type"

		dashboard.opts.opts.noautocmd = true
		---@diagnostic disable-next-line: redundant-parameter
		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "MEVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = { "AlphaReady" },
			callback = function()
				vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
			end,
		})
	end,
}
