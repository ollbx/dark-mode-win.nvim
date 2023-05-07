local M = {}

function M:detect()
	local cmd = 'reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'

	local file = assert(io.popen(cmd, 'r'))
	local output = assert(file:read('*all'))
	file:close()

	print(output)
end

return M
