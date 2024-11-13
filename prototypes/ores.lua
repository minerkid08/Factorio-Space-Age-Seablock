require("oreUtils")

generateOre({ name = "saphirite", sortTo = { "iron-ore", "copper-ore" }, planets = { "vulcanus", "nauvis" } })
generateOre({ name = "stiritite", sortTo = { "copper-ore", "iron-ore" }, planets = { "vulcanus", "nauvis" } })
generateOre({ name = "bobmonium", sortTo = { "iron-ore", "copper-ore" }, planets = { "vulcanus", "nauvis" } })
generateOre({ name = "rubyte", sortTo = { "copper-ore", "iron-ore" }, planets = { "vulcanus", "nauvis" } })
generateOre({ name = "ore-1", sortTo = { "iron-ore", "tungsten-ore" }, planets = { "vulcanus" } })
generateOre({ name = "ore-2", sortTo = { "copper-ore", "sulfur" }, planets = { "vulcanus" } })

pureSorting("iron-ore", { "saphirite", "bobmonium" }, { "vulcanus", "nauvis" })
pureSorting("copper-ore", { "stiritite", "rubyte" }, { "vulcanus", "nauvis" })

pureSorting("tungsten-ore", { "ore-1", "stiritite" }, { "vulcanus" })
pureSorting("sulfur", { "ore-2", "bobmonium" }, { "vulcanus" })
