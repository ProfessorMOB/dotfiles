local M = {}

M.dashboard = function() 
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {

		". 　　　。　　　　•　 　ﾟ　　。 　　.",
		"",
		"　　　.　　　 　　.　　　　　。　　 。　. 　",
		"",
		".　　 。　　　• . 　　 • 　　　　•",
		"",
		"　　ﾟ　　 Red was not An Impostor.　 ඞ。　.",
		"",
		"　　'　　　 1 Impostor remains 　 　　。",
		"",
		"　　ﾟ　　　.　　　. 　　　　.　 .",
	}

	dashboard.section.footer.val= {                                       
		"\"Red is sus\"",
		"	-White, before Red was ejected",
	}                                               

	require("dashboards.buttons").buttons(dashboard)                      

	return dashboard.config
end

return M




























