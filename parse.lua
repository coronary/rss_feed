#!/usr/bin/lua
local lxp = require("lxp")
-- should be used to read in xml from stdin
-- local data = io.read("*a")
local items = {}
local elementName = ""

local characterData = function(parser, str)
	items[#items][elementName] = string.gsub(str, "^WFMU MP3 Archive: ", "")
end

callbacks = {
	StartElement = function(parser, name)
		if name == "item" then
			items[#items + 1] = {}
			callbacks.CharacterData = characterData
		else
			elementName = name
		end
	end,
	EndElement = function(parser, name)
		if name == "item" then
			callbacks.CharacterData = false
		end
	end,
	CharacterData = false,
}
p = lxp.new(callbacks)

for l in io.lines() do -- iterate lines
	p:parse(l)           -- parses the line
end
p:parse()              -- finishes the document
p:close()              -- closes the parser


-- use if going awk route
-- local wfmu_fields = { "description", "guid", "link", "pubDate", "title" }
-- function record_string(...)
-- 	return string.format(string.rep("%s|", 4) .. "%s\n", ...)
-- end

io.write("[playlist]")
for index = 1, #items do
	local x = items[index]
	-- need to figure out how to use the values from wfmu_fields here instead of the hardcode
	io.write(string.format("File%d=%s\n", index, x.link))
	io.write(string.format("Title%d=%s\n", index, x.title))
	io.write("\n\n")
end
io.write("NumberOfEntries=" .. #items)
