return {
	name = "forge fmt",
	builder = function()
		return {
			cmd = { "forge" },
			args = { "fmt" },
		}
	end,
	condition = {
		filetype = { "solidity" },
	},
}
