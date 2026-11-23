local palette = {
    subtext = "#aaa7b0",
    purple = "#9a8dbf",
    green = "#799f8a",
    blue = "#8292c7",
    cyan = "#3f9185",
    rose = "#c56584",
    clay = "#bf7c76",
    sand = "#cc9c86",
    info = "#4F9EAA",
    border = "#AD6866",
    folder = "#D77370",
    hidden_file = "#89868F",
}

local highlights = {
    Number = { fg = palette.purple },
    Keyword = { fg = palette.clay },
    Special = { fg = palette.clay },
    String = { fg = palette.green },
    Type = { fg = palette.sand },

    ["@lsp.typemod.variable.declaration.lua"] = { fg = palette.subtext },
    ["@lsp.type.variable.lua"] = { fg = palette.subtext },
    ["@punctuation.bracket.lua"] = { fg = palette.subtext },

    DiagnosticUnderlineWarn = { underline = true, sp = palette.subtext },
    DiagnosticInfo = { fg = palette.info, bg = "none", bold = true },
    LualineNormalMode = { bg = palette.border },
    NoiceCmdlinePopupBorder = { fg = palette.border, bold = true },
    NoiceCmdlineIconCmdline = { link = "NoiceCmdlinePopupBorder" },
    SnacksNotifierBorderInfo = { fg = palette.border, bold = true },
    SnacksNotifierTitleInfo = { link = "SnacksNotifierBorderInfo" },
    SnacksNotifierIconInfo = { link = "SnacksNotifierBorderInfo" },
    SnacksNotifierBorderWarn = { fg = palette.border },
    SnacksNotifierTitleWarn = { link = "SnacksNotifierBorderWarn" },
    NeoTreeHiddenDirectory = { fg = palette.border },
    NeoTreeHiddenFile = { fg = palette.hidden_file },
    NeoTreeDirectoryName = { fg = palette.folder },
    NeoTreeDirectoryIcon = { fg = palette.folder },
}

-- TypeScript and TSX: LSP groups use the Neovim filetype.
local typescript_lsp = {
    ["@lsp.type.method"] = palette.blue,
    ["@lsp.type.parameter"] = palette.subtext,
    ["@lsp.type.property"] = palette.rose,
    ["@lsp.typemod.type.defaultLibrary"] = palette.sand,
    ["@lsp.typemod.parameter.declaration"] = palette.subtext,
    ["@lsp.typemod.variable.readonly"] = palette.subtext,
    ["@lsp.typemod.function.readonly"] = palette.blue,
    ["@lsp.typemod.function.declaration"] = palette.subtext,
    ["@lsp.typemod.function.defaultLibrary"] = palette.blue,
    ["@lsp.typemod.method.defaultLibrary"] = palette.blue,
    ["@lsp.typemod.method.declaration"] = palette.blue,
    ["@lsp.typemod.class.defaultLibrary"] = palette.purple,
    ["@lsp.typemod.interface.defaultLibrary"] = palette.sand,
    ["@lsp.mod.defaultLibrary"] = palette.rose,
}

for group, color in pairs(typescript_lsp) do
    highlights[group .. ".typescript"] = { fg = color }
    highlights[group .. ".typescriptreact"] = { fg = color }
end

highlights["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = palette.blue }
highlights["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = palette.rose }

-- Tree-sitter groups use the parser name.
for _, group in ipairs({
    "@keyword.conditional.ternary",
    "@variable.member",
    "@variable",
    "@punctuation.bracket",
    "@punctuation.special",
    "@punctuation.delimiter",
}) do
    highlights[group .. ".typescript"] = { fg = palette.subtext }
    highlights[group .. ".tsx"] = { fg = palette.subtext }
end

highlights["@character.special.typescript"] = { fg = palette.subtext }
highlights["@tag.attribute.tsx"] = { fg = palette.subtext }
highlights["@tag.builtin.tsx"] = { fg = palette.cyan }
highlights["@tag.tsx"] = { fg = palette.cyan }
highlights["@tag.delimiter.tsx"] = { fg = palette.cyan, bold = true }
highlights["@constant.tsx"] = { fg = palette.subtext }

local function terracotta_active()
    local theme_file = vim.fn.expand("~/.local/state/omarchy/current/theme.name")
    local ok, lines = pcall(vim.fn.readfile, theme_file, "", 1)
    return ok and lines[1] == "terracotta"
end

local plugins = {
    {
        "topazape/oldtale.nvim",
        name = "oldtale.nvim",
        lazy = true,
        priority = 1000,
        opts = { highlight_overrides = highlights },
        init = function()
            -- Omarchy reapplies its generated Aether spec to open editors on a theme switch.
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = vim.api.nvim_create_augroup("TerracottaOldTale", { clear = true }),
                pattern = "aether",
                callback = function()
                    if terracotta_active() then
                        vim.schedule(function()
                            if vim.g.colors_name == "aether" and terracotta_active() then
                                vim.cmd.colorscheme("oldtale")
                            end
                        end)
                    end
                end,
            })
        end,
    },
}

if terracotta_active() then
    table.insert(plugins, { "LazyVim/LazyVim", opts = { colorscheme = "oldtale" } })
end

return plugins
