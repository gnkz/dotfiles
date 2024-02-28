return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "deepseek-coder"
		})
	end
}
