return {
		--> Setup Indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function() 
			require("ibl").setup ({
				indent = { char = "╎" },
				scope = { show_start = false },
			})
		end,
	}, {
		"NMAC427/guess-indent.nvim",
		config = function() 
			require("guess-indent").setup() 
		end,
	},
}
