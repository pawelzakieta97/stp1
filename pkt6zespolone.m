initial_values;
nameK = 'sprzezenie_od_stanu';
options = simset('SrcWorkspace','current');
X0 = [8 2 -1];
iter = 1;
zb1=0.4;
a=[0.2, 0.2, 0.2, 0.4, 0.4, 0.4, 0.6, 0.6, 0.6];
b=[0.2, 0.4, 0.6, 0.2, 0.4, 0.6, 0.2, 0.4, 0.6];
for i=1:9
    zb2 = a(i)+b(i)*1i;
    zb3 = a(i)-b(i)*1i;
    K=acker(A2,B2,[zb1,zb2,zb3]);
    sim(nameK, [], options);
    stairs(sprzezenie1.time,sprzezenie1.data,'r');
    hold on;
    stairs(sprzezenie2.time,sprzezenie2.data,'g');
    stairs(sprzezenie3.time,sprzezenie3.data,'b');
    title(['przebiegi czasowe zmiennych stanu' newline 'dla biegunów: ' num2str(zb1) ' ,  ' num2str(zb2) ' ,  ' num2str(zb3)]);
    xlabel('t');
    legend('x1','x2','x3');
    filename = ['6\II zmienne stanu bieguny = ',num2str(zb2),num2str(zb3),'.svg'];
    print ('-dsvg','-r600',filename);
    hold off;
    
    stairs(sterowanie.time,sterowanie.data,'r');
    title(['przebieg czasowy sterowania' newline 'dla biegununów:  ' num2str(zb1) ' ,  ' num2str(zb2) ' ,  ' num2str(zb3)]);
    iter = iter+1;
    xlabel('t');
    legend('sygna³ steruj¹cy');
    filename = ['6\II sygnal sterujacy bieguny = ',num2str(zb2),num2str(zb3),'.svg'];
    print ('-dsvg','-r600',filename);
    hold off;
end