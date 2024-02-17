return {
	{
		"idanarye/nvim-moonicipal",
		lazy = false,
		config = function()
			require("moonicipal").setup({
				file_prefix = ".gnkz",
			})
		end
	}
}
