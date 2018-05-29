function k = przeregulowanie(y,x0)
k = -min(y)/x0;
if (k>2)
    k=2;
end