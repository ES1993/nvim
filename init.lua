for _, source in ipairs {
    "config.options",
    "config.lazy",
    "config.autocmds",
    "config.mappings",
} do
    local ok, err = pcall(require, source)
    if not ok then
        local msg = "failed to load " .. source .. "\n\n" .. err
        vim.api.nvim_err_writeln(msg)
    end
end
