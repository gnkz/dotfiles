return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "llama3.2",
		})
	end,
}
