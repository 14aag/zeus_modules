#include "\achilles\modules_f_ares\module_header.inc.sqf"

private _unit = [_logic, false] call Ares_fnc_GetUnitUnderCursor;
if (isNull _unit) exitWith {[localize "STR_AMAE_NO_UNIT_SELECTED"] call Achilles_fnc_ShowZeusErrorMessage};
if (!isPlayer _unit) exitWith {[localize "STR_AMAE_NO_PLAYER_IN_SELECTION"] call Achilles_fnc_ShowZeusErrorMessage};

private _respawns = allMapMarkers select { _x find "respawn_" == 0 && !(_x in ["respawn_west", "respawn_east", "respawn_guerrila", "respawn_civilian", "respawn", "respawn_vehicle_west", "restpawn_vehicle_east", "respawn_vehicle_guerrila", "respawn_vehicle_civilian"]) };
private _names = _respawns apply { _x select [8] };

private _dialogResult =
[
	"Assign Respawn",
	[
		[
			"Respawn name", _names
		]
	]
] call Ares_fnc_ShowChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};
private _index = _dialogResult select 0;

(group _unit) setVariable ["leader_name", _names select _index, true];
[{ ["efn_force_leader_name_update"] call CBA_fnc_globalEvent; }, [], 3] call CBA_fnc_waitAndExecute;

#include "\achilles\modules_f_ares\module_footer.inc.sqf"