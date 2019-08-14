///drawEdge(x0, y0, attack)

var x0 = argument0;
var y0 = argument1;
//var attack = argument2;
var layer_id_grass = layer_get_id("small_tiles_terraformed");
var tilemap_id_grass = layer_tilemap_get_id(layer_id_grass);
var layer_id_water = layer_get_id("water_layer");
var tilemap_id_water = layer_tilemap_get_id(layer_id_water);

var cur_grass = tilemap_get(tilemap_id_grass, x0, y0); //gets value of grass tile at specified location
var cur_water = tilemap_get(tilemap_id_water, x0, y0); //gets value of water tile at specified location
if(cur_grass || cur_water) // if current tile already contains a path (will only convert existing tiles to edge tiles, not create new ones)
{
	//check for adjacent grass and water tiles
	var adjacent_grass = grassCheck(x0, y0);
	var adjacent_water = waterCheck(x0, y0);
	if(!cur_grass) // if current tile is a pure water tile
	{
		if(adjacent_grass | adjacent_water == 15) // for randomized water center tiles
		{
			if(cur_water != 17 && cur_water != 15)
			{
				var coinflip = floor(random(4));
				if(coinflip != 0)
					tilemap_set(tilemap_id_water, 15, x0, y0);
				else
					tilemap_set(tilemap_id_water, 17, x0, y0);
			}
		}
		else
		{
			//treat grass tiles as water for merging purposes
			tilemap_set(tilemap_id_water, adjacent_grass | adjacent_water, x0, y0);
		}
	}
	else //if current tile is a grass tile
	{
		if(adjacent_grass == 15) // for randomized grass center tiles
		{
			if(cur_grass != 17 && cur_grass != 15)
			{
				var coinflip = floor(random(4));
				if(coinflip != 0)
					tilemap_set(tilemap_id_grass, 15, x0, y0);
				else
					tilemap_set(tilemap_id_grass, 17, x0, y0);
			}
		}
		else
		{
			if(adjacent_grass == 0)
			{
				tilemap_set(tilemap_id_grass, 18, x0, y0);
			}
			else
			{
				tilemap_set(tilemap_id_grass, adjacent_grass, x0, y0);
			}
			tilemap_set(tilemap_id_water, adjacent_water, x0, y0);
		}
	}
}
// OLD CODE FOR SHARED TILESETS
/*					var cur_tile = tilemap_get(tilemap_id_grass, x0, y0); //sets current tile at x0, y0
					var cur_tile1 = tilemap_get(tilemap_id_water, x0, y0); //sets current tile at x0, y0
					cur_tile = cur_tile + cur_tile1;
					cur_tile1 = cur_tile - cur_tile1;
					if(cur_tile != 0) { //if current tile already contains a path
						var grass_tile = grassCheck(x0, y0); //check for adjacent grass tiles
						var water_tile = waterCheck(x0, y0); //check for adjacent water tiles
						if(cur_tile == 38)
							{
							}
						else if(cur_tile == 18) { //dealing with single grass tiles in the middle of water
							if(grass_tile == 15 && water_tile == 0){
						
							tilemap_set(tilemap_id_water, 38, x0, y0);
							tilemap_set(tilemap_id_grass,0,x0,y0);
							}
							else if(grass_tile != 15 && water_tile != 0)
							tilemap_set(tilemap_id_grass, grass_tile + 40, x0, y0);
						}
						else if(grass_tile == 15 && water_tile != 15 && (cur_tile == 15 || cur_tile == 17)) { //dealing with single grass tiles in the middle of water
							tilemap_set(tilemap_id_grass, 18, x0, y0);
						}
						else if((grass_tile != 0 || water_tile != 0) && (grass_tile + water_tile != 15)) { // if the new tile is an edge tile

							if(grass_tile != 15 && water_tile == 15 && attack == 1) {
								tilemap_set(tilemap_id_grass, grass_tile, x0, y0);
							}
							else if(grass_tile == 15 && water_tile != 15 && attack == 2)
							{		 	
								tilemap_set(tilemap_id_grass,0,x0,y0);
							 	tilemap_set(tilemap_id_water, water_tile + 20, x0, y0);
							}
							else if(grass_tile != 15 && water_tile != 15)
							{
								if(cur_tile > 0 && cur_tile < 20)
									tilemap_set(tilemap_id_grass, grass_tile, x0, y0);
								else if(cur_tile > 20 && cur_tile < 40){
									tilemap_set(tilemap_id_grass,0,x0,y0);   show_debug_message(string(grass_tile));
						show_debug_message(string(water_tile)+"water");
									tilemap_set(tilemap_id_water, water_tile + 20, x0, y0);
								}
							}
							}
						else if (cur_tile == 40)
						{
							//show_debug_message(40);
							tilemap_set(tilemap_id_grass, 15, x0, y0);
						}
						else if (cur_tile > 40) // if the current tile is a hybrid tile
						{
							tilemap_set(tilemap_id_grass, grass_tile + 40, x0, y0);
						}
						//good----
						else if(cur_tile != 17 && cur_tile != 15 && cur_tile != 37 && cur_tile != 35) { //replaces existing edge tiles with center tiles or hybrid tiles
								switch(attack){
									case 1:
									if(cur_tile > 20 && cur_tile < 35 && grass_tile!= 0) //if current tile is a water edge tile and land is being drawn
									{
										var coinflip = floor(random(4));
										  if(coinflip != 0)
											tilemap_set(tilemap_id_water, 35, x0, y0);
										  else
											tilemap_set(tilemap_id_water, 37, x0, y0);
									}
									else {
										var coinflip = floor(random(4));
										  if(coinflip != 0)
											tilemap_set(tilemap_id_grass, 15, x0, y0);
										  else
											tilemap_set(tilemap_id_grass, 17, x0, y0);
									}
									break;
									case 2:
									if(cur_tile > 0 && cur_tile < 15)  //if current tile is a land edge tile and water is being drawn
									{
										tilemap_set(tilemap_id_grass, grass_tile + 40, x0, y0);
									}
									else {
										
										tilemap_set(tilemap_id_grass, 0, x0, y0)
										var coinflip = floor(random(4));
										  if(coinflip != 0)
											tilemap_set(tilemap_id_water, 35, x0, y0);
										  else
											tilemap_set(tilemap_id_water, 37, x0, y0);
									}
									break;
								}
						}
						else if ((cur_tile == 15 || cur_tile == 17) && water_tile != 15)
						{
							tilemap_set(tilemap_id_grass, grass_tile + 40, x0, y0);
						}
					}*/