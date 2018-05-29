function t=czasRegulacji(y)
t=1;
z=abs(y);
threshold = 0.05;
while max(z(t:end)) > threshold
    t=t+1;
end
