local M = {}
local detect_result = nil

local function detect_impl()
	if not vim.loop.os_uname().version:match("Windows") then
		return nil
	end

	local cmd = 'reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'

	local file = io.popen(cmd, 'r')

	if file == nil then
		return true -- Assume light theme on error.
	end

	local output = file:read('*all')
	file:close()

	if output == nil then
		return nil
	end

	local value = output:match('AppsUseLightTheme%s+REG_DWORD%s+0x(%d+)')

	if value == nil then
		return nil
	end

	return (value == '1')
end

-- Updates the cached detection result.
function M.detect()
	detect_result = detect_impl()
end

-- Returns true if the light theme has been detected.
function M.is_light()
	if detect_result == nil then
		M.detect()
	end

	return detect_result
end

-- Returns true if the dark theme has been detected.
function M.is_dark()
	return not M.is_light()
end

-- Returns a string "light" or "dark" depending on the detected theme.
function M.theme()
	if M.is_light() then
		return "light"
	end
	return "dark"
end

return M
