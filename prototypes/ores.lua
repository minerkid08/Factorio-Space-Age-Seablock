require("oreUtils")

generateOre({
	name = "saphirite",
	sortTo = { "iron-ore", "copper-ore" },
	planets = { "nauvis" },
	order = "a",
})
generateOre({
	name = "stiritite",
	sortTo = { "copper-ore", "iron-ore" },
	planets = { "nauvis" },
	order = "b",
})
generateOre({
	name = "bobmonium",
	sortTo = { "iron-ore", "tin-ore" },
	planets = { "nauvis" },
	order = "c",
})
generateOre({ name = "rubyte", sortTo = { "copper-ore", "silicon-ore" }, planets = { "nauvis" }, order = "d" })
--generateOre({ name = "ore-1", sortTo = { "iron-ore", "tungsten-ore" }, planets = { "vulcanus" }, order = "e" })
--generateOre({ name = "ore-2", sortTo = { "copper-ore", "sulfur" }, planets = { "vulcanus" }, order = "f" })

pureSorting("iron-ore", { "saphirite", "bobmonium" }, { "nauvis" }, "a")
pureSorting("copper-ore", { "stiritite", "rubyte" }, { "nauvis" }, "b")

--pureSorting("tungsten-ore", { "ore-1", "stiritite" }, { "vulcanus" }, "c")
--pureSorting("sulfur", { "ore-2", "bobmonium" }, { "vulcanus" }, "d")

-- tin

item("tin-ore", 100, "item/tin-ore.png", 64)
item("tin-plate", 100, "item/tin-plate.png", 64)
item("tin-cable", 200, "item/tin-cable.png", 64)

recipe({
	name = "tin-plate",
	ingredients = { { type = "item", name = "tin-ore", amount = 1 } },
	results = { { type = "item", name = "tin-plate", amount = 1 } },
	craftTime = 3.2,
	category = "smelting",
})

recipe({
	name = "tin-cable",
	ingredients = { { type = "item", name = "tin-plate", amount = 1 }, {type = "item", name = "copper-cable", amount = 5} },
	results = { { type = "item", name = "tin-cable", amount = 5 } },
	craftTime = 3.2,
})

data:extend({
	{
		type = "technology",
		name = "tin-processing",
		icon = imagePath("item/tin-ore.png"),
		unit = {
			count = 100,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 30,
		},
		prerequisites = { "ore-sorting" },
		effects = {
			{ type = "unlock-recipe", recipe = "tin-plate" },
			{ type = "unlock-recipe", recipe = "tin-cable" },
		},
	},
})

-- silicon

item("silicon-ore", 100, "item/silicon-ore.png", 64)
item("mono-silicon", 100, "item/mono-silicon.png", 64)
item("silicon-wafer", 100, "item/silicon-wafer.png", 64)

recipe({
	name = "mono-silicon",
	ingredients = { { type = "item", name = "silicon-ore", amount = 2 } },
	results = { { type = "item", name = "mono-silicon", amount = 1 } },
	craftTime = 3.2,
	category = "smelting",
})

recipe({
	name = "silicon-wafer",
	ingredients = { { type = "item", name = "mono-silicon", amount = 1 } },
	results = { { type = "item", name = "silicon-wafer", amount = 5 } },
	craftTime = 0.5,
})

data:extend({
	{
		type = "technology",
		name = "silicon-processing",
		icon = imagePath("item/silicon-ore.png"),
		unit = {
			count = 100,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 30,
		},
		prerequisites = { "ore-sorting" },
		effects = {
			{ type = "unlock-recipe", recipe = "mono-silicon" },
			{ type = "unlock-recipe", recipe = "silicon-wafer" },
		},
	},
})
