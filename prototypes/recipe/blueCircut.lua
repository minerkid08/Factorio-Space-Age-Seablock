data:extend({
	{
		type = "recipe",
		name = "blueCircutRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="blueCircutBoard", amount=1},
			{type="item", name="blueCircutComp", amount=3},
			{type="item", name="redCircutComp", amount=3},
			{type="item", name="copper-cable", amount=2}
		},
		results = {
			{type="item", name="processing-unit", amount=1}
		},
		category = "crafting",
		energy_required = 5,
		subgroup = "intermediate-product"
	},
	{
		type = "recipe",
		name = "blueCircutBoardRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="plasticBoard", amount=1},
			{type="item", name="copper-cable", amount=5}
		},
		results = {
			{type="item", name="blueCircutBoard", amount=1}
		},
		category = "crafting",
		energy_required = 0.5,
		subgroup = "intermediate-product"
	},
	{
		type = "recipe",
		name = "blueCircutCompRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="plastic-bar", amount=1},
			{type="item", name="copper-cable", amount=1},
			{type = "fluid", name = "sulfuric-acid", amount = 5}
		},
		results = {
			{type="item", name="blueCircutComp", amount=5}
		},
		category = "crafting-with-fluid",
		energy_required = 1,
		subgroup = "intermediate-product"
	}
})