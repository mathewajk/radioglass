///drawEdge(x0, y0, attack, tilemap_id)

var x0 = argument0;
var y0 = argument1;
var tilemap_id = argument2;
var attack = argument3;
var water_layer = layer_get_id("water_layer");
var water_id = layer_tilemap_get_id(water_layer);
					var cur_tile = tilemap_get(tilemap_id, x0, y0); //sets current tile at x0, y0
					var cur_tile1 = tilemap_get(water_id, x0, y0); //sets current tile at x0, y0
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
						
							tilemap_set(water_id, 38, x0, y0);
							tilemap_set(tilemap_id,0,x0,y0);
							}
							else if(grass_tile != 15 && water_tile != 0)
							tilemap_set(tilemap_id, grass_tile + 40, x0, y0);
						}
						else if(grass_tile == 15 && water_tile != 15 && (cur_tile == 15 || cur_tile == 17)) { //dealing with single grass tiles in the middle of water
							tilemap_set(tilemap_id, 18, x0, y0);
						}
						else if((grass_tile != 0 || water_tile != 0) && (grass_tile + water_tile != 15)) { // if the new tile is an edge tile

							if(grass_tile != 15 && water_tile == 15 && attack == 1) {
								tilemap_set(tilemap_id, grass_tile, x0, y0);
							}
							else if(grass_tile == 15 && water_tile != 15 && attack == 2)
							{		 	
								tilemap_set(tilemap_id,0,x0,y0);
							 	tilemap_set(water_id, water_tile + 20, x0, y0);
							}
							else if(grass_tile != 15 && water_tile != 15)
							{
								if(cur_tile > 0 && cur_tile < 20)
									tilemap_set(tilemap_id, grass_tile, x0, y0);
								else if(cur_tile > 20 && cur_tile < 40){
									tilemap_set(tilemap_id,0,x0,y0);   show_debug_message(string(grass_tile));
						show_debug_message(string(water_tile)+"water");
									tilemap_set(water_id, water_tile + 20, x0, y0);
								}
							}
							}
						else if (cur_tile == 40)
						{
							//show_debug_message(40);
							tilemap_set(tilemap_id, 15, x0, y0);
						}
						else if (cur_tile > 40) // if the current tile is a hybrid tile
						{
							tilemap_set(tilemap_id, grass_tile + 40, x0, y0);
						}
						//good----
						else if(cur_tile != 17 && cur_tile != 15 && cur_tile != 37 && cur_tile != 35) { //replaces existing edge tiles with center tiles or hybrid tiles
								switch(attack){
									case 1:
									if(cur_tile > 20 && cur_tile < 35 && grass_tile!= 0) //if current tile is a water edge tile and land is being drawn
									{
										tilemap_set(water_id, 35, x0, y0);
									}
									else {
										tilemap_set(tilemap_id, 15, x0, y0)
									}
									break;
									case 2:
									if(cur_tile > 0 && cur_tile < 15)  //if current tile is a land edge tile and water is being drawn
									{
										tilemap_set(tilemap_id, grass_tile + 40, x0, y0);
									}
									else {
										
										tilemap_set(tilemap_id, 0, x0, y0)
										tilemap_set(water_id, 35, x0, y0)
									}
									break;
								}
						}
						else if ((cur_tile == 15 || cur_tile == 17) && water_tile != 15)
						{
							tilemap_set(tilemap_id, grass_tile + 40, x0, y0);
						}
					}