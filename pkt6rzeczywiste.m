initial_values;
nameK = 'sprzezenie_od_stanu';
options = simset('SrcWorkspace','current');
X0 = [8 2 -1];
iter = 1;
for i=-0.4:0.2:0.6
    pole= i;
    K=acker(A2,B2,[pole,pole,pole]);
    sim(nameK, [], options);
    stairs(sprzezenie1.time,sprzezenie1.data,'r');
    hold on;
    stairs(sprzezenie2.time,sprzezenie2.data,'g');
    stairs(sprzezenie3.time,sprzezenie3.data,'b');
    title(['przebiegi czasowe zmiennych stanu' newline 'dla bieguna w ',num2str(i)]);
    xlabel('t');
    legend('x1','x2','x3');
    filename = ['6\I zmienne stanu biegun ',num2str(i),'.svg'];
    print ('-dsvg','-r600',filename);
    hold off;
    
    stairs(sterowanie.time,sterowanie.data,'r');
    title(['przebieg czasowy sterowania' newline 'dla bieguna w ',num2str(i)]);
    iter = iter+1;
    xlabel('t');
    legend('sygna³ steruj¹cy');
    filename = ['6\I sygnal sterujacy biegun ',num2str(i),'.svg'];
    print ('-dsvg','-r600',filename);
    hold off;
end