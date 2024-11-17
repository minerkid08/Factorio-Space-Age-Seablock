require("oreUtils")

generateOre({
	name = "saphirite",
	sortTo = { "iron-ore", "copper-ore" },
	planets = { "vulcanus", "nauvis" },
	order = "a",
})
generateOre({
	name = "stiritite",
	sortTo = { "copper-ore", "iron-ore" },
	planets = { "vulcanus", "nauvis" },
	order = "b",
})
generateOre({
	name = "bobmonium",
	sortTo = { "iron-ore", "copper-ore" },
	planets = { "vulcanus", "nauvis" },
	order = "c",
})
generateOre({ name = "rubyte", sortTo = { "copper-ore", "iron-ore" }, planets = { "vulcanus", "nauvis" }, order = "d" })
generateOre({ name = "ore-1", sortTo = { "iron-ore", "tungsten-ore" }, planets = { "vulcanus" }, order = "e" })
generateOre({ name = "ore-2", sortTo = { "copper-ore", "sulfur" }, planets = { "vulcanus" }, order = "f" })

pureSorting("iron-ore", { "saphirite", "bobmonium" }, { "vulcanus", "nauvis" }, "a")
pureSorting("copper-ore", { "stiritite", "rubyte" }, { "vulcanus", "nauvis" }, "b")

pureSorting("tungsten-ore", { "ore-1", "stiritite" }, { "vulcanus" }, "c")
pureSorting("sulfur", { "ore-2", "bobmonium" }, { "vulcanus" }, "d")
