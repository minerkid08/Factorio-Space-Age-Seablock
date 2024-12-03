require("utils");

local foundryItem = table.deepcopy(data.raw["item"]["foundry"]);

foundryItem.name = "basicFoundry";
foundryItem.place_result = "basicFoundry";

local foundryRecipe = table.deepcopy(data.raw["recipe"]["foundry"]);

foundryRecipe.enabled = false;
foundryRecipe.name = "basicFoundry";
foundryRecipe.results[1].name = "basicFoundry";

foundryRecipe.ingredients = {
  { type = "item", name = "steel-plate",        amount = 25 },
  { type = "item", name = "electronic-circuit", amount = 20 },
  { type = "item", name = "concrete",           amount = 20 },
};

local foundry = table.deepcopy(data.raw["assembling-machine"]["foundry"]);

foundry.name = "basicFoundry";
foundry.crafting_speed = 1;
foundry.effect_receiver.base_effect.productivity = 0;
foundry.crafting_categories = { "metallurgy" };
foundry.minable.result = "basicFoundry";

data:extend({ foundryItem, foundry, foundryRecipe });

technology({
  name = "metallurgy",
  icon2 = foundry.icon,
  iconSize = foundry.icon_size,
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "basicFoundry" }
  },
  prerequisites = { "ore-sorting" }
});

data.raw["recipe"]["molten-iron"].ingredients = { { type = "item", name = "iron-ore", amount = 50 } };
data.raw["recipe"]["molten-copper"].ingredients = { { type = "item", name = "copper-ore", amount = 50 } };

technology({
  name = "advanced-iron-smelting",
  icon2 = "__base__/graphics/icons/iron-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "molten-iron" },
    { type = "unlock-recipe", recipe = "casting-iron" },
    { type = "unlock-recipe", recipe = "casting-steel" },
  },
  prerequisites = { "metallurgy" }
});

technology({
  name = "advanced-iron-casting",
  icon2 = "__base__/graphics/icons/iron-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "casting-iron-gear-wheel" },
    { type = "unlock-recipe", recipe = "casting-iron-stick" },
    { type = "unlock-recipe", recipe = "casting-pipe" },
    { type = "unlock-recipe", recipe = "casting-pipe-to-ground" },
  },
  prerequisites = { "chemical-science-pack", "advanced-iron-smelting" }
});

technology({
  name = "advanced-copper-smelting",
  icon2 = "__base__/graphics/icons/copper-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "molten-copper" },
    { type = "unlock-recipe", recipe = "casting-copper" },
  },
  prerequisites = { "metallurgy" }
});

technology({
  name = "advanced-copper-casting",
  icon2 = "__base__/graphics/icons/copper-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "casting-copper-cable" },
  },
  prerequisites = { "chemical-science-pack", "advanced-copper-smelting" }
});

-- tin

fluid("molten-tin", { 0, 192, 0 }, "error.png", 48);

recipe({
  name = "molten-tin",
  ingredients = { { type = "item", name = "tin-ore", amount = 50 } },
  results = { { type = "fluid", name = "molten-tin", amount = 500 } },
  craftTime = 32,
  category = "metallurgy"
});

recipe({
  name = "tin-plate-casting",
  ingredients = { { type = "fluid", name = "molten-tin", amount = 20 } },
  results = { { type = "item", name = "tin-plate", amount = 2 } },
  craftTime = 3.2,
  category = "metallurgy"
})

recipe({
  name = "tin-cable-casting",
  ingredients = { { type = "fluid", name = "molten-tin", amount = 20 }, {type = "fluid", name = "molten-copper", amount = 20} },
  results = { {type = "item", name = "tin-cable", amount = 4}},
  craftTime = 3.2,
  category = "metallurgy"
})

technology({
  name = "advanced-tin-smelting",
  icon = "item/tin-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "molten-tin" },
    { type = "unlock-recipe", recipe = "tin-plate-casting" },
  },
  prerequisites = { "chemical-science-pack", "metallurgy" }
});

technology({
  name = "advanced-tin-casting",
  icon = "item/tin-plate.png",
  unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
      { "production-science-pack",   1 },
    },
    count = 500,
    time = 30,
  },
  effects = {
    { type = "unlock-recipe", recipe = "tin-cable-casting" },
  },
  prerequisites = { "production-science-pack", "advanced-tin-smelting" }
});

-- silicon

fluid("molten-silicon", {192, 192, 192}, "error.png", 48);

recipe({
  name = "molten-silicon",
  ingredients = { { type = "item", name = "silicon-ore", amount = 50 } },
  results = { { type = "fluid", name = "molten-silicon", amount = 500 } },
  craftTime = 32,
  category = "metallurgy"
});

recipe({
  name = "silicon-casting",
  ingredients = { { type = "fluid", name = "mono-silicon", amount = 20 } },
  results = { { type = "item", name = "mono-silicon", amount = 10 } },
  craftTime = 3.2,
  category = "metallurgy"
})
