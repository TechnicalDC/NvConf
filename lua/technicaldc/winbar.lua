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

	local readonly = vim.bo.readonly and "%#DiagnosticSignError#  " or ""
	local modified = vim.bo.modified and "%#DiagnosticSignWarn#  " or ""

	local file_breadcrumb = " " .. (cwd and cwd .. "%#Normal#" .. sep or "")
	.. (head == "." and "" or "%#Normal#" .. head .. sep)
	.. ("%#Normal#" .. tail .. readonly .. modified .. "%#Normal#")

	return file_breadcrumb
end

local function getFiletype()
	local filetype_icon, filetype_hl = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)
	return (filetype_icon and "%#" .. filetype_hl .. "#" .. filetype_icon .. " %#Normal#" .. vim.bo.filetype or "") .. " "
end

local function getDiagnostics()
	local error_count, warning_count, info_count, hint_count
	local diagnostics = vim.diagnostic.get(0)
	local count = { 0, 0, 0, 0 }
	for _, diagnostic in ipairs(diagnostics) do
		if vim.startswith(vim.diagnostic.get_namespace(diagnostic.namespace).name, 'vim.lsp') then
			count[diagnostic.severity] = count[diagnostic.severity] + 1
		end
	end
	error_count = count[vim.diagnostic.severity.ERROR]
	warning_count = count[vim.diagnostic.severity.WARN]
	info_count = count[vim.diagnostic.severity.INFO]
	hint_count = count[vim.diagnostic.severity.HINT]
	return error_count, warning_count, info_count, hint_count
end

local excludes = function()
	if vim.tbl_contains(opts.winbar.exclude_filetype, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

_G.show_winbar = function()
	if excludes() then
		return
	end

	local error_count, warning_count, info_count, hint_count = getDiagnostics()
	local sign

	local value = getFilename()
	value = value .. "%="

	if error_count > 0 then
		sign = vim.fn.sign_getdefined("DiagnosticSignError")[1]
		value = value .. "%#" .. sign.texthl .. "#" .. sign.text .. error_count .. "%#Winbar# "
	end

	if warning_count > 0 then
		sign = vim.fn.sign_getdefined("DiagnosticSignWarn")[1]
		value = value .. "%#" .. sign.texthl .. "#" .. sign.text .. warning_count .. "%#Winbar# "
	end

	if info_count > 0 then
		sign = vim.fn.sign_getdefined("DiagnosticSignInfo")[1]
		value = value .. "%#" .. sign.texthl .. "#" .. sign.text .. info_count .. "%#Winbar# "
	end

	if hint_count > 0 then
		sign = vim.fn.sign_getdefined("DiagnosticSignHint")[1]
		value = value .. "%#" .. sign.texthl .. "#" .. sign.text .. hint_count .. "%#Winbar# "
	end

	value = value .. getFiletype()

	local status_ok, _ = pcall(vim.api.nvim_set_option_value, 'winbar', value, { scope = 'local' })
	if not status_ok then
		return
	end
end

if opts.winbar.enabled == true then
	vim.o.winbar = "%!v:lua.show_winbar()";

	vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufModifiedSet" }, {
		callback = function()
			show_winbar()
		end
	})
end
