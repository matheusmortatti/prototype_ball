/// @description Insert description here
// You can write your code in this editor

show_debug_message("Event = " + async_load[? "event_type"]);        // Debug cocde so you can see which event has been
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   // triggered and the pad associated with it.

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.5);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
        // Create a     layer object and assign it a pad number
    with (player[pad]) {
        contrPlugged = true;
		pad_num = pad;
    }

    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    var pad = async_load[? "pad_index"];       // Get the pad index
    if (instance_exists(player[pad])) {        // Check for a player instance associated with the pad and remove it
        with (player[pad]) {
            contrPlugged = false;
			pad_num = -1;
		}
	}
    break;
}