#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aagz_main"};
        author = "Eclipser";
        VERSION_CONFIG;
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class GVAR(faction) : NO_CATEGORY { displayName = "14th AAG"; };
};

class CfgVehicles {
    class Achilles_Module_Base;
    class GVAR(base) : Achilles_Module_Base {
        category = QGVAR(faction);
        scopeCurator = 2;
    };
};

#include "CfgEventHandlers.hpp"