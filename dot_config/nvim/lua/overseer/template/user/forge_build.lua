return {
	name = "forge build",
	builder = function()
		return {
			cmd = { "forge" },
			args = { "build" },
		}
	end,
	condition = {
		filetype = { "solidity" },
	},
}
