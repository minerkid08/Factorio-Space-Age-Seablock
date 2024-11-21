---@alias Planet
---| "nauvis"
---| "vulcanus"
---| "fulgora"
---| "gleba"
---| "aquilo"

---@class LuaIngredient data.ItemIngredientPrototype | data.FluidIngredientPrototype

---@param name string?
---@return string?
function imagePath(name)
	if name == nil then
		return nil
	end
	return "__SpaceAgeSeablock__/graphics/" .. name
end

---@param name string
---@return data.IconData[]
function sortingImage(name)
	return {
		{
			icon = imagePath("sort.png"),
			icon_size = 64,
		},
		{
			icon = imagePath(name),
			icon_size = 64,
		},
	}
end

---@class Recipe
---@field name string
---@field ingredients LuaIngredient[]
---@field results LuaIngredient[]
---@field craftTime uint
---@field icon string?
---@field icon2 string?
---@field iconSize uint?
---@field icons data.IconData[]?
---@field subgroup string?
---@field category string?
---@field order string?
---@field enabled boolean?

---@param recipe Recipe
function recipe(recipe)
	data:extend({
		{
			type = "recipe",
			name = recipe.name,
			ingredients = recipe.ingredients,
			results = recipe.results,
			energy_required = recipe.craftTime,
			category = recipe.category,
			icon = imagePath(recipe.icon) or recipe.icon2,
			icon_size = recipe.iconSize,
			icons = recipe.icons,
      enabled = recipe.enabled or false,
      subgroup = recipe.subgroup,
      order = recipe.order,
			auto_recycle = false,
		},
	})
end

---@param name string
---@param ingredients LuaIngredient[]
---@param results LuaIngredient[]
---@param craftTime uint
---@param category string?
---@param icons data.IconData[]
function recipeIcon(name, ingredients, results, craftTime, category, icons)
	data:extend({
		{
			type = "recipe",
			name = name,
			ingredients = ingredients,
			results = results,
			energy_required = craftTime,
			category = category,
			icons = icons,
			auto_recycle = false,
		},
	})
end

---@param name string
---@param stackSize uint
---@param icon string?
---@param iconSize uint?
---@param subgroup string?
function item(name, stackSize, icon, iconSize, subgroup)
	data:extend({
		{
			type = "item",
			name = name,
			stack_size = stackSize,
			icon = imagePath(icon or "error.png"),
			icon_size = iconSize or 48,
      subgroup = subgroup
		},
	})
end
