return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<Enter>", desc = "Increment Selection" },
		{ "<Backspace>", desc = "Decrement Selection", mode = "x" },
	},
	opts_extend = { "ensure_installed" },
	---@diagnostic disable-next-line: missing-fields
	opts = {
		auto_install = false,
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"c",
			"go",
			"cpp",
			"lua",
			"php",
			"css",
			"vim",
			"csv",
			"ini",
			"tsx",
			"xml",
			"luap",
			"diff",
			"html",
			"bash",
			"rust",
			"make",
			"yaml",
			"json",
			"hlsl",
			"llvm",
			"yaml",
			"toml",
			"jsdoc",
			"meson",
			"ninja",
			"json5",
			"jsonc",
			"gomod",
			"cmake",
			"query",
			"regex",
			"luadoc",
			"passwd",
			"printf",
			"python",
			"vimdoc",
			"markdown",
			"gitignore",
			"javascript",
			"typescript",
			"dockerfile",
			"hlsplaylist",
			"markdown_inline",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<Enter>",
				node_incremental = "<Enter>",
				scope_incremental = false,
				node_decremental = "<Backspace>",
			},
		},
		textobjects = {
			move = {
				enable = true,
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.inner",
				},
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
			},
		},
	},
	config = function(_, opts)
		local dedup = function(list)
			local ret = {}
			local seen = {}
			for _, v in ipairs(list) do
				if not seen[v] then
					table.insert(ret, v)
					seen[v] = true
				end
			end
			return ret
		end

		if type(opts.ensure_installed) == "table" then
			opts.ensure_installed = dedup(opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
