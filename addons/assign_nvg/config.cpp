#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {"aagz_assign_nvg"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aagz_main"};
        author = "Eclipser";
        VERSION_CONFIG;
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class GVAR(Common) : NO_CATEGORY { displayName = "14th AAG"; };
};

class CfgVehicles {
	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription
		{
			class AnyPlayer;
			class AnyBrain;
			class EmptyDetector;
		};
	};
	class Achilles_Module_Base : Module_F {
		class Arguments {};
    	class ModuleDescription: ModuleDescription {};
	};
    class aagz_module_base : Achilles_Module_Base {
        category = QGVAR(Common);
        scopeCurator = 2;
    };
    class aagz_assign_nvg : aagz_module_base {
        displayName = "Assign NVGs";
        function = QFUNC(assignNvg);
    };
};

#include "CfgEventHandlers.hpp"