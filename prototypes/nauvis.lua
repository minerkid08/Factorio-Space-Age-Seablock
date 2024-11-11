require("utils")

local mineralizedWater = table.deepcopy(data.raw["fluid"]["water"])

mineralizedWater.name = "mineralized-water"
data:extend({ mineralizedWater })

item("filter-frame", 50)
item("coal-filter", 50)

recipe(
	"coal-filter",
	{ { type = "item", name = "filter-frame", amount = 5 }, { type = "item", name = "coal", amount = 1 } },
	{ { type = "item", name = "coal-filter", amount = 5 } },
	0.5
)

recipe(
	"filter-frame",
	{ { type = "item", name = "iron-plate", amount = 5 } },
	{ { type = "item", name = "filter-frame", amount = 5 } },
	0.5
)

recipe(
	"water-filtering",
	{ { type = "item", name = "coal-filter", amount = 5 }, { type = "fluid", name = "water", amount = 50 } },
	{
		{ type = "item", name = "filter-frame", amount = 5 },
		{ type = "fluid", name = "mineralized-water", amount = 50 },
	},
	1,
	"chemistry",
	"__base__/graphics/icons/fluid/water.png",
	64
)

recipe(
	"stone-crystalization",
	{ { type = "fluid", name = "mineralized-water", amount = 20 } },
	{ { type = "item", name = "stone", amount = 4 } },
	1,
	"chemistry"
)

recipe(
	"basic-iron-smelting",
	{ { type = "item", name = "saphirite", amount = 4 } },
	{ { type = "item", name = "iron-plate", amount = 3 } },
	3.2,
	"smelting"
)
recipe(
	"basic-copper-smelting",
	{ { type = "item", name = "stiritite", amount = 4 } },
	{ { type = "item", name = "copper-plate", amount = 3 } },
	3.2,
	"smelting"
)

data.raw["recipe"]["coal-filter"].enabled = true
data.raw["recipe"]["filter-frame"].enabled = true
data.raw["recipe"]["water-filtering"].enabled = true
data.raw["recipe"]["basic-iron-smelting"].enabled = true
data.raw["recipe"]["basic-copper-smelting"].enabled = true
data.raw["recipe"]["saphirite-crystalization-nauvis"].enabled = true
data.raw["recipe"]["stiritite-crystalization-nauvis"].enabled = true

data.raw["technology"]["oil-processing"].effects = {
	{ type = "unlock-recipe", recipe = "oil-refinery" },
	{ type = "unlock-recipe", recipe = "basic-oil-processing" },
	{ type = "unlock-recipe", recipe = "solid-fuel-from-petroleum-gas" },
	{ type = "unlock-recipe", recipe = "sulfurLiquidification" },
}

data:extend({
	{
		type = "technology",
		name = "chemical-plant",
		unit = {
			count = 25,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 10,
		},
		prerequisites = {
			"automation",
			"steel-processing",
		},
		effects = {
			{ type = "unlock-recipe", recipe = "chemical-plant" },
		},
		icon = "__base__/graphics/icons/chemical-plant.png",
	},
})

data.raw["planet"]["nauvis"].map_gen_settings = {
	autoplace_settings = {
		tile = {
			settings = {
				["deepwater"] = {},
				["sand-1"] = {},
			},
		},
	},
}

data.raw["tile"]["deepwater"].autoplace = {
	probability_expression = 0.5,
}

data.raw["tile"]["sand-1"].autoplace = {
	probability_expression = "abs(x)<5&abs(y)<5",
}
