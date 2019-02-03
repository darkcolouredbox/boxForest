//////////////////////////////////
// Blackbox's Druid script      //
// v1   Green smokes            //
//////////////////////////////////

// This is a meme script, call it via init.sqf

if (isDedicated) exitWith {}; // Will not run on server, client-side loading

[] spawn {
	while {true} do {
		_smokeCount = [];
		_smokeCount = count (player nearObjects ["SmokeShellGreen", 3]);
		if (_smokeCount > 0) then {
			_smokeArray = player nearObjects ["SmokeShellGreen", 3];
			_smokeCount = count _smokeArray;
			while {_smokeCount > 0} do {
				systemChat "smoke detected";
				_smokeArray = player nearObjects ["SmokeShellGreen", 3];
				_smokeCount = count _smokeArray;
			};
			_smokeArray = player nearObjects ["SmokeShellGreen", 5];
			_smokeCount = count _smokeArray;
			if (_smokeCount > 0) then {
				systemChat "smoke thrown";
				sleep 1.5;
				systemChat "TREES";
				_smokeArray = player nearObjects ["SmokeShellGreen", 100];
				_smokeObj = _smokeArray select 0;
				[_smokeObj,20,3,32,10,64,[]] execVM "scripts\boxForest.sqf";
			} else {
				systemChat "smoke put away";
			};
		};
	};
};