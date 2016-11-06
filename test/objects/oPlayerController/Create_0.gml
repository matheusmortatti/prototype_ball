/// @description Insert description here
// You can write your code in this editor

p1SpawnX = 200;
p1SpawnY = 500;
p2SpawnX = 600;
p2SpawnY = 500;
ballSpawnX = 400;
ballSpawnY = 500

player1 = instance_create_layer(p1SpawnX, p1SpawnY, layer, oPlayer);
player2 = instance_create_layer(p2SpawnX, p2SpawnY, layer, oPlayer);
ball	= instance_create_layer(ballSpawnX, ballSpawnY, layer, oBall);

player2.playerNum = 1;