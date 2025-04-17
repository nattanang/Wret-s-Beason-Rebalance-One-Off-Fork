-- Check for Space Age mod without Bob's Modules
if mods["space-age"] and not mods["bobmodules"] then
    require("prototypes.compatibility.space_age")
end
