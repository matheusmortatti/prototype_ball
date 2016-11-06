/// @description Insert description here
// You can write your code in this editor


if(!instance_exists(player1)) {
	player1 = instance_create_layer(p1SpawnX, p1SpawnY, layer, oPlayer);
}

if(!instance_exists(player2)) {
	player2 = instance_create_layer(p2SpawnX, p2SpawnY, layer, oPlayer);
	player2.playerNum = 1;
}

if(!instance_exists(ball)) {
	ball = instance_create_layer(ballSpawnX, ballSpawnY, layer, oBall);
}