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

---@param name string
---@param ingredients LuaIngredient[]
---@param results LuaIngredient[]
---@param craftTime uint
---@param category string?
---@param icon string?
---@param iconSize uint?
function recipe(name, ingredients, results, craftTime, category, icon, iconSize)
	data:extend({
		{
			type = "recipe",
			name = name,
			ingredients = ingredients,
			results = results,
			energy_required = craftTime,
			category = category,
			icon = icon,
			icon_size = iconSize,
      enabled = false,
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
function item(name, stackSize, icon, iconSize)
	data:extend({
		{
			type = "item",
			name = name,
			stack_size = stackSize,
			icon = imagePath(icon or "error.png"),
			icon_size = iconSize or 48,
		},
	})
end
