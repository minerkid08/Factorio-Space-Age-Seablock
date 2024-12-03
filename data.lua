require("prototypes.ores")
require("prototypes.vulcanus")
require("prototypes.nauvis")
require("prototypes.metallurgy")

item("green-algae", 200, "item/green-algae.png", 64)
item("cellulose", 200, "item/cellulose.png", 64)

recipe({
	name = "green-algae",
	ingredients = { { type = "fluid", name = "water", amount = 20 } },
	results = { { type = "item", name = "green-algae", amount = 10 } },
	craftTime = 20,
	category = "algae-growing",
	subgroup = "algae",
})

recipe({
	name = "cellulose",
	ingredients = { { type = "item", name = "green-algae", amount = 5 } },
	results = { { type = "item", name = "cellulose", amount = 2 } },
	craftTime = 1,
	subgroup = "algae",
})

recipe({
	name = "charcoal",
	ingredients = { { type = "item", name = "cellulose", amount = 5 } },
	results = { { type = "item", name = "coal", amount = 4 } },
	craftTime = 1,
	category = "smelting",
	subgroup = "intermediate-product",
})

data:extend({
	{
		type = "technology",
		name = "algae-processing",
		icon = imagePath("item/green-algae.png"),
		icon_size = 64,
		prerequisites = { "automation-science-pack" },
		unit = {
			count = 25,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 10,
		},
		effects = {
			{ type = "unlock-recipe", recipe = "algae-farm" },
			{ type = "unlock-recipe", recipe = "green-algae" },
			{ type = "unlock-recipe", recipe = "cellulose" },
			{ type = "unlock-recipe", recipe = "charcoal" },
		},
	},
})

recipe({
	name = "sulfurLiquidification",
	ingredients = { { type = "item", name = "sulfur", amount = 2 } },
	results = {
		{ type = "fluid", name = "water", amount = 30, amount_min = 60 },
		{ type = "fluid", name = "petroleum-gas", amount = 30, amount_min = 60 },
	},
	craftTime = 1,
	category = "chemistry",
	icon = "item/sulfur.png",
	iconSize = 64,
	subgroup = "intermediate-product",
})

table.insert(data.raw["technology"]["electronics"].effects, { type = "unlock-recipe", recipe = "stone-board" })

data.raw.recipe["electronic-circuit"] = {
	type = "recipe",
	name = "electronic-circuit",
	ingredients = {
		{ type = "item", name = "stone-board", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 3 },
	},
	results = {
		{ type = "item", name = "electronic-circuit", amount = 1 },
	},
	category = "crafting",
	energy_required = 0.5,
	subgroup = "intermediate-product",
	enabled = false,
}


item("stone-board", 50, "item/stone-board.png", 64, "circuits")

data:extend({
	{
		type = "recipe",
		name = "stone-board",
		enabled = false,
		ingredients = {
			{ type = "item", name = "stone-brick", amount = 1 },
		},
		results = {
			{ type = "item", name = "stone-board", amount = 4 },
		},
		category = "crafting",
		energy_required = 0.5,
		subgroup = "circuits",
		order = "a",
	},
})

item("plastic-board", 200, "item/plastic-board.png", 64, "circuits")
item("advanced-circuit-board", 200, "item/advanced-circuit-board.png", 64, "circuits")
item("transistor", 200, "item/transistor.png", 64, "circuits")

recipe({
	name = "plastic-board",
	ingredients = { { type = "item", name = "plastic-bar", amount = 1 } },
	results = { { type = "item", name = "plastic-board", amount = 1 } },
	craftTime = 1,
	subgroup = "circuits",
	order = "b",
})

recipe({
	name = "advanced-circuit-board",
	ingredients = {
		{ type = "item", name = "plastic-board", amount = 1 },
		{ type = "item", name = "tin-cable", amount = 2 },
	},
	results = {
		{ type = "item", name = "advanced-circuit-board", amount = 1 },
	},
	craftTime = 1,
	subgroup = "circuits",
	order = "c",
})

