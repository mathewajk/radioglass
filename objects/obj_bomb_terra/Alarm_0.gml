/// @description Insert description here
// You can write your code in this editor

//bomb detonates when alarm = 0

var radius = 15;

var layer_id_terra = layer_get_id("small_tiles_terraformed");
var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);

var x0 = floor(x/4);
var y0 = floor(y/4);
var x1 = x0 + radius;
var y1 = y0 + radius;


instance_destroy();