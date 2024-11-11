data:extend({
	{
		type = "recipe",
		name = "redCircutRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="redCircutBoard", amount=1},
			{type="item", name="redCircutComp", amount=3},
			{type="item", name="copper-cable", amount=2}
		},
		results = {
			{type="item", name="advanced-circuit", amount=1}
		},
		category = "crafting",
		energy_required = 5,
		subgroup = "intermediate-product"
	},
	{
		type = "recipe",
		name = "plasticBoardRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="plastic-bar", amount=1}
		},
		results = {
			{type="item", name="plasticBoard", amount=1}
		},
		category = "crafting",
		energy_required = 1,
		subgroup = "intermediate-product"
	},
	{
		type = "recipe",
		name = "redCircutBoardRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="plasticBoard", amount=1},
			{type="item", name="copper-cable", amount=2}
		},
		results = {
			{type="item", name="redCircutBoard", amount=1}
		},
		category = "crafting",
		energy_required = 1,
		subgroup = "intermediate-product"
	},
	{
		type = "recipe",
		name = "redCircutCompRecipe",
		enabled = false,
		ingredients = {
			{type="item", name="plastic-bar", amount=1},
			{type="item", name="copper-cable", amount=1},
			{type="item", name="copper-plate", amount=1}
		},
		results = {
			{type="item", name="redCircutComp", amount=5}
		},
		category = "crafting",
		energy_required = 0.5,
		subgroup = "intermediate-product"
	}
})