
if settings.startup["wret-change-bob"].value == true then --going the singularity beacon route, increasing power but decreasing range
    
    local bob_2 = data.raw["beacon"]["bob-beacon-2"]

    bob_2.module_slots = 15
    bob_2.module_info_max_icons_per_row = 5
    bob_2.module_info_max_icon_rows = 3
    bob_2.distribution_effectivity = 1
    bob_2.supply_area_distance = 14
    bob_2.energy_usage = "12MW"

    local bob_3 = data.raw["beacon"]["bob-beacon-3"]

    bob_3.module_slots = 20
    bob_3.module_info_max_icons_per_row = 5
    bob_3.module_info_max_icon_rows = 4
    bob_3.distribution_effectivity = 1
    bob_3.supply_area_distance = 14
    bob_3.energy_usage = "20MW"

end

-- Set cost multiplier
local cost_multiplier = 5 -- I'm not familiar with bob's mods so I'll just multiply the cost of the small beacons

-- Beacon-2 recipe modification
if settings.startup["wret-overload-enable-beacons-2"].value == true then
    data.raw["recipe"]["wr-beacon-2"].ingredients = {{"beacon", 1}}
    for _, ingredient in pairs(data.raw["recipe"]["wr-beacon-2"].ingredients) do
        if not string.find((ingredient.name or ingredient[1]), "beacon") then
            table.insert(data.raw["recipe"]["wr-beacon-2"].ingredients, {
                type = ingredient.type, 
                name = ingredient.name, 
                amount = ingredient.amount * cost_multiplier
            })
        end
    end
end

-- Beacon-3 recipe modification
if settings.startup["wret-overload-enable-beacons-3"].value == true then
    data.raw["recipe"]["wr-beacon-3"].ingredients = {{"wr-beacon-2", 1}}
    for _, ingredient in pairs(data.raw["recipe"]["wr-beacon-2"].ingredients) do
        if not string.find((ingredient.name or ingredient[1]), "beacon") then
            table.insert(data.raw["recipe"]["wr-beacon-3"].ingredients, {
                type = ingredient.type, 
                name = ingredient.name, 
                amount = ingredient.amount * cost_multiplier
            })
        end
    end
end
