#!/usr/bin/lua
local lxp = require("lxp")
-- should be used to read in xml from stdin
-- local data = io.read("*a")
local items = {}
local elementName = ""

local characterData = function(parser, str)
	items[#items][elementName] = str
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
require 'pl.pretty'.dump(items)
