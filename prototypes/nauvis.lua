require("utils");

local mineralizedWater = table.deepcopy(data.raw["fluid"]["water"]);

mineralizedWater.name = "mineralized-water";
mineralizedWater.icon = imagePath("item/mineralized-water.png");
data:extend({ mineralizedWater });

local wasteWater = table.deepcopy(data.raw["fluid"]["water"]);

wasteWater.name = "waste-water";
wasteWater.icon = imagePath("item/waste-water.png");
data:extend({ wasteWater });

item("filter-frame", 50, "item/filter-frame.png", 64);
item("coal-filter", 50, "item/coal-filter.png", 64);
item("ceramic-filter", 50, "item/ceramic-filter.png", 64);
item("used-ceramic-filter", 50, "item/used-ceramic-filter.png", 64);

item("catalist", 50, "item/catalist.png", 64);

recipe({
  name = "catalist",
  ingredients = { { type = "fluid", name = "mineralized-water", amount = 20 } },
  results = { { type = "item", name = "catalist", amount = 1 } },
  craftTime = 1,
  category = "crafting-with-fluid",
  subgroup = "intermediate-product",
});

recipe({
  name = "coal-filter",
  ingredients = { { type = "item", name = "filter-frame", amount = 5 }, { type = "item", name = "coal", amount = 1 } },
  results = { { type = "item", name = "coal-filter", amount = 5 } },
  craftTime = 0.5,
  subgroup = "intermediate-product",
});

recipe({
  name = "filter-frame",
  ingredients = { { type = "item", name = "iron-plate", amount = 5 } },
  results = { { type = "item", name = "filter-frame", amount = 5 } },
  craftTime = 0.5,
  subgroup = "intermediate-product",
});

recipe({
  name = "water-filtering",
  ingredients = {
    { type = "item",  name = "coal-filter", amount = 1 },
    { type = "fluid", name = "water",       amount = 50 },
  },
  results = {
    { type = "item",  name = "filter-frame",      amount = 1 },
    { type = "fluid", name = "mineralized-water", amount = 30 },
  },
  craftTime = 1,
  category = "filtering",
  icon = "item/mineralized-water.png",
  iconSize = 64,
  subgroup = "intermediate-product",
});

recipe({
  name = "wood-forging",
  ingredients = {},
  results = { { type = "item", name = "wood", amount = 1 } },
  craftTime = 1,
  enabled = true,
});

recipe({
  name = "basic-filtering",
  ingredients = {
    { type = "fluid", name = "water", amount = 50 },
  },
  results = {
    { type = "fluid", name = "mineralized-water", amount = 10 },
  },
  craftTime = 1,
  category = "filtering",
  icon = "item/mineralized-water.png",
  iconSize = 64,
  enabled = true,
  subgroup = "intermediate-product",
});

recipe({
  name = "stone-crystalization",
  ingredients = { { type = "fluid", name = "mineralized-water", amount = 20 } },
  results = { { type = "item", name = "stone", amount = 4 } },
  craftTime = 1,
  category = "chemistry",
  enabled = true,
  subgroup = "crystalization-nauvis",
  order = "e",
});

recipe({
  name = "basic-iron-smelting",
  ingredients = { { type = "item", name = "saphirite", amount = 4 } },
  results = { { type = "item", name = "iron-plate", amount = 3 } },
  craftTime = 3.2,
  category = "smelting",
  enabled = true,
  subgroup = "intermediate-product",
});

recipe({
  name = "basic-copper-smelting",
  ingredients = { { type = "item", name = "stiritite", amount = 4 } },
  results = { { type = "item", name = "copper-plate", amount = 3 } },
  craftTime = 3.2,
  category = "smelting",
  enabled = true,
  subgroup = "intermediate-product",
});

recipe({
  name = "ceramic-filtering",
  ingredients = {
    { type = "item",  name = "ceramic-filter", amount = 1 },
    { type = "fluid", name = "water",          amount = 50 },
  },
  results = {
    { type = "item",  name = "used-ceramic-filter", amount = 1 },
    { type = "fluid", name = "mineralized-water",   amount = 40 },
    { type = "fluid", name = "waste-water",         amount = 20 },
  },
  craftTime = 1,
  category = "filtering",
  icon = "item/mineralized-water.png",
  icon_size = 64,
  subgroup = "intermediate-product",
});

recipe({
  name = "ceramic-filter",
  ingredients = {
    { type = "item", name = "filter-frame", amount = 5 },
    { type = "item", name = "stone",        amount = 1 },
  },
  results = { { type = "item", name = "ceramic-filter", amount = 5 } },
  craftTime = 0.5,
  subgroup = "intermediate-product",
});

