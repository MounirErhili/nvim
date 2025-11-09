return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "VeryLazy",
	enabled = true,
	config = function()
		local is_loaded = function(name)
			local Config = require("lazy.core.config")
			return Config.plugins[name] and Config.plugins[name]._.loaded
		end

		local opts = function(name)
			local plugin = require("lazy.core.config").spec.plugins[name]
			if not plugin then
				return {}
			end
			local Plugin = require("lazy.core.plugin")
			return Plugin.values(plugin, "opts", false)
		end

		-- If treesitter is already loaded, we need to run config again for textobjects
		if is_loaded("nvim-treesitter") then
			local _opts = opts("nvim-treesitter")
			require("nvim-treesitter.configs").setup({ textobjects = _opts.textobjects })
		end

		-- When in diff mode, we want to use the default
		-- vim text objects c & C instead of the treesitter ones.
		local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
		local configs = require("nvim-treesitter.configs")
		for name, fn in pairs(move) do
			if name:find("goto") == 1 then
				move[name] = function(q, ...)
					if vim.wo.diff then
						local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
						for key, query in pairs(config or {}) do
							if q == query and key:find("[%]%[][cC]") then
								vim.cmd("normal! " .. key)
								return
							end
						end
					end
					return fn(q, ...)
				end
			end
		end
	end,
}
