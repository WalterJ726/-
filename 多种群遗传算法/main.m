%% ��MPGA��ͼ
time = 1;
figure(1);
while time <= 5
time = time + 1;
[gen Yy] = MPGA();
plot(1:gen,Yy)
hold on;
grid on;
xlabel('��������')
ylabel('���Ž�仯')
title('MPGA��������')
xlim([1,gen])
end
hold off;
legend({'1','2','3','4','5'})
saveas(gcf,char("MPGA����ͼ�Ƚ�"), 'jpg');

clear all;
clc;
%% ��SGA��ͼ
time = 1;
figure(2);
while time <= 5
time = time + 1;
[gen Yy] = SGA();
plot(1:gen,Yy);

legend(string(time));
% legend(char(time));
% ansX= [ansX; Xx];
% ansY = [ansY;Yy];
hold on;
grid on;
xlabel('��������')
ylabel('���Ž�仯')
title('SGA��������')
xlim([1,gen])
end
hold off;
legend({'1','2','3','4','5'})
saveas(gcf,char("SGA����ͼ�Ƚ�"), 'jpg');