local M = {}

M.get_file_name = function()
    local file_name = vim.fn.expand("%:t")
    return file_name
end

M.get_file_path = function()
    local file_path = vim.fn.expand("%:p")
    return file_path
end

M.get_file_directory = function()
    local file_directory = vim.fn.expand("%:p:h")
    return file_directory
end

M.get_file_extension = function()
    local file_extension = vim.fn.expand("%:e")
    return file_extension
end

M.get_file_name_without_extension = function()
    local file_name_without_extension = vim.fn.expand("%:t:r")
    return file_name_without_extension
end


return M
