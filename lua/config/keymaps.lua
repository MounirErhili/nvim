-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Mouse LSP support --
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Hover\ Info <cmd>lua vim.lsp.buf.hover()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Signature\ Help <cmd>lua vim.lsp.buf.signature_help()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ References <cmd>lua vim.lsp.buf.references()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Document\ Symbol <cmd>lua vim.lsp.buf.document_symbol()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Workspace\ Symbol <cmd>lua vim.lsp.buf.workspace_symbol()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Code\ Actions <cmd>lua vim.lsp.buf.code_action()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Show\ Diagnostics <cmd>lua vim.diagnostic.open_float()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Next\ Diagnostic <cmd>lua vim.diagnostic.goto_next()<CR>]])
vim.cmd([[:amenu 10.100 mousemenu.Previous\ Diagnostic <cmd>lua vim.diagnostic.goto_prev()<CR>]])

-- Normal mode --
local normal = function(key, value, opts)
	opts = opts or {}
	opts["noremap"] = true
	opts["silent"] = true
	vim.keymap.set("n", key, value, opts)
end

-- TIP: Disable arrow keys in normal mode
-- normal('<left>', '<cmd>echo "Use h to move!!"<CR>')
-- normal('<right>', '<cmd>echo "Use l to move!!"<CR>')
-- normal('<up>', '<cmd>echo "Use k to move!!"<CR>')
-- normal('<down>', '<cmd>echo "Use j to move!!"<CR>')

normal("<Tab>", "<cmd>:popup mousemenu<CR>", { desc = "Show mouse menu." })
normal("<RightMouse>", "<cmd>:popup mousemenu<CR>", { desc = "Show mouse menu." })

normal("n", "nzzzv", { desc = "Center next search." })
normal("N", "Nzzzv", { desc = "Center previous search." })
normal(";", ":", { desc = "Enter command mode." })
normal("Q", "<cmd>qa!<CR>", { desc = "Quite all buffers." })
normal("W", "<cmd>wa!<CR>", { desc = "Save all buffers." })
normal("<A-v>", "<C-v>", { desc = "Enter visual block mode for selecting multiple lines." })
normal("<C-s>", "<cmd>w<CR>", { desc = "Save current buffer." })
normal("<C-q>", "<cmd>q<CR>", { desc = "Quite neovim." })
normal("<A-k>", "<cmd>m .-2<CR>", { desc = "Move current line Up." })
normal("<A-j>", "<cmd>m .+1<CR>", { desc = "Move current line Down." })
normal("<Leader>c", "<cmd>bdelete<CR>", { desc = "Close current buffer." })
normal("<Leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights." })
normal("<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights." })
normal("<A-Right>", "<cmd>bnext<CR>", { desc = "Cycle throw next buffer." })
normal("<A-Left>", "<cmd>bprevious<CR>", { desc = "Cycle throw prev buffer." })
normal("<C-b>", "<cmd>Neotree float<CR>", { desc = "Toggle nvim tree." })
normal("<C-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Comment current line." })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
normal("<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
normal("<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
normal("<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
normal("<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize with arrows
normal("<A-Up>", ":resize -2<CR>", { desc = "Resize window Up" })
normal("<A-Down>", ":resize +2<CR>", { desc = "Resize window Down" })
normal("<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window Left" })
normal("<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window Right" })

---- Diagnostic keymaps
normal("[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
normal("]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
normal("gl", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
normal("<Leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Insert mode --
local insert = function(key, value, opts)
	opts = opts or {}
	opts["noremap"] = true
	opts["silent"] = true
	vim.keymap.set("i", key, value, opts)
end

insert("<C-b>", "<Esc><cmd>Neotree toggle<CR>", { desc = "Toggle nvim tree." })
insert(";;", "<Esc>", { desc = "Exit insert mode." })
insert("<C-s>", "<Esc><cmd>w<CR>", { desc = "Save current buffer." })
insert("<C-q>", "<Esc><cmd>q<CR>", { desc = "Quite current buffer." })
insert("zz", "<Esc><cmd>norm! zz<CR>", { desc = "Center window." })
insert("<A-Right>", "<Esc><cmd>bnext<CR>", { desc = "Cycle throw next buffer." })
insert("<A-Left>", "<Esc><cmd>bprevious<CR>", { desc = "Cycle throw prev buffer." })
insert("<A-k>", "<Esc><cmd>m .-2<CR>==ga", { desc = "Move Text Up." })
insert("<A-j>", "<Esc><cmd>m .+1<CR>==ga", { desc = "Move Text Down." })
insert(
	"<C-/>",
	'<Esc><cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
	{ desc = "Comment current line." }
)

-- Visual mode --
local visual = function(key, value, opts)
	opts = opts or {}
	opts["noremap"] = true
	opts["silent"] = true
	vim.keymap.set("v", key, value, opts)
end

visual("<A-k>", "<cmd>m '<-2<CR>gv-gv", { desc = "Move Text Up." })
visual("<A-j>", "<cmd>m '>+1<CR>gv-gv", { desc = "Move Text Down." })
visual("p", 'p<cmd>let @+=@0<CR><cmd>let @"=@0<CR>', { desc = "Don't copy replaced text." })
visual(
	"<C-/>",
	'<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ desc = "Comment blockwise." }
)

-- Stay in indent mode
visual("<", "<gv^", { desc = "Indent left." })
visual(">", ">gv^", { desc = "Indent right." })

-- Move text up and down
visual("<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down." })
visual("<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up." })
visual("p", [["_dP]], { desc = "Avoid copy on paste." })

-- Visual Block mode --
local visual_block = function(key, value, opts)
	opts = opts or {}
	opts["noremap"] = true
	opts["silent"] = true
	vim.keymap.set("x", key, value, opts)
end

-- Move text up and down
visual_block("J", ":m '>+1<CR>gv=gv", { desc = "Move text down." })
visual_block("K", ":m '<-2<CR>gv=gv", { desc = "Move text up." })
visual_block("<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down," })
visual_block("<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up." })
visual_block("p", [["_dP]], { desc = "Avoid copy on paste." })

-- Terminal mode --

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
