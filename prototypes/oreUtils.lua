require("utils")

---@type table<Planet, string>
local catalists = {
	nauvis = "catalist",
	vulcanus = "calcite",
}

---@class Ore
---@field name string
---@field sortTo string[]
---@field planets Planet[]
---@field order string?

---@param ore Ore
function generateOre(ore)
	---@type data.ItemPrototype
	local item = {
		type = "item",
		name = ore.name,
		stack_size = 50,
		icon = imagePath("item/" .. ore.name .. ".png"),
		icon_size = 64,
		subgroup = "ore",
		order = ore.order,
	}

	---@type data.RecipePrototype[]
	local crystalizationRecipes = {}
	for k, planet in pairs(ore.planets) do
		---@type Ingredient[]
		local ingredients = {}
		local category = ""
		if planet == "vulcanus" then
			ingredients =
				{ { type = "fluid", name = "lava", amount = 20 }, { type = "item", name = "calcite", amount = 5 } }
			category = "metallurgy"
		end
		if planet == "nauvis" then
			ingredients = { { type = "fluid", name = "mineralized-water", amount = 20 } }
			category = "chemistry"
		end

		table.insert(crystalizationRecipes, {
			type = "recipe",
			name = ore.name .. "-crystalization-" .. planet,
			ingredients = ingredients,
			results = { { type = "item", name = ore.name, amount = 5 } },
			category = category,
			order = ore.order,
			subgroup = "crystalization-" .. planet,
			enabled = false,
			energy_required = 1,
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
		energy_required = 1,
		order = ore.order,
		subgroup = "ore-sorting",
		category = "ore-sorting",
	}
	data:extend({ item, recipe })
	data:extend(crystalizationRecipes)
end

---@param ore string
---@param ingredients string[]
---@param planets Planet[]
---@param order string?
function pureSorting(ore, ingredients, planets, order)
	for k, planet in pairs(planets) do
		local catalist = catalists[planet]

		data:extend({
			{
				type = "recipe",
				name = "pure-" .. ore .. "-sorting-" .. planet,
				ingredients = {
					{ type = "item", name = ingredients[1], amount = 3 },
					{ type = "item", name = ingredients[2], amount = 3 },
					{ type = "item", name = catalist, amount = 1 },
				},
				results = { { type = "item", name = ore, amount = 4 } },
				icons = sortingImage("item/" .. ore .. ".png"),
				subgroup = "pure-sorting-" .. planet,
				order = order,
				energy_required = 1,
				enabled = false,
				category = "ore-sorting",
			},
		})
	end
end
