/// @description Insert description here
// You can write your code in this editor

//bomb detonates when alarm = 0

var radius = 15;
var layer_id_terra = layer_get_id("small_tiles_terraformed");
var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);
var x0 = floor(x/4);
var y0 = floor(y/4);

instance_create_layer(x, y, "instances_bullet", obj_explosion);
drawCircle(x0,y0,0,0, tilemap_id_terra,true,1);
drawEdgeRadius(x0,y0,x0+radius+5,y0);
//instance_destroy();