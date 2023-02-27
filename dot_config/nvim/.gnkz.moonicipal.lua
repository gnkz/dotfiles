local moonicipal = require "moonicipal"
local T = moonicipal.tasks_file()

function create_terminal(cmd, auto_close)
    local tt = require("toggleterm.terminal").Terminal
    return tt:new({
        cmd = cmd,
        close_on_exit = auto_close,
        on_open = function()
            vim.cmd("stopinsert!")
        end,
        on_close = function()
            vim.cmd("startinsert!")
        end
    })
end

function T:diff()
    local diff = create_terminal("/opt/homebrew/bin/chezmoi diff", false)

    diff:toggle()
end

function T:apply()
    local apply = create_terminal("/opt/homebrew/bin/chezmoi apply", true)

    apply:toggle()
end

function T:readd()
    local readd = create_terminal("/opt/homebrew/bin/chezmoi re-add", true)

    readd:toggle()
end
