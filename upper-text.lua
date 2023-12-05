local M = {}

-- Define a Neovim command to add quotes to the selected text
vim.cmd([[command! -range AddQuotes lua require('plugins.add_quotes').add_quotes()]])

-- Define the function to add quotes to selected text
function M.add_quotes()
    -- Get the selected text range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Loop through the selected lines and add quotes
    for line_num = start_line, end_line do
        local line_content = vim.fn.getline(line_num)
        vim.fn.setline(line_num, "'" .. line_content .. "'")
    end

    -- Disable visual mode after adding quotes
    vim.cmd("normal! gv")
end

-- Return the module
return M

