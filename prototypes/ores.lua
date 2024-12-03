require("oreUtils")

itemSubgroup("crystalization-nauvis", "intermediate-products", "fb")
itemSubgroup("crystalization-vulcanus", "intermediate-products", "fc")
itemSubgroup("ore-sorting", "intermediate-products", "fd")
itemSubgroup("pure-sorting-nauvis", "intermediate-products", "fe")
itemSubgroup("pure-sorting-vulcanus", "intermediate-products", "ff")
itemSubgroup("ore", "intermediate-products", "fg")

data:extend({
	{
		type = "item-subgroup",
		name = "circuits",
		group = "intermediate-products",
		order = "fh",
	},
})

generateOre({
	name = "saphirite",
	sortTo = { "iron-ore", "copper-ore" },
	planets = { "nauvis", "vulcanus" },
	order = "a",
})
generateOre({
	name = "stiritite",
	sortTo = { "copper-ore", "iron-ore" },
	planets = { "nauvis", "vulcanus" },
	order = "b",
})
generateOre({
	name = "bobmonium",
	sortTo = { "iron-ore", "tin-ore" },
	planets = { "nauvis", "vulcanus" },
	order = "c",
})
generateOre({
	name = "rubyte",
	sortTo = { "copper-ore", "silicon-ore" },
	planets = { "nauvis", "vulcanus" },
	order = "d",
})
generateOre({ name = "ore-1", sortTo = { "iron-ore", "tungsten-ore" }, planets = { "vulcanus" }, order = "e" })
generateOre({ name = "ore-2", sortTo = { "copper-ore", "sulfur" }, planets = { "vulcanus" }, order = "f" })

pureSorting("iron-ore", { "saphirite", "bobmonium" }, { "nauvis", "vulcanus" }, "a")
pureSorting("copper-ore", { "stiritite", "rubyte" }, { "nauvis", "vulcanus" }, "b")
pureSorting("silicon-ore", { "bobmonium", "rubyte" }, { "nauvis", "vulcanus" }, "c")
pureSorting("tin-ore", { "stiritite", "bobmonium" }, { "nauvis", "vulcanus" }, "d")

pureSorting("tungsten-ore", { "ore-1", "stiritite" }, { "vulcanus" }, "e")
pureSorting("sulfur", { "ore-2", "bobmonium" }, { "vulcanus" }, "f")

data.raw["item"]["iron-ore"].subgroup = "iron"
data.raw["item"]["iron-ore"].order = "a"
data.raw["item"]["iron-plate"].subgroup = "iron"
data.raw["item"]["iron-plate"].order = "b"
data.raw["item"]["steel-plate"].subgroup = "iron"
data.raw["item"]["steel-plate"].order = "c"
data.raw["item"]["iron-stick"].subgroup = "iron"
data.raw["item"]["iron-stick"].order = "d"

data.raw["item"]["copper-ore"].subgroup = "copper"
data.raw["item"]["copper-ore"].order = "a"
data.raw["item"]["copper-plate"].subgroup = "copper"
data.raw["item"]["copper-plate"].order = "b"
data.raw["item"]["copper-cable"].subgroup = "copper"
data.raw["item"]["copper-cable"].order = "c"

-- tin

item("tin-ore", 100, "item/tin-ore.png", 64, "tin", "a")
item("tin-plate", 100, "item/tin-plate.png", 64, "tin", "b")
item("tin-cable", 200, "item/tin-cable.png", 64, "tin", "c")

recipe({
	name = "tin-plate",
	ingredients = { { type = "item", name = "tin-ore", amount = 1 } },
	results = { { type = "item", name = "tin-plate", amount = 1 } },
	craftTime = 3.2,
	category = "smelting",
	subgroup = "tin",
	order = "d",
})

recipe({
	name = "tin-cable",
	ingredients = {
		{ type = "item", name = "tin-plate", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 5 },
	},
	results = { { type = "item", name = "tin-cable", amount = 5 } },
	craftTime = 3.2,
	subgroup = "tin",
	order = "e",
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

item("silicon-ore", 100, "item/silicon-ore.png", 64, "silicon", "a")
item("mono-silicon", 100, "item/mono-silicon.png", 64, "silicon", "b")
item("silicon-wafer", 100, "item/silicon-wafer.png", 64, "silicon", "c")

data:extend({
	{
		type = "item-subgroup",
		name = "iron",
		group = "intermediate-products",
		order = "ca",
	},
	{
		type = "item-subgroup",
		name = "copper",
		group = "intermediate-products",
		order = "cb",
	},
	{
		type = "item-subgroup",
		name = "tin",
		group = "intermediate-products",
		order = "cc",
	},
	{
		type = "item-subgroup",
		name = "silicon",
		group = "intermediate-products",
		order = "cd",
	},
})

recipe({
	name = "mono-silicon",
	ingredients = { { type = "item", name = "silicon-ore", amount = 2 } },
	results = { { type = "item", name = "mono-silicon", amount = 1 } },
	craftTime = 3.2,
	category = "smelting",
	subgroup = "silicon",
	order = "b",
})

recipe({
	name = "silicon-wafer",
	ingredients = { { type = "item", name = "mono-silicon", amount = 1 } },
	results = { { type = "item", name = "silicon-wafer", amount = 5 } },
	craftTime = 0.5,
	subgroup = "silicon",
	order = "c",
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
