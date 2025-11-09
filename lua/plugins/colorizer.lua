return {
	-- Red #ff0000 - Green #00ff00 - Blue #0000ff
	"norcalli/nvim-colorizer.lua",
	event = "BufRead",
	config = function()
		require("colorizer").setup()
	end,
}
