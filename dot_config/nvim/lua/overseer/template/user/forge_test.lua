return {
	name = "forge test",
	builder = function()
		return {
			cmd = { "forge" },
			args = { "test" },
		}
	end,
	condition = {
		filetype = { "solidity" },
	},
}