recipe({
  name = "ceramic-filter-cleaning",
  ingredients = {
    { type = "item",  name = "used-ceramic-filter", amount = 5 },
    { type = "fluid", name = "water",               amount = 1 },
  },
  results = {
    { type = "item",  name = "ceramic-filter", amount = 5 },
    { type = "fluid", name = "waste-water",    amount = 20 },
  },
  craftTime = 0.5,
  category = "chemistry",
  icon = "item/ceramic-filter.png",
  iconSize = 64,
  subgroup = "intermediate-product",
});

recipe({
  name = "waste-water-recycling",
  ingredients = { { type = "fluid", name = "waste-water", amount = 40 } },
  results = { { type = "fluid", name = "water", amount = 40 }, { type = "item", name = "sulfur", amount = 4 } },
  craftTime = 1,
  category = "chemistry",
  icon = "item/waste-water.png",
  iconSize = 64,
  subgroup = "intermediate-product",
});

technology({
  name = "ore-sorting",
  prerequisites = { "automation-2" },
  unit = {
    count = 100,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    time = 1,
  },
  effects = {
    { type = "unlock-recipe", recipe = "ore-sorter" },
    { type = "unlock-recipe", recipe = "saphirite-sorting" },
    { type = "unlock-recipe", recipe = "stiritite-sorting" },
    { type = "unlock-recipe", recipe = "bobmonium-sorting" },
    { type = "unlock-recipe", recipe = "rubyte-sorting" },
    { type = "unlock-recipe", recipe = "bobmonium-crystalization-nauvis" },
    { type = "unlock-recipe", recipe = "rubyte-crystalization-nauvis" },
    { type = "unlock-recipe", recipe = "iron-plate" },
    { type = "unlock-recipe", recipe = "copper-plate" },
  },
  icons = sortingImage("item/saphirite.png"),
});
technology({
  name = "pure-ore-sorting",
  prerequisites = {
    "ore-sorting",
  },
  unit = {
    count = 100,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    time = 1,
  },
  effects = {
    { type = "unlock-recipe", recipe = "pure-iron-ore-sorting-nauvis" },
    { type = "unlock-recipe", recipe = "pure-copper-ore-sorting-nauvis" },
    { type = "unlock-recipe", recipe = "catalist" },
  },
  icons = sortingImage("item/iron-ore.png"),
});
technology({
  name = "pure-ore-sorting2",
  prerequisites = {
    "pure-ore-sorting",
    "chemical-science-pack",
  },
  unit = {
    count = 100,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
    },
    time = 1,
  },
  effects = {
    { type = "unlock-recipe", recipe = "pure-silicon-ore-sorting-nauvis" },
    { type = "unlock-recipe", recipe = "pure-tin-ore-sorting-nauvis" },
  },
  icons = sortingImage("item/tin-ore.png"),
});

data.raw["recipe"]["saphirite-crystalization-nauvis"].enabled = true;
data.raw["recipe"]["stiritite-crystalization-nauvis"].enabled = true;

data.raw["recipe"]["small-electric-pole"].enabled = true;
data.raw["recipe"]["copper-cable"].enabled = true;

data.raw["recipe"]["iron-plate"].enabled = false;
data.raw["recipe"]["copper-plate"].enabled = false;

data.raw["technology"]["oil-processing"] = nil;

data.raw["technology"]["plastics"].prerequisites = { "fluid-handling" };
data.raw["technology"]["plastics"].effects =
{ { type = "unlock-recipe", recipe = "plastic-bar" }, { type = "unlock-recipe", recipe = "wood-liquification" } };

data.raw["technology"]["sulfur-processing"].unit = data.raw["technology"]["oil-gathering"].unit;
data.raw["technology"]["sulfur-processing"].prerequisites = { "fluid-handling", "advanced-filtering" };
data.raw["technology"]["sulfur-processing"].research_trigger = nil;

data.raw["technology"]["flammables"].prerequisites = { "advanced-oil-processing" };
data.raw["technology"]["rocket-fuel"].prerequisites = { "flammables" };

data.raw["technology"]["sulfur-processing"].effects = {
  { type = "unlock-recipe", recipe = "waste-water-recycling" },
  { type = "unlock-recipe", recipe = "sulfuric-acid" },
};

data.raw.technology["oil-gathering"] = nil;

data:extend({
  {
    type = "recipe-category",
    name = "ore-sorting",
  },
  {
    type = "recipe-category",
    name = "algae-growing",
  },
  {
    type = "recipe-category",
    name = "filtering",
  },
  {
    type = "item-subgroup",
    name = "algae",
    group = "intermediate-products",
  },
});

recipe({
  name = "ore-sorter",
  ingredients = {
    { type = "item", name = "steel-plate",        amount = 20 },
    { type = "item", name = "electronic-circuit", amount = 10 },
    { type = "item", name = "iron-gear-wheel",    amount = 10 },
  },
  results = {
    { type = "item", name = "ore-sorter", amount = 1 },
  },
  craftTime = 1,
  subgroup = "production-machine",
});

