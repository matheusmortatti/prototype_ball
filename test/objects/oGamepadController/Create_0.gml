/// @description initialize controller array    
// You can write your code in this editor

player = []; 

// Initialize array with 4 players as maximum 
for (i = 0; i < 2; i++) {
	player[i] = instance_create_layer(50*i + 50, 100, layer, oPlayer);
}