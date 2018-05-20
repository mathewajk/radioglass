///healthHelper(x0, y0, hp, hits, backcol, mincol, maxcol, direction, showback, showborder)
var x0 = argument0;
var y0 = argument1;
var hp = argument2;
var hits = argument3;
var backcol = argument4;
var mincol = argument5;
var maxcol = argument6;
var dir = argument7;
var showback = argument8;
var showborder = argument9;

var left = x0 - (hits*4);
var right = x0 + (hits*4);
var top = y0 + 2;
var bottom = y0 - 2;
var hp_draw = (hp/hits) * 100;
draw_healthbar(left, top, right, bottom, hp_draw, backcol, mincol, maxcol, dir, showback, showborder);