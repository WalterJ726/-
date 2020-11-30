%% �����Ŵ��㷨����
%     NIND;        %������Ŀ
%     MAXGEN;      %����Ŵ�����
%     PRECI;       %�����Ķ�����λ��
%     GGAP;      %����
%     pc;         %�������
%     pm;        %�������

cor_matrix = [
    40 25 7 0.95 0.7 0.05
    50 25 7 0.95 0.7 0.01
    40 50 7 0.95 0.7 0.01
    40 100 7 0.95 0.7 0.01
    40 200 7 0.95 0.7 0.01
    40 50 10 0.95 0.7 0.05
    40 25 10 0.95 0.6 0.05
    40 30 10 0.90 0.7 0.01
    40 30 7 0.90 0.6 0.01
    40 25 7 0.90 0.6 0.01
    ]

%% ��������
for i = 1:length(cor_matrix)
    trace = cal_trace(cor_matrix(i,1), cor_matrix(i,2),...
        cor_matrix(i,3), cor_matrix(i,4), cor_matrix(i,5), cor_matrix(i,6), i)
end

 
function trace = cal_trace(NIND, MAXGEN, PRECI, GGAP, pc, pm, order)
T_part5 = 175;
T_part6 = 195;
T_part7 = 235;
T_part9 = 255;
T_part10 = 25;

%% ��������ͼ
lbx=T_part5 - 10;ubx=T_part5 + 10; %�����Ա���x��Χ175
lby=T_part6 - 10;uby=T_part6 + 10; %�����Ա���y��Χ195
lbz=T_part7 - 10;ubz=T_part7 + 10; %�����Ա���z��Χ235
lba=T_part9 - 10;uba=T_part9 + 10;%�����Ա���a��Χ255
lbb=65;       ubb=100; %�����Ա���b�ķ�Χ65-100
trace=zeros(6,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI PRECI PRECI PRECI PRECI
    lbx lby lbz lba lbb
    ubx uby ubz uba ubb
    1 1 1 1 1
    0 0 0 0 0
    1 1 1 1 1
    1 1 1 1 1
    ];                      %����������
Chrom=crtbp(NIND,PRECI*5);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
XY=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X=XY(:,1);Y=XY(:,2);Z=XY(:,3);A=XY(:,4);B=XY(:,5);
ObjV = zeros(20,1);
a = zeros(20,1);
for i = 1:length(X)
    speed = B(i);
    temp_stove = [X(i) Y(i) Z(i) A(i)];
    S = fit(speed, temp_stove);
    ObjV(i) = S;
end

while gen<MAXGEN
    ObjVSel = [];
    FitnV=ranking(ObjV);                              %������Ӧ��ֵ
    SelCh=select('rws',Chrom,FitnV,GGAP);              %ѡ��
    SelCh=recombin('xovsp',SelCh,pc);                  %����
    SelCh=mut(SelCh,pm);                               %����
    XY=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
    X=XY(:,1);Y=XY(:,2);Z=XY(:,3);A=XY(:,4);B=XY(:,5);
    for i = 1:length(X)
        speed = B(i);
        temp_stove = [X(i) Y(i) Z(i) A(i)];
        S = fit(speed, temp_stove);
        ObjVSel = [ObjVSel; S];
    end
    %�����Ӵ���Ŀ�꺯��ֵ
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;                                             %������������
    %��ȡÿ�������Ž⼰����ţ�YΪ���Ž�,IΪ��������
    [ans,I]=min(ObjV);
    trace(1:5,gen)=XY(I,:);                       %����ÿ��������ֵ
    trace(6,gen)=ans;                               %����ÿ��������ֵ
end
%% ����ѵ������
filename = "simulate_5D_GA_" + string(order);
save(filename)
end
