require("oreUtils")

generateOre({ name = "saphirite", sortTo = { "iron-ore", "copper-ore" }, planets = { "vulcanus", "nauvis" } })
generateOre({ name = "stiritite", sortTo = { "copper-ore", "iron-ore" }, planets = { "vulcanus" , "nauvis"} })
generateOre({ name = "bobmonium", sortTo = { "iron-ore", "tungsten-ore" }, planets = { "vulcanus" } })
generateOre({ name = "rubyte", sortTo = { "copper-ore", "sulfur" }, planets = { "vulcanus" } })

pureSorting("iron-ore", { "saphirite", "bobmonium" }, "vulcanus")
pureSorting("copper-ore", { "stiritite", "rubyte" }, "vulcanus")
pureSorting("tungsten-ore", { "bobmonium", "stiritite" }, "vulcanus")
pureSorting("sulfur", { "rubyte", "bobmonium" }, "vulcanus")
