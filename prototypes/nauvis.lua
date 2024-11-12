require("utils")

local mineralizedWater = table.deepcopy(data.raw["fluid"]["water"])

mineralizedWater.name = "mineralized-water"
mineralizedWater.icon = imagePath("item/mineralized-water.png")
data:extend({ mineralizedWater })

local wasteWater = table.deepcopy(data.raw["fluid"]["water"])

wasteWater.name = "waste-water"
wasteWater.icon = imagePath("item/waste-water.png")
data:extend({ wasteWater })

item("filter-frame", 50, "item/filter-frame.png", 64)
item("coal-filter", 50, "item/coal-filter.png", 64)
item("ceramic-filter", 50, "item/ceramic-filter.png", 64)
item("used-ceramic-filter", 50, "item/used-ceramic-filter.png", 64)

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
		{ type = "fluid", name = "mineralized-water", amount = 30 },
	},
	1,
	"chemistry",
	imagePath("item/mineralized-water.png"),
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

recipe(
	"ceramic-filtering",
	{ { type = "item", name = "ceramic-filter", amount = 5 }, { type = "fluid", name = "water", amount = 50 } },
	{
		{ type = "item", name = "used-ceramic-filter", amount = 5 },
		{ type = "fluid", name = "mineralized-water", amount = 40 },
		{ type = "fluid", name = "waste-water", amount = 20 },
	},
	1,
	"chemistry",
	imagePath("item/mineralized-water.png"),
	64
)

recipe(
	"ceramic-filter",
	{ { type = "item", name = "filter-frame", amount = 5 }, { type = "item", name = "stone", amount = 1 } },
	{ { type = "item", name = "ceramic-filter", amount = 5 } },
	0.5
)

recipe(
	"ceramic-filter-cleaning",
	{ { type = "item", name = "used-ceramic-filter", amount = 5 }, { type = "fluid", name = "water", amount = 1 } },
	{ { type = "item", name = "ceramic-filter", amount = 5 }, { type = "fluid", name = "waste-water", amount = 20 } },
	0.5,
	"chemistry",
	imagePath("item/ceramic-filter.png")
)

recipe(
	"waste-water-recycling",
	{ { type = "fluid", name = "waste-water", amount = 40 } },
	{ { type = "fluid", name = "water", amount = 40 }, { type = "item", name = "sulfur", amount = 4 } },
	1,
	"chemistry",
	imagePath("item/waste-water.png")
)

data.raw["recipe"]["coal-filter"].enabled = true
data.raw["recipe"]["filter-frame"].enabled = true
data.raw["recipe"]["water-filtering"].enabled = true
data.raw["recipe"]["basic-iron-smelting"].enabled = true
data.raw["recipe"]["basic-copper-smelting"].enabled = true
data.raw["recipe"]["saphirite-crystalization-nauvis"].enabled = true
data.raw["recipe"]["stiritite-crystalization-nauvis"].enabled = true

data.raw["recipe"]["small-electric-pole"].enabled = true
data.raw["recipe"]["copper-cable"].enabled = true

data.raw["technology"]["oil-processing"].effects = {
	{ type = "unlock-recipe", recipe = "solid-fuel-from-petroleum-gas" },
	{ type = "unlock-recipe", recipe = "sulfurLiquidification" },
	{ type = "unlock-recipe", recipe = "waste-water-recycling" },
}

data.raw["technology"]["oil-processing"].unit = data.raw["technology"]["oil-gathering"].unit
data.raw["technology"]["oil-processing"].prerequisites = data.raw["technology"]["oil-gathering"].prerequisites
table.insert(data.raw["technology"]["oil-processing"].prerequisites, "advanced-filtering")
data.raw["technology"]["oil-processing"].research_trigger = nil
data.raw.technology["oil-gathering"] = nil

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

data:extend({
	{
		type = "technology",
		name = "advanced-filtering",
		unit = {
			count = 50,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 10,
		},
		prerequisites = {
			"chemical-plant",
			"logistic-science-pack",
		},
		effects = {
			{ type = "unlock-recipe", recipe = "ceramic-filter" },
			{ type = "unlock-recipe", recipe = "ceramic-filtering" },
			{ type = "unlock-recipe", recipe = "ceramic-filter-cleaning" },
		},
		icon = imagePath("item/ceramic-filter.png"),
	},
})

data.raw["technology"]["electronics"].effects = {
	{
		type = "unlock-recipe",
		recipe = "electronic-circuit",
	},
	{
		type = "unlock-recipe",
		recipe = "lab",
	},
	{
		type = "unlock-recipe",
		recipe = "inserter",
	},
}

for k, v in pairs(data.raw["technology"]["steam-power"].effects) do
	if v.type == "unlock-recipe" then
		data.raw["recipe"][v.recipe].enabled = true
	end
end
data.raw["technology"]["steam-power"] = nil

data.raw["technology"]["automation-science-pack"].prerequisites = { "electronics" }

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
