load('simulate_5D_GA_3.mat')
i = 1:50;
T_part5 = trace(1,:);
T_part6 = trace(2,:);
T_part7 = trace(3,:);
T_part9 = trace(4,:);
T_part10 = trace(5,:);
S = trace(6,:);

figure(1);
% subplot(2,3,1);
plot(i,T_part5);
title('С����1-5��������')
xlabel('��������');ylabel('���Ž�仯');
filename = "С����1-5" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');


figure(2);
plot(i,T_part6);
title('С����6��������')
xlabel('��������');ylabel('���Ž�仯');
filename = "С����6" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');


figure(3);
plot(i,T_part7);
title('С����7��������')
xlabel('��������');ylabel('���Ž�仯');
filename = "С����7" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');

figure(4);
% subplot(2,3,4);
plot(i,T_part9);
title('С����8-9��������')
xlabel('��������');ylabel('���Ž�仯');
filename = "С����8-9" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');

figure(5);
% subplot(2,3,5);
plot(i,T_part10);
title('�ٶȽ�������')
xlabel('��������');ylabel('���Ž�仯');
filename = "�ٶ�" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');

figure(6);
% subplot(2,3,6);
plot(i,S);
title('�����������')
xlabel('��������');ylabel('���Ž�仯');
filename = "���" + "��������ͼ";
saveas(gcf,char(filename), 'jpg');

figure(2);
plot(i, S);
title('�����������')
xlabel('��������');ylabel('���Ž�仯');
saveas(gcf,'��������ͼ', 'jpg');
