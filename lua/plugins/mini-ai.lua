return {
	-- Better Around/Inside textobjects
	--
	-- Examples:
	--  - va)  - [V]isually select [A]round [)]paren
	--  - yinq - [Y]ank [I]nside [N]ext [']quote
	--  - ci'  - [C]hange [I]nside [']quote
	"echasnovski/mini.ai",
	version = false,
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
	end,
}
