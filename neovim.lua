local function terracotta_active()
    local theme_file = vim.fn.expand("~/.local/state/omarchy/current/theme.name")
    local ok, lines = pcall(vim.fn.readfile, theme_file, "", 1)
    return ok and lines[1] == "terracotta"
end

local plugins = {
    {
        "briginas/terracotta.nvim",
        dependencies = { "topazape/oldtale.nvim" },
        lazy = true,
        priority = 1000,
        init = function()
            -- Omarchy reapplies its generated Aether spec to open editors on a theme switch.
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = vim.api.nvim_create_augroup("TerracottaOldTale", { clear = true }),
                pattern = "aether",
                callback = function()
                    if terracotta_active() then
                        vim.schedule(function()
                            if vim.g.colors_name == "aether" and terracotta_active() then
                                vim.cmd.colorscheme("terracotta")
                            end
                        end)
                    end
                end,
            })
        end,
    },
}

if terracotta_active() then
    table.insert(plugins, { "LazyVim/LazyVim", opts = { colorscheme = "terracotta" } })
end

return plugins
