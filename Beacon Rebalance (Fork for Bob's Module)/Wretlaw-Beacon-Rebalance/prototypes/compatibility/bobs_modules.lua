
if settings.startup["wret-change-bob"].value == true then --going the singularity beacon route, increasing power but decreasing range
    
    local bob_2 = data.raw["beacon"]["bob-beacon-2"]

    bob_2.module_specification.module_slots = 10
    bob_2.module_specification.module_info_max_icons_per_row = 4
    bob_2.module_specification.module_info_max_icon_rows = 3
    bob_2.distribution_effectivity = .75
    bob_2.supply_area_distance = data.raw["beacon"]["beacon"].supply_area_distance
    bob_2.energy_usage = "1MW"

    local bob_3 = data.raw["beacon"]["bob-beacon-3"]

    bob_3.module_specification.module_slots = 12
    bob_3.module_specification.module_info_max_icons_per_row = 4
    bob_3.module_specification.module_info_max_icon_rows = 3
    bob_3.distribution_effectivity = 1
    bob_3.supply_area_distance = data.raw["beacon"]["beacon"].supply_area_distance
    bob_3.energy_usage = "3MW"

end

local cost_multiplier = 5 -- I'm not familiar with bob's mods so i'll just multiply the cost of the small beacons

if settings.startup["wret-overload-enable-beaconmk2"].value == true then

    data.raw["recipe"]["wr-beacon-2"].ingredients = {{"beacon", 1}}
    for _, ingredient in pairs(data.raw["recipe"]["beacon-2"].ingredients) do
        if not string.find((ingredient.name or ingredient[1]), "beacon") then
            table.insert(data.raw["recipe"]["wr-beacon-2"].ingredients, {type = ingredient.type, ingredient.name, ingredient.amount * cost_multiplier})
        end
    end
    
end

if settings.startup["wret-overload-enable-beaconmk3"].value == true then

    data.raw["recipe"]["wr-beacon-3"].ingredients = {{"wr-beacon-2", 1}}
    for _, ingredient in pairs(data.raw["recipe"]["wr-beacon-2"].ingredients) do
        if not string.find((ingredient.name or ingredient[1]), "beacon") then
            table.insert(data.raw["recipe"]["wr-beacon-3"].ingredients, {type = ingredient.type, ingredient.name, ingredient.amount * cost_multiplier})
        end
    end

end