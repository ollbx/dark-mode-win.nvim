# dark-mode-win.nvim

This is a simple plugin to detect the dark mode in Windows, making it easy to
adapt the color theme accordingly.

Example usage:

```lua
local dmw = require('dark-mode-win')

if dmw.is_dark() then
    vim.opt.background = 'dark'
    vim.cmd.colorscheme('nightfox')
else
    vim.opt.background = 'light'
    vim.cmd.colorscheme('dayfox')
end
```

The result of the detection is cached, but can be updated by calling `detect()`.

| Function     | Description |
| ------------ | ----------- |
| `is_dark()`  | Returns true when the dark theme is active. |
| `is_light()` | Returns true when the light theme is active. |
| `detect()`   | Updates the cached result of the detection. |
| `theme()`    | Return "dark" or "light" as a string. |
