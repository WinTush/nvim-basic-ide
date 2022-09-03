local M = {}

M.config = function()
    local status_ok, wilder = pcall(require, "wilder")
    if not status_ok then
        return
    end
    wilder.setup({
        modes = { ':', '/', '?' },
    })
    wilder.set_option('pipeline', {
        wilder.branch(
            wilder.cmdline_pipeline({
                fuzzy = 1,
                set_pcre2_pattern = 1,
            }),
            wilder.python_search_pipeline({
                pattern = 'fuzzy',
            })
        ),
    })

    wilder.set_option('renderer', wilder.popupmenu_renderer({
        -- highlighter applies highlighting to the candidates
        highlighter = {
            wilder.pcre2_highlighter(),
            wilder.basic_highlighter(),
        },
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
        pumblend = 20,
        highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
        },
    }))
end

return M
