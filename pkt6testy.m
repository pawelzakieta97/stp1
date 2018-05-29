semilogy(pol',sterMax','r');
hold on;
grid on;
title(['maksymalna warto�� sterowania' newline 'w zale�no�ci od po�o�enia biegun�w']);
xlabel('biegun');
legend('maksymalna warto�� sterowania');
print ('-dsvg','-r600','6-warto�� sterowania');
hold off;

plot(pol',t','r');
hold on;
grid on;
title(['czas regulacji' newline 'w zale�no�ci od po�o�enia biegun�w']);
xlabel('biegun');
legend('czas ustabilizowania si� sygna�u');
print ('-dsvg','-r600','6-czas ergulacji');
hold off;