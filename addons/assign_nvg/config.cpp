#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {"aagz_assign_nvg_module"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aagz_common"};
        author = "Eclipser";
        VERSION_CONFIG;
    };
};

class CfgVehicles {
    class EGVAR(common, base);
    class GVAR(module) : EGVAR(common, base) {
        displayName = "Assign NVGs";
        function = QFUNC(assignNvg);
    };
};

#include "CfgEventHandlers.hpp"