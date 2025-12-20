
--[[ variables ]]--

local opt = vim.opt

local map = vim.api.nvim_set_keymap



--[[ set hotkey method (normal) ]]--
function setNormal(key, cmd)
	map('n', key, command, {noremap = true})
end



-- [[ set hotkey method (input) ]]--
function setInput(key, command)
	map('i', key, command, {noremap = true})
end



--[[ set hotkey method (visual) ]]--
function setVisual(key, command)
	map('v', key, command, {noremap = true})
end



--[[ set hotkey method (terminal) ]]--
function setTerminal(key, command)
	map('t', key, command, {noremap = true})
end
