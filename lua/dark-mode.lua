local M = {}

function M:is_light()
	local cmd = 'reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'

	local file = io.popen(cmd, 'r')

	if file == nil then
		return true -- Assume light theme on error.
	end

	local output = file:read('*all')
	file:close()

	if output == nil then
		return true
	end

	local value = output:match('AppsUseLightTheme%s+REG_DWORD%s+0x(%d+)')

	if value == nil then
		return true
	end

	return value == '1'
end

function M:is_dark()
	return not self:is_light()
end

return M
