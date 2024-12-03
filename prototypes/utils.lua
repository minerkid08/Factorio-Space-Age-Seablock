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
    return nil;
  end;
  return "__SpaceAgeSeablock__/graphics/" .. name;
end;

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
  };
end;

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
  });
end;

---@param name string
---@param stackSize uint
---@param icon string?
---@param iconSize uint?
---@param subgroup string?
---@param order string?
function item(name, stackSize, icon, iconSize, subgroup, order)
  data:extend({
    {
      type = "item",
      name = name,
      stack_size = stackSize,
      icon = imagePath(icon or "error.png"),
      icon_size = iconSize or 48,
      subgroup = subgroup,
      order = order,
    },
  });
end;

---@param name string
---@param color Color
---@param icon string
---@param iconSize number
function fluid(name, color, icon, iconSize)
  data:extend({
    {
      type = "fluid",
      name = name,
      base_color = color,
      flow_color = color,
      icon = imagePath(icon),
      icon_size = iconSize,
      default_temperature = 15
    }
  });
end;

---@class AssemblingMachine
---@field name string
---@field icon string
---@field iconSize uint
---@field categories string[]
---@field speed uint
---@field box number[2][2]
---@field mineResult string?
---@field fluidBoxes data.FluidBox[]?
---@field fluidBoxesWithNoFluidRecipe boolean?
---@field energySource data.EnergySource?
---@field energyUsage string?

---@param machine AssemblingMachine
function assemblingMachine(machine)
  data:extend({
    {
      type = "assembling-machine",
      name = machine.name,
      graphics_set = {
        animation = {
          filename = imagePath(machine.icon),
          width = machine.iconSize,
          height = machine.iconSize,
        },
      },
      crafting_categories = machine.categories,
      crafting_speed = machine.speed,
      selection_box = {
        left_top = { machine.box[1][1], machine.box[1][2] },
        right_bottom = { machine.box[2][1], machine.box[2][2] },
      },
      collision_box = {
        left_top = { machine.box[1][1] + 0.2, machine.box[1][2] + 0.2 },
        right_bottom = { machine.box[2][1] - 0.2, machine.box[2][2] - 0.2 },
      },
      fluid_boxes = machine.fluidBoxes,
      fluid_boxes_off_when_no_fluid_recipe = machine.fluidBoxesWithNoFluidRecipe,
      minable = {
        mining_time = 1,
        result = machine.mineResult,
      },
      energy_source = machine.energySource or { type = "electric", usage_priority = "secondary-input" },
      energy_usage = "100kW",
      flags = { "placeable-player", "placeable-neutral", "player-creation" },
      icon = imagePath("error.png"),
      icon_size = 48,
    },
  });
end;

---@param name string
---@param group string
---@param order string?
function itemSubgroup(name, group, order)
  data:extend({ {
    type = "item-subgroup",
    name = name,
    group = group,
    order = order,
  } });
end;

---@class Technology
---@field name string
---@field icon string?
---@field icon2 string?
---@field iconSize uint?
---@field icons data.IconData[]?
---@field unit data.TechnologyUnit
---@field effects data.Modifier[]
---@field prerequisites string[]?

---@param tech Technology
function technology(tech)
  data:extend({
    {
      type = "technology",
      name = tech.name,
      icon = imagePath(tech.icon) or tech.icon2,
      icon_size = tech.iconSize,
      icons = tech.icons,
      unit = tech.unit,
      effects = tech.effects,
      prerequisites = tech.prerequisites
    }
  });
end;
