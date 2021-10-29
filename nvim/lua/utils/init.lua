local utils = { }

local scopes = {
  o = vim.o, 
  b = vim.bo, 
  w = vim.wo
}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- :Root, Change directory to the root of the Git repository
function utils.groot()
  local handle = io.popen('git rev-parse --show-toplevel')
  local root = handle:read("*a")
  handle:close()
  if (root == nil or root == '') then
    vim.api.nvim_echo({ { 'Not in git repo', 'WarningMsg' } }, false, {})
  else
    vim.cmd('lcd'..root) 
  end
end
vim.cmd [[command! Root lua require('utils').groot()]]

-- :Rgitcls, Change directory to the root of the Git repository
function utils.rgitcls()
  local handle = io.popen('echo ${HOME}/Documents/git/cls')
  local root = handle:read("*a")
  handle:close()
  if (root == nil or root == '') then
    vim.api.nvim_echo({ { 'Not in git repo', 'WarningMsg' } }, false, {})
  else
    vim.cmd('lcd'..root) 
  end
end
vim.cmd [[command! Rgitcls lua require('utils').rgitcls()]]

return utils
