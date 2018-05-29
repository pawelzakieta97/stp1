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


nameO = 'porownanie_bezp_obserw';
options = simset('SrcWorkspace','current');


for zo=-0.8:0.2:0.8
    L = acker(A22',A12',[zo,zo]);
    l1 = L(1);
    l2 = L(2);
    
    K=acker(A2,B2,[0.25,0.25,0.25]);
    sim(nameO, [], options);
    subplot(1,2,1);
    stairs(mierzona.time,mierzona.data,'g');
    hold on;
    title(['Wszytkie bieguny regulatora równe 0,25',newline,'bieguny obserwatora równe ',num2str(zo)]);
    stairs(obserwowana.time,obserwowana.data,'r');
    xlabel('t');
    ylabel('y');
    legend('wyjœcie dla stanu mierzonego','wyjœcie dla stanu obserwowanego');
    hold off;
    
    K=acker(A2,B2,[0.25,0.2+0.1i,-0.1i]);
    sim(nameO, [], options);
    subplot(1,2,2);
    stairs(uMierz.time,uMierz.data,'g');
    hold on;
    title(['Bieguny regulatora równe 0,25; 0,2+0,1i; 0,2=0,1i ',newline,'bieguny obserwatora równe ',num2str(zo)]);
    stairs(uObs.time,uObs.data,'r');
    xlabel('t');
    ylabel('y');
    legend('sterowanie dla stanu mierzonego','sterowanie dla stanu obserwowanego');
    hold off;
    
    
    filename = ['10\l=',num2str(zo),'.svg'];
    print ('-dsvg','-r600',filename);
end