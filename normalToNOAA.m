function x = normalToNOAA(y)
if sign(y) == -1
    x = 360 + y;
else
    temp = 360 + y;
    if temp > 434
        x = temp - 360;
    else
        x = temp;
    end
end