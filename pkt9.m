initial_values;
a11=A2(1,1);
a21=A2(2,1);
a31=A2(3,1);
A22=[A2(2,2),A2(2,3);A2(3,2),A2(3,3)];
A12=[A2(1,2),A2(1,3)];
b1 = B2(1);
b2 = B2(2);
b3 = B2(3);

X0 = [8 2 -1];

K=acker(A2,B2,[0.25,0.25,0.25]);


nameO = 'model_z_obserwatorem';
options = simset('SrcWorkspace','current');


for zo=-0.8:0.2:0.8
    L = acker(A22',A12',[zo,zo]);
    l1 = L(1);
    l2 = L(2);
    sim(nameO, [], options);
    subplot(1,2,1);
    stairs(x2.time,x2.data,'g');
    hold on;
    stairs(w1.time,w1.data,'r');
    xlabel('t');
    ylabel('x2');
    legend('x2','w1');
    title(['Dzia³anie obserwatora x2 bieguna równego ',num2str(zo)]);
    hold off;
    subplot(1,2,2);
    stairs(x3.time,x3.data,'g');
    hold on;
    stairs(w2.time,w2.data,'r');
    xlabel('t');
    ylabel('x3');
    legend('x3','w2');
    title(['Dzia³anie obserwatora x3 dla bieguna równego ',num2str(zo)]);
    hold off;
    filename = ['9\l=',num2str(zo),'.svg'];
    print ('-dsvg','-r600',filename);
end