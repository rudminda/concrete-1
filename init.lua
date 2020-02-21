minetest.register_node("concrete:concrete_cured", {
	description = "Concrete",
	tiles = {"concrete_cured.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),

})

minetest.register_node("concrete:concrete_stair", {
		description = "Concrete Stair",
		tiles = {"concrete_cured.png"},
    drawtype = "nodebox",
    paramtype = "light",
		paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
            {-0.5, 0, 0, 0.5, 0.5, 0.5},
        },
    },
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults()

})


minetest.register_node("concrete:concrete_uncured_source", {
	description = "Batch of Wet Concrete",
	drawtype = "liquid",

	tiles = {"concrete_uncured.png"},

	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "concrete:concrete_uncured_flowing",
	liquid_alternative_source = "concrete:concrete_uncured_source",
	liquid_viscosity = 7,
	liquid_range = 4,
	post_effect_color = {a = 0, r = 0, g = 0, b = 0},
	groups = {liquid = 2},

})

minetest.register_node("concrete:concrete_uncured_flowing", {
	description = "Uncured Flowing Concrete",
	drawtype = "flowingliquid",

	tiles = {"concrete_uncured.png"},
	special_tiles = {
		{
			name = "concrete_uncured_animated.png",
			backface_culling = false,
			animation = {
				type = "horizantal_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "concrete_uncured_animated.png",
			backface_culling = true,
			animation = {
				type = "horizontal_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},

	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
  liquid_alternative_flowing = "concrete:concrete_uncured_flowing",
	liquid_alternative_source = "concrete:concrete_uncured_source",
	liquid_viscosity = 5,
	liquid_range = 4,
	post_effect_color = {a = 0, r = 0, g = 0, b = 0},
	groups = {liquid = 2, not_in_creative_inventory = 1},

})


minetest.register_abm({
  nodenames = {"concrete:concrete_uncured_flowing","concrete:concrete_uncured_source"},
  interval = 30,
  chance = 1,
  action = function(pos)
    minetest.add_node(pos, {name = "concrete:concrete_cured"})
  end,
})


minetest.register_craft({
    type = "shapeless",
    output = "concrete:concrete_uncured_source",
    recipe = {
        "moreblocks:cobble_compressed 12",
        "bucket:bucket_water",
    },
		replacements = {
			{"bucket:bucket_water","bucket:bucket_empty"}
		}
})

minetest.register_craft({
    output = "concrete:concrete_stair",
    recipe = {
        {"", "","concrete:concrete_cured"},
				{"", "concrete:concrete_cured","concrete:concrete_cured"},
				{"concrete:concrete_cured", "concrete:concrete_cured","concrete:concrete_cured"}
    }

})
