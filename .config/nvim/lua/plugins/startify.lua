vim.g.startify_session_dir = "~/.config/nvim/sessions"

vim.cmd ([[ 
let g:startify_custom_header = [""]

let g:startify_lists = [
\   { "type": "bookmarks", "header": ["   Bookmarks"        ]            },
\   { "type": "files",     "header": ["   Files"            ]            },
\   { "type": "dir",       "header": ["   Current Directory ". getcwd()] },
\   { "type": "sessions",  "header": ["   Sessions"         ]             },
\ ]

let g:startify_bookmarks = [
\   { "c": "~/.config/nvim/" },
\   { "s": "~/.config/nvim/lua/settings.lua" },
\   { "p": "~/.config/nvim/lua/plugins.lua" },
\   { "z": "~/.zshrc"  },
\ ]
]])

vim.g.startify_session_autoload = true
-- vim.g.startify_session_delete_buffers = true
vim.g.startify_change_to_vcs_root = true
vim.g.startify_fortune_use_unicode = true
vim.g.startify_session_persistence = true
vim.g.webdevicons_enable_startify = true
