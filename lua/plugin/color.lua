require("colortils").setup({
	mappings = {
		-- increment values
		increment = "<Right>",
		-- decrement values
		decrement = "<Left>",
		-- increment values with bigger steps
		increment_big = "d",
		-- decrement values with bigger steps
		decrement_big = "a",
		-- set values to the minimum
		min_value = "0",
		-- set values to the maximum
		max_value = "$",
		-- save the current color in the register specified above with the format specified above
		set_register_default_format = "<m-cr>",
		-- save the current color in the register specified above with a format you can choose
		set_register_choose_format = "g<cr>",
		-- replace the color under the cursor with the current color in the format specified above
		replace_default_format = "<cr>",
		-- replace the color under the cursor with the current color in a format you can choose
		replace_choose_format = "g<m-cr>",
		-- export the current color to a different tool
		export = "E",
		-- set the value to a certain number (done by just entering numbers)
		set_value = "c",
		-- toggle transparency
		transparency = "T",
		-- choose the background (for transparent colors)
		choose_background = "B",
	},
})
