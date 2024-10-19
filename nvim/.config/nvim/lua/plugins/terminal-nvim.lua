return {
	"rebelot/terminal.nvim",
	config = function()
		local term = require("terminal")
		local term_map = require("terminal.mappings")

		term.setup()

		vim.keymap.set("n", "<leader>to", term_map.toggle)
		vim.keymap.set("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }))
		vim.keymap.set("n", "<leader>tr", term_map.run)
		vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
	end,
}
