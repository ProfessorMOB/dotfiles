local M = {}
M.dashboard = function()
	local dashboard = require("alpha.themes.dashboard")
	
	dashboard.section.header.val = {
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⢀⡄⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠓⠒⠁⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⡿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⡿⡿⡿⡿⡿⡿⣆⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⢠⡿⡿⡿⡿⡿⡿⡿⡿⡿⡆⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⢸⡿⡿⡿⡿⢿⡿⢿⡿⡿⡇⠀⠀⠀⠀⠀⠀⠀",
		"⠀⢀⣀⠠⠤⠤⠤⠼⠿⠧⠿⠷⠼⠿⠼⠿⠿⠧⠤⠤⠤⢤⣀⣀⠀",
		"⡠⠤⠤⠤⠤⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⢶⡶⢶⣤⣤⣬",
		"⢉⣏⣷⣸⣾⠀⣶⡿⣶⡇⡄⢀⣤⡀⢠⢸⣶⡿⣶⢸⡿⣯⡿⣽",
		"⣤⣃⣛⣘⣛⣀⣛⡿⡿⣧⣵⡾⠿⢷⣬⣼⡿⡿⣛⣸⡿⣯⡿⣽",
		"⡿⡿⡿⡿⡿⡿⡿⡿⡿⡿⡿⡇⠀⢸⢿⢿⢿⢿⢿⢿⢿⢿⢿⢿",
		"⡿⡿⡿⡿⡿⡿⡿⡿⡿⡿⡿⡇⠀⢸⢿⢿⢿⢿⢿⢿⢿⢿⢿⢿", 
	}
	dashboard.section.footer.val= {
		"In the name of Allah", 
		" the Most Graceful,",
		" the Most Merciful,",
		-- "        ﷳ  ﷲ",
		-- "     ﷽             ",
	}

	require("dashboards.buttons").buttons(dashboard)

	return dashboard.config
end

return M
