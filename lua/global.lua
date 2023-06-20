local M = {}

function M.set_mappings(mode, table)
    for keymap, opts in pairs(table) do
        local cmd = opts;
        cmd = opts[1]
        opts[1] = nil

        if cmd then
            vim.keymap.set(mode, keymap, cmd, opts)
        end
    end
end

function M.empty() end

function M.user_event(event)
    vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "LY" .. event })
    end)
end

function M.user_autocmd(table)
    table.pattern = "LY" .. table.pattern
    vim.api.nvim_create_autocmd("User", table)
end

M.autocmd = vim.api.nvim_create_autocmd

function M.set_theme(theme)
    vim.cmd("colorscheme " .. theme)
end

return M;
