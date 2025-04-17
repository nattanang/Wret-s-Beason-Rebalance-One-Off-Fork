if settings.startup["wret-overload-enable-beaconmk3"].value == true then
	settings.startup["wret-overload-enable-beaconmk2"].value = true
end

require("prototypes.classic_beacon")
require("prototypes.item")
require("prototypes.entity")
require("prototypes.technology")