recipe({
  name = "algae-farm",
  ingredients = {
    { type = "item", name = "pipe",               amount = 10 },
    { type = "item", name = "electronic-circuit", amount = 10 },
    { type = "item", name = "iron-gear-wheel",    amount = 10 },
  },
  results = {
    { type = "item", name = "algae-farm", amount = 1 },
  },
  craftTime = 1,
  subgroup = "production-machine",
});

recipe({
  name = "filtration-unit",
  ingredients = {
    { type = "item", name = "pipe",               amount = 10 },
    { type = "item", name = "electronic-circuit", amount = 10 },
    { type = "item", name = "iron-gear-wheel",    amount = 10 },
  },
  results = {
    { type = "item", name = "filtration-unit", amount = 1 },
  },
  enabled = true,
  craftTime = 1,
  subgroup = "production-machine",
});

item("algae-farm", 50);
item("ore-sorter", 50);
item("filtration-unit", 50);

data.raw["item"]["ore-sorter"].place_result = "ore-sorter";
data.raw["item"]["algae-farm"].place_result = "algae-farm";
data.raw["item"]["filtration-unit"].place_result = "filtration-unit";

assemblingMachine({
  name = "ore-sorter",
  categories = { "ore-sorting" },
  speed = 1,
  mineResult = "ore-sorter",
  icon = "item/sorter.png",
  iconSize = 256,
  box = { { -4, -4 }, { 4, 4 } },
});

assemblingMachine({
  name = "algae-farm",
  categories = { "algae-growing" },
  speed = 1,
  mineResult = "algae-farm",
  icon = "item/algae-farm.png",
  iconSize = 224,
  box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
  fluidBoxes = {
    {
      production_type = "input",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "input", direction = defines.direction.north, position = { 0, -3.3 } },
      },
    },
    {
      production_type = "input",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "input", direction = defines.direction.south, position = { 0, 3.3 } },
      },
    },
  },
});

assemblingMachine({
  name = "filtration-unit",
  categories = { "filtering" },
  speed = 1,
  mineResult = "filtration-unit",
  icon = "item/filtration-unit.png",
  iconSize = 160,
  box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
  fluidBoxes = {
    {
      production_type = "input",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "input", direction = defines.direction.north, position = { 1, -2.3 } },
      },
    },
    {
      production_type = "input",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "input", direction = defines.direction.north, position = { -1, -2.3 } },
      },
    },
    {
      production_type = "output",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "output", direction = defines.direction.south, position = { 1, 2.3 } },
      },
    },
    {
      production_type = "output",
      volume = 1000,
      pipe_connections = {
        { flow_direction = "output", direction = defines.direction.south, position = { -1, 2.3 } },
      },
    },
  },
});

technology({
  name = "chemical-plant",
  unit = {
    count = 25,
    ingredients = {
      { "automation-science-pack", 1 },
    },
    time = 10,
  },
  prerequisites = {
    "automation",
    "steel-processing",
  },
  effects = {
    { type = "unlock-recipe", recipe = "chemical-plant" },
  },
  icon2 = "__base__/graphics/icons/chemical-plant.png",
});

technology({
  name = "advanced-filtering",
  unit = {
    count = 50,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    time = 10,
  },
  prerequisites = {
    "chemical-plant",
    "logistic-science-pack",
    "coal-filtering",
  },
  effects = {
    { type = "unlock-recipe", recipe = "ceramic-filter" },
    { type = "unlock-recipe", recipe = "ceramic-filtering" },
    { type = "unlock-recipe", recipe = "ceramic-filter-cleaning" },
  },
  icon = "item/ceramic-filter.png",
});

technology({
  name = "coal-filtering",
  unit = {
    count = 50,
    ingredients = {
      { "automation-science-pack", 1 },
    },
    time = 10,
  },
  prerequisites = {
    "algae-processing",
  },
  effects = {
    { type = "unlock-recipe", recipe = "filter-frame" },
    { type = "unlock-recipe", recipe = "coal-filter" },
    { type = "unlock-recipe", recipe = "water-filtering" },
  },
  icon = "item/coal-filter.png",
});

data.raw["technology"]["electronics"].effects = {
  {
    type = "unlock-recipe",
    recipe = "electronic-circuit",
  },
  {
    type = "unlock-recipe",
    recipe = "lab",
  },
  {
    type = "unlock-recipe",
    recipe = "inserter",
  },
};

item("blue-algae", 200, "item/blue-algae.png", 64);

recipe({
  name = "blue-algae",
  ingredients = { { type = "fluid", name = "waste-water", amount = 50 } },
  results = { { type = "item", name = "blue-algae", amount = 20 } },
  craftTime = 20,
  category = "algae-growing",
  subgroup = "algae",
});

