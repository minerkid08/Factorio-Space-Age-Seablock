require("utils")

recipe(
	"lavaSolidification",
	{ { type = "fluid", name = "lava", amount = 20 } },
	{ { type = "item", name = "stone", amount = 5 } },
	1,
	"metallurgy"
)
recipe("calciteCrystalization", {
	{ type = "fluid", name = "lava", amount = 20 },
	{ type = "item", name = "stone", amount = 5 },
}, { { type = "item", name = "calcite", amount = 5 } }, 1, "metallurgy")

data.raw["technology"]["planet-discovery-vulcanus"].effects[2] =
	{ type = "unlock-recipe", recipe = "basicFoundryRecipe" }
data.raw["technology"]["planet-discovery-vulcanus"].effects[3] =
	{ type = "unlock-recipe", recipe = "lavaFoundationRecipe" }

data.raw["technology"]["foundry"].effects = {
	{ type = "unlock-recipe", recipe = "foundry" },
}

data.raw["technology"]["calcite-processing"].research_trigger = { type = "craft-item", item = "calcite", amount = 20 }
local tech = table.deepcopy(data.raw["technology"]["tungsten-carbide"])

tech.icon = imagePath("item/saphirite.png")
tech.icon_size = 64

tech.research_trigger = { type = "craft-item", item = "calcite", amount = 20 }
tech.name = "oreProcessing"

tech.effects = {
	{ type = "unlock-recipe", recipe = "saphirite-crystalization-vulcanus" },
	{ type = "unlock-recipe", recipe = "stiritite-crystalization-vulcanus" },
	{ type = "unlock-recipe", recipe = "bobmonium-crystalization-vulcanus" },
	{ type = "unlock-recipe", recipe = "rubyte-crystalization-vulcanus" },
	{ type = "unlock-recipe", recipe = "saphirite-sorting" },
	{ type = "unlock-recipe", recipe = "stiritite-sorting" },
	{ type = "unlock-recipe", recipe = "bobmonium-sorting" },
	{ type = "unlock-recipe", recipe = "rubyte-sorting" },
	{ type = "unlock-recipe", recipe = "molten-iron" },
	{ type = "unlock-recipe", recipe = "molten-copper" },
	{ type = "unlock-recipe", recipe = "casting-iron" },
	{ type = "unlock-recipe", recipe = "casting-steel" },
	{ type = "unlock-recipe", recipe = "casting-copper" },
}

data:extend({ tech })

local advancedCasting = table.deepcopy(data.raw["technology"]["coal-liquefaction"])
advancedCasting.name = "advancedCasting"
advancedCasting.effects = {
	{ type = "unlock-recipe", recipe = "concrete-from-molten-iron" },
	{ type = "unlock-recipe", recipe = "casting-low-density-structure" },
	{ type = "unlock-recipe", recipe = "casting-iron-gear-wheel" },
	{ type = "unlock-recipe", recipe = "casting-iron-stick" },
	{ type = "unlock-recipe", recipe = "casting-pipe" },
	{ type = "unlock-recipe", recipe = "casting-pipe-to-ground" },
	{ type = "unlock-recipe", recipe = "casting-copper-cable" },
}

advancedCasting.icon = "__space-age__/graphics/icons/casting-iron-gear-wheel.png"
advancedCasting.icon_size = 64
advancedCasting.unit.count = 1000

data:extend({ advancedCasting })

local advancedSorting = table.deepcopy(data.raw["technology"]["coal-liquefaction"])
advancedSorting.name = "advancedSorting"
advancedSorting.effects = {
	{ type = "unlock-recipe", recipe = "pure-iron-ore-sorting" },
	{ type = "unlock-recipe", recipe = "pure-copper-ore-sorting" },
	{ type = "unlock-recipe", recipe = "pure-tungsten-ore-sorting" },
	{ type = "unlock-recipe", recipe = "pure-sulfur-sorting" },
}

advancedSorting.icons = sortingImage("item/tungsten-ore.png")

advancedSorting.unit.count = 1000

data:extend({ advancedSorting })
data.raw["technology"]["tungsten-carbide"].prerequisites = { "oreProcessing" }
data.raw["technology"]["tungsten-carbide"].research_trigger =
	{ type = "craft-item", item = "tungsten-ore", amount = 20 }

local foundryItem = table.deepcopy(data.raw["item"]["foundry"])

foundryItem.name = "basicFoundry"
foundryItem.place_result = "basicFoundry"

local foundryRecipe = table.deepcopy(data.raw["recipe"]["foundry"])

foundryRecipe.enabled = false
foundryRecipe.name = "basicFoundryRecipe"
foundryRecipe.results[1].name = "basicFoundry"

foundryRecipe.ingredients = {
	{ type = "item", name = "steel-plate", amount = 25 },
	{ type = "item", name = "electronic-circuit", amount = 20 },
	{ type = "item", name = "concrete", amount = 20 },
}

local foundry = table.deepcopy(data.raw["assembling-machine"]["foundry"])

foundry.name = "basicFoundry"
foundry.crafting_speed = 1
foundry.effect_receiver.base_effect.productivity = 0
foundry.crafting_categories = { "metallurgy" }
foundry.minable.result = "basicFoundry"

data:extend({ foundryItem, foundry, foundryRecipe })

local foundation = table.deepcopy(data.raw["item"]["foundation"])

foundation.place_as_tile.tile_condition = { "volcanic-cracks-hot", "lava", "lava-hot" }
foundation.place_as_tile.result = "lavaFoundationTile"
foundation.name = "lavaFoundation"

local foundationRecipe = table.deepcopy(data.raw["recipe"]["foundation"])

foundationRecipe.name = "lavaFoundationRecipe"
foundationRecipe.results = { { type = "item", name = "lavaFoundation", amount = 1 } }

foundationRecipe.ingredients = { { type = "item", name = "steel-plate", amount = 20 } }

local foundationTile = table.deepcopy(data.raw["tile"]["foundation"])

foundationTile.name = "lavaFoundationTile"
foundationTile.minable.result = "lavaFoundation"

data:extend({ foundation, foundationTile, foundationRecipe })
