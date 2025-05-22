-- Substitute placeholders in the template string with actual values
local function substitute_template(template_str, values)
	return template_str:gsub("%${(.-)}", function(key)
		return values[key] or ""
	end)
end

-- Generate a file using a string template and values
local function generate_file_from_template(template_str, values, output_path)
	local result = substitute_template(template_str, values)

	local file = io.open(output_path, "w")
	if file then
		file:write(result)
		file:close()
		print("File created at: " .. output_path)
	else
		print("Failed to write file.")
	end
end

local template = [[
{
	"name": "${name}",
	"email": "${email}",
	"role": "${role}"
}
]]

local values = {
	name = "Dilip Chauhan",
	email = "dilip@example.com",
	role = "Developer"
}

generate_file_from_template(template, values, "/home/dilip/output.json")