recipe({
	name = "transistor",
	ingredients = {
		{ type = "item", name = "silicon-wafer", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 1 },
		{ type = "item", name = "copper-plate", amount = 1 },
	},
	results = {
		{ type = "item", name = "transistor", amount = 5 },
	},
	craftTime = 0.5,
	subgroup = "circuits",
	order = "e",
})

data.raw["recipe"]["advanced-circuit"] = nil

recipe({
	name = "advanced-circuit",
	ingredients = {
		{ type = "item", name = "advanced-circuit-board", amount = 1 },
		{ type = "item", name = "transistor", amount = 3 },
		{ type = "item", name = "tin-cable", amount = 2 },
	},
	results = {
		{ type = "item", name = "advanced-circuit", amount = 1 },
	},
	craftTime = 5,
	subgroup = "circuits",
})

item("processing-unit-board", 200, "item/processing-unit-board.png", 64, "circuits")
item("integrated-circuit", 200, "item/integrated-circuit.png", 64, "intermediate-product")

recipe({
	name = "processing-unit",
	ingredients = {
		{ type = "item", name = "processing-unit-board", amount = 1 },
		{ type = "item", name = "integrated-circuit", amount = 3 },
		{ type = "item", name = "transistor", amount = 3 },
		{ type = "item", name = "copper-cable", amount = 2 },
	},
	results = {
		{ type = "item", name = "processing-unit", amount = 1 },
	},
	category = "crafting",
	craftTime = 5,
	subgroup = "intermediate-product",
})
recipe({
	name = "processing-unit-board",
	ingredients = {
		{ type = "item", name = "plastic-board", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 5 },
	},
	results = {
		{ type = "item", name = "processing-unit-board", amount = 1 },
	},
	craftTime = 1,
	subgroup = "circuits",
	order = "d",
})
recipe({
	name = "integrated-circuit",
	ingredients = {
		{ type = "item", name = "plastic-bar", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 1 },
		{ type = "fluid", name = "sulfuric-acid", amount = 5 },
	},
	results = {
		{ type = "item", name = "integrated-circuit", amount = 5 },
	},
	category = "crafting-with-fluid",
	craftTime = 1,
	subgroup = "circuits",
	order = "f",
})

data.raw["recipe"]["electronic-circuit"].subgroup = "circuits"
data.raw["recipe"]["advanced-circuit"].subgroup = "circuits"
data.raw["recipe"]["processing-unit"].subgroup = "circuits"

data.raw["item"]["electronic-circuit"].subgroup = "circuits"
data.raw["item"]["advanced-circuit"].subgroup = "circuits"
data.raw["item"]["processing-unit"].subgroup = "circuits"

data.raw["item"]["electronic-circuit"].order = "g"
data.raw["item"]["advanced-circuit"].order = "h"
data.raw["item"]["processing-unit"].order = "i"

data.raw["technology"]["advanced-circuit"].effects = {
	{ type = "unlock-recipe", recipe = "advanced-circuit" },
	{ type = "unlock-recipe", recipe = "transistor" },
	{ type = "unlock-recipe", recipe = "advanced-circuit-board" },
	{ type = "unlock-recipe", recipe = "plastic-board" },
}

data.raw["technology"]["advanced-circuit"].prerequisites = { "silicon-processing", "plastics", "tin-processing" }

data.raw["technology"]["processing-unit"].effects = {
	{ type = "unlock-recipe", recipe = "processing-unit" },
	{ type = "unlock-recipe", recipe = "integrated-circuit" },
	{ type = "unlock-recipe", recipe = "processing-unit-board" },
}

data.raw["technology"]["landfill"].prerequisites = { "automation-science-pack" }
data.raw["technology"]["landfill"].unit.ingredients = { { "automation-science-pack", 1 } }
data.raw["technology"]["landfill"].unit.count = 10

data.raw["recipe"]["landfill"].ingredients[1].amount = 5
