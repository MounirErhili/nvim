return {
	"akinsho/bufferline.nvim",
	version = "*",
	branch = "main",
	event = "BufAdd",
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		---@diagnostic disable-next-line: redundant-parameter
		require("bufferline").setup({
			highlights = {
				background = {
					italic = true,
				},
				buffer_selected = {
					bold = true,
				},
			},
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = ""
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. " " .. sym
					end
					return s
				end,
			},
		})
	end,
}
