// Bresenham line draw
// -------------------
//function bitmap = bresenham_line_draw(bitmap, pt, d1)    /*
    /*for p = 0:len                           //inner loop (parallel to line)
	

        bitmap(pt.x, pt.y) = bitmap(pt.x, pt.y) + 1;

        if d1 <= kt                                % square move (d1 -> M0)
            pt.x = pt.x + sd1x;
            pt.y = pt.y + sd1y;

            d1   = d1 + kv;
        else                                     % diagonal move (d1 -> M1)
            pt.x = pt.x + dd1x;
            pt.y = pt.y + dd1y;

            d1   = d1 + kd;
        end
    end
end
end
*/