recipe({
  name = "crude-oil",
  ingredients = {
    { type = "item",  name = "blue-algae", amount = 5 },
    { type = "fluid", name = "steam",      amount = 50 },
  },
  results = {
    { type = "fluid", name = "crude-oil", amount = 30 },
    {
      type = "fluid",
      name = "waste-water",
      amount = 20,
    },
  },
  craftTime = 1,
  category = "chemistry",
  icon2 = "__base__/graphics/icons/fluid/crude-oil.png",
  subgroup = "algae",
});

technology({
    name = "blue-algae-processing",
    icon = "item/blue-algae.png",
    icon_size = 64,
    prerequisites = { "chemical-science-pack", "algae-processing" },
    unit = {
      count = 100,
      ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
      time = 20,
    },
    effects = {
      { type = "unlock-recipe", recipe = "blue-algae" },
      { type = "unlock-recipe", recipe = "crude-oil" },
    },
});

local fuelOil = table.deepcopy(data.raw["fluid"]["water"]);

fuelOil.name = "fuel-oil";
fuelOil.icon = imagePath("item/fuel-oil.png");
data:extend({ fuelOil });

data.raw["recipe"]["advanced-oil-processing"].results = {
  { type = "fluid", name = "heavy-oil",     amount = 25 },
  { type = "fluid", name = "petroleum-gas", amount = 45 },
  { type = "fluid", name = "fuel-oil",      amount = 55 },
};

data.raw["recipe"]["rocket-fuel"].ingredients[2].name = "fuel-oil";
data.raw["recipe"]["solid-fuel-from-heavy-oil"] = nil;
data.raw["recipe"]["solid-fuel-from-light-oil"].ingredients[1].name = "fuel-oil";
data.raw["recipe"]["solid-fuel-from-light-oil"].name = "solid-fuel-from-fuel-oil";
data.raw["recipe"]["solid-fuel-from-fuel-oil"] = data.raw["recipe"]["solid-fuel-from-light-oil"];
data.raw["recipe"]["solid-fuel-from-light-oil"] = nil;
data.raw["recipe"]["solid-fuel-from-petroleum-gas"] = nil;

local advancedOil2 = table.deepcopy(data.raw.recipe["advanced-oil-processing"]);
advancedOil2.name = "advanced-petroleum-processing";
advancedOil2.results = {
  { type = "fluid", name = "heavy-oil",     amount = 45 },
  { type = "fluid", name = "petroleum-gas", amount = 25 },
  { type = "fluid", name = "fuel-oil",      amount = 25 },
};
data:extend({ advancedOil2 });

data.raw["technology"]["advanced-oil-processing"].prerequisites = { "blue-algae-processing" };
data.raw["technology"]["advanced-oil-processing"].effects = {
  {
    type = "unlock-recipe",
    recipe = "advanced-oil-processing",
  },
  {
    type = "unlock-recipe",
    recipe = "advanced-petroleum-processing",
  },
  {
    type = "unlock-recipe",
    recipe = "oil-refinery",
  },
  {
    type = "unlock-recipe",
    recipe = "solid-fuel-from-fuel-oil",
  },
};

recipe({
  name = "wood-liquification",
  ingredients = { { type = "item", name = "wood", amount = 5 } },
  results = { { type = "fluid", name = "petroleum-gas", amount = 50 } },
  craftTime = 1,
  category = "chemistry",
  subgroup = "algae",
});

data.raw["research-achievement"]["eco-unfriendly"].technology = "advanced-oil-processing";

data.raw["technology"]["steam-power"].effects = {
  { type = "unlock-recipe", recipe = "boiler" },
  { type = "unlock-recipe", recipe = "steam-engine" },
};
data.raw["technology"]["steam-power"].unit = {
  count = 50,
  ingredients = { { "automation-science-pack", 1 } },
  time = 10,
};

data.raw.recipe["pipe"].enabled = nil;
data.raw.recipe["pipe-to-ground"].enabled = nil;
data.raw.recipe["offshore-pump"].enabled = nil;

data.raw["technology"]["steam-power"].research_trigger = nil;
data.raw["technology"]["steam-power"].prerequisites = { "algae-processing" };

data.raw["technology"]["automation-science-pack"].prerequisites = { "electronics" };

data.raw["planet"]["nauvis"].map_gen_settings = {
  autoplace_settings = {
    tile = {
      settings = {
        ["deepwater"] = {},
        ["sand-1"] = {},
      },
    },
  },
};

data.raw["tile"]["deepwater"].autoplace = {
  probability_expression = 0.5,
};

data.raw["tile"]["sand-1"].autoplace = {
  probability_expression = "abs(x)<5&abs(y)<5",
};
