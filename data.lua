require("prototypes.ores")
require("prototypes.vulcanus")
require("prototypes.nauvis")

recipe(
	"woodGrowing",
	{ { type = "fluid", name = "water", amount = 50 } },
	{ { type = "item", name = "wood", amount = 5 } },
	1,
	"crafting-with-fluid"
)
recipe(
	"charcoal",
	{ { type = "item", name = "wood", amount = 1 } },
	{ { type = "item", name = "coal", amount = 1 } },
	1,
	"smelting"
)
recipe("sulfurLiquidification", { { type = "item", name = "sulfur", amount = 2 } }, {
	{ type = "fluid", name = "water", amount = 30, amount_min = 60 },
	{ type = "fluid", name = "petroleum-gas", amount = 30, amount_min = 60 },
}, 1, "chemistry", imagePath("item/sulfur.png"), 64)

data.raw["recipe"]["woodGrowing"].enabled = true
data.raw["recipe"]["charcoal"].enabled = true
