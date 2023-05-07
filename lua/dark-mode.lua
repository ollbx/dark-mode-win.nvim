local M = {}

function M:detect()
	local cmd = 'reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'

	local file = assert(io.popen(cmd, 'r'))
	local output = assert(file:read('*all'))
	file:close()

	local result = output:match('AppsUseLightTheme%s+REG_DWORD%s+0x(%d+)')
	print(result)
end

return M
