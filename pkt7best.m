initial_values;
nameK = 'sprzezenie_od_stanu';
options = simset('SrcWorkspace','current');
X0 = [8 2 -1];
pole= 0.25;
z2 = 0.2+0.10i;
z3 = 0.2-0.10i;

K=acker(A2,B2,[pole,z2,z3]);
% K=acker(A2,B2,[pole,pole,pole]);

sim(nameK, [], options);
stairs(sprzezenie1.time,sprzezenie1.data,'r');
hold on;
stairs(sprzezenie2.time,sprzezenie2.data,'g');
stairs(sprzezenie3.time,sprzezenie3.data,'b');

title(['przebiegi czasowe zmiennych stanu' newline 'dla biegunów ',num2str(pole),' ,  ',num2str(z2),' ,  ',num2str(z3)]);
%title(['przebiegi czasowe zmiennych stanu' newline 'dla bieguna w ',num2str(pole)]);

xlabel('t');
legend('x1','x2','x3');

filename = ['7\I zmienne stanu biegun ',num2str(pole),' ,  ',num2str(z2),' ,  ',num2str(z3),'.svg'];
% filename = ['7\I zmienne stanu biegun ',num2str(pole),'.svg'];

print ('-dsvg','-r600',filename);
hold off;