return function()
    require('onedark').setup {
        style = 'darker',
        -- transparent = true,
        term_colors = true,
        toggle_style_key = "<leader>ts",
        toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

        code_style = {
            comments = 'italic',
            keywords = 'italic',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },

        highlights = {
            TSRepeat = {fg = "#cccccc"},
        },

        diagnostics = {
            darker = true, -- darker colors for diagnostic
            undercurl = false,   -- use undercurl instead of underline for diagnostics
            background = true,    -- use background color for virtual text
        },
    }
end
