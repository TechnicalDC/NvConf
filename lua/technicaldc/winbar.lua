---@diagnostic disable: unused-function
local opts = require("technicaldc.config")

local function getFilename()
	local sep = " > "

	local cwd = vim.fn.getcwd()
	local home = os.getenv("HOME")

	cwd = home and cwd:gsub(home, "~") or cwd
	cwd = table.concat(vim.fn.split(cwd, "/"), sep)

	local head = vim.fn.expand("%:.:h")
	head = table.concat(vim.fn.split(head, "/"), sep)
	if head == "" then
		return ""
	end

	local tail = vim.fn.expand("%:t")

	local readonly = vim.bo.readonly and "%#Error#  " or ""
	local modified = vim.bo.modified and "%#WarningMsg#  " or ""

	local file_breadcrumb = " " .. (cwd and cwd .. "%#Normal#" .. sep or "")
	.. (head == "." and "" or "%#Normal#" .. head .. sep)
	.. ("%#Normal#" .. tail .. readonly .. modified .. "%#Normal#")

	return file_breadcrumb
end

local function getFiletype()
	local filetype_icon, filetype_hl = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)
	return (filetype_icon and "%#" .. filetype_hl .. "#" .. filetype_icon .. " %#Normal#" .. vim.bo.filetype or "") .. " "
end

local excludes = function()
	if vim.tbl_contains(opts.exclude_filetype, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

local show_winbar = function()

    local value = getFilename()
	 value = value .. "%="
	 value = value .. getFiletype()

    local status_ok, _ = pcall(vim.api.nvim_set_option_value, 'winbar', value, { scope = 'local' })
    if not status_ok then
        return
    end
end

if opts.winbar.enabled == true then
	vim.api.nvim_create_autocmd({ 'DirChanged', 'CursorMoved', 'BufFilePost', 'InsertEnter', 'BufWritePost' }, {
		callback = function()
			show_winbar()
		end
	})
	show_winbar()
end
