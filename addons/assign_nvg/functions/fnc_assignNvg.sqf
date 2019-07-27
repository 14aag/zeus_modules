#include "\achilles\modules_f_ares\module_header.inc.sqf"

private _unit = [_logic, false] call Ares_fnc_GetUnitUnderCursor;
private _nvgs = "(configName _x) isKindOf ['NVGoggles', configFile >> 'CfgWeapons']" configClasses (configFile >> "CfgWeapons");
private _names = ["None"] + (_nvgs apply { getText (_x >> "displayName"); });

private _dialogResult =
[
	"Assign NVG",
	[
		[
			"NVG", _names
		]
	]
] call Ares_fnc_ShowChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};
_index = _dialogResult select 0;
_nvg = if (_index > 0) then {_nvgs select (_index - 1); } else { objNull; };

private _units = if (!isNull _unit) then {
    [_unit]
} else {
    private _selected_units = [localize "STR_AMAE_UNITS"] call Achilles_fnc_SelectUnits;
	if (isNil "_selected_units") then { [] } else { _selected_units }
};

if (_units isEqualTo []) exitWith {};
{
    if (_index == 0) then {
        private _goggles = (assignedItems _x) select { _x isKindOf ["NVGoggles", configFile >> "CfgWeapons"] };
        if !(_goggles isEqualTo []) then { _x unlinkItem (_goggles select 0); };
    } else {
        _x linkItem (configName _nvg);
    };
} forEach _units;

#include "\achilles\modules_f_ares\module_footer.inc.sqf"