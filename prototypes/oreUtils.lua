require("utils")

---@class Ore
---@field name string
---@field sortTo string[]
---@field planets Planet[]

---@param ore Ore
function generateOre(ore)
	---@type data.ItemPrototype
	local item = {
		type = "item",
		name = ore.name,
		stack_size = 50,
		icon = imagePath("item/" .. ore.name .. ".png"),
		icon_size = 64,
	}

	---@type data.RecipePrototype[]
	local crystalizationRecipes = {}
	for k, v in pairs(ore.planets) do
		---@type Ingredient[]
		local ingredients = {}
		local category = ""
		if v == "vulcanus" then
			ingredients =
				{ { type = "fluid", name = "lava", amount = 20 }, { type = "item", name = "calcite", amount = 5 } }
			category = "metallurgy"
		end
		if v == "nauvis" then
			ingredients = { { type = "fluid", name = "mineralized-water", amount = 20 } }
			category = "chemistry"
		end

		table.insert(crystalizationRecipes, {
			type = "recipe",
			name = ore.name .. "-crystalization-" .. v,
			ingredients = ingredients,
			results = { { type = "item", name = ore.name, amount = 5 } },
			category = category,
			enabled = false,
			auto_recycle = false,
		})
	end

	---@type data.RecipePrototype
	local recipe = {
		type = "recipe",
		name = ore.name .. "-sorting",
		ingredients = { { type = "item", name = ore.name, amount = 6 } },
		results = {
			{ type = "item", name = ore.sortTo[1], amount = 4 },
			{ type = "item", name = ore.sortTo[2], amount = 2 },
			{ type = "item", name = "stone", amount = 2 },
		},
		icons = sortingImage("item/" .. ore.name .. ".png"),
		enabled = false,
		auto_recycle = false,
	}
	data:extend({ item, recipe })
	data:extend(crystalizationRecipes)
end

---@param ore string
---@param ingredients string[]
---@param planet Planet
function pureSorting(ore, ingredients, planet)
	local catalist = ""
	if planet == "vulcanus" then
		catalist = "calcite"
	end

	data:extend({
		{
			type = "recipe",
			name = "pure-" .. ore .. "-sorting",
			ingredients = {
				{ type = "item", name = ingredients[1], amount = 3 },
				{ type = "item", name = ingredients[2], amount = 3 },
				{ type = "item", name = catalist, amount = 1 },
			},
			results = { { type = "item", name = ore, amount = 4 } },
			icons = sortingImage("item/" .. ore .. ".png"),
			enabled = false,
		},
	})
end
