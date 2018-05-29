initial_values;
nameK = 'sprzezenie_od_stanu';
options = simset('SrcWorkspace','current');
X0 = [8 2 -1];
t=zeros(1,70);     %czas regulacji
pr =zeros(1,70);   %przeregulowanie
pol = zeros(1,70);
sterMax = zeros(1,70); %max wartoœæ sterowania
Kpol = zeros(200,3);
iter = 1;
for i=-0.6:0.02:0.8
    pol(iter)=i;
    Kpol(iter,:)=acker(A2,B2,[i,i,i]);
    K = Kpol(iter,:);
    sim(nameK, [], options);
    %stairs(sprzezenie.time,sprzezenie.data,'b');
    suma = abs(sprzezenie1.data)+abs(sprzezenie2.data)+abs(sprzezenie3.data);
    t(iter) = czasRegulacji(suma)*Tp;
    pr(iter) = przeregulowanie(sprzezenie1.data,X0(1));
    sterMax(iter) = max(abs(sterowanie.data));
    iter=iter+1;
end
semilogy(pol',sterMax');
hold on;
grid on;
title(['Maksymalna wartoœæ sterowania' newline 'w zale¿noœci od po³o¿enia biegunów']);
xlabel('biegun');
legend('maksymalna wartoœæ sterowania');
filename = ['7\Max Sterowanie.svg'];
print ('-dsvg','-r600',filename);
hold off;

plot(pol',t');
hold on;
grid on;
title(['Czas regulacji' newline 'w zale¿noœci od po³o¿enia biegunów']);
xlabel('biegun');
legend('czas sterowania');
filename = ['7\czas regulacji.svg'];
print ('-dsvg','-r600',filename);
hold off;

plot(pol',pr');
hold on;
grid on;
title(['Przeregulowanie' newline 'w zale¿noœci od po³o¿enia biegunów']);
xlabel('biegun');
legend('przeregulowanie');
filename = ['7\przeregulowanie.svg'];
print ('-dsvg','-r600',filename);
hold off;



