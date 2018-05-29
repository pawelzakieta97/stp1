semilogy(pol',sterMax','r');
hold on;
grid on;
title(['maksymalna wartoœæ sterowania' newline 'w zale¿noœci od po³o¿enia biegunów']);
xlabel('biegun');
legend('maksymalna wartoœæ sterowania');
print ('-dsvg','-r600','6-wartoœæ sterowania');
hold off;

plot(pol',t','r');
hold on;
grid on;
title(['czas regulacji' newline 'w zale¿noœci od po³o¿enia biegunów']);
xlabel('biegun');
legend('czas ustabilizowania siê sygna³u');
print ('-dsvg','-r600','6-czas ergulacji');
hold off;