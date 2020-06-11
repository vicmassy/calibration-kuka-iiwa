% Homework 2
clear all;
close all;
clc;

% set initial data
% joints limits
upLimit=[170 120 170 120 170 120 175].*pi/180;
lowLimit=[170 120 170 120 170 120 175].*-pi/180;
% ideal parameters / measured parameters
idealParams = [0 0 0 0 0 420 0 0 0 0 0 0 0 400 0 0 0 0 0 0 0 0 0]';
% real parameters
realParams = [(rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 ...
    (rand*2-1)/100 (rand*2-1)/100 420+(rand*10-5) (rand*2-1)/100 ... 
    (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 ...
    (rand*2-1)/100 (rand*2-1)/100 400+(rand*10-5) (rand*2-1)/100 ...
    (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 ...
    (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100 (rand*2-1)/100]';

% real base and tools transformation matrices
TbaseR = [1 0 0 0; 0 1 0 0; 0 0 1 360+(rand*10-5); 0 0 0 1];
Ttool1R= Tz(90-0.3056);
Ttool2R= Rx(2*pi/3)*Tz(90-0.5056)*Rx(-2*pi/3);
Ttool3R= Rx(-2*pi/3)*Tz(90+0.8625)*Rx(2*pi/3);

% ideal base and tools transformation matrices
Tbase = [1 0 0 0; 0 1 0 0; 0 0 1 360; 0 0 0 1];
Ttool1 = Tz(90);
Ttool2 = Rx(2*pi/3)*Tz(90)*Rx(-2*pi/3);
Ttool3 = Rx(-2*pi/3)*Tz(90)*Rx(2*pi/3);

qNum = 16;
q = [];
B=zeros(15,1);
% noise
sigma = 50*1e-3;

% use random configurations
q = RandomConfig_Kuka(qNum, lowLimit, upLimit);
[p,tb,tt1,tt2,tt3] = executeConfig(q, idealParams, realParams, sigma, Tbase,Ttool1,Ttool2,Ttool3, TbaseR, Ttool1R, Ttool2R, Ttool3R);

% use optimal configurations
q_op = OptimalConfig_Kuka();
[p_op,tb_op,tt1_op,tt2_op,tt3_op] = executeConfig(q_op, idealParams, realParams, sigma, Tbase,Ttool1,Ttool2,Ttool3, TbaseR, Ttool1R, Ttool2R, Ttool3R);


% % trajectories


traj2q = [-21.22 9.5 0 -54.58 41.61 33.03 -36.67;
          37.26 25.81 0 -27.26 -51.7 50.49 38.85;
          4.92 16.69 0 -118.71 6.89 -45.61 -4.83;
          -21.22 9.5 0 -54.58 41.61 33.03 -36.67].*pi/180;
      
traj1q = [90 0 0 90 -90 90 0;
  90 0 0 0 -90 90 0;
  90 45 0 -90 -90 90 0;
  90 0 0 90 -90 90 0].*pi/180;
      
traj3q = [0.7854 1.9721 0.0096 0 -0.0096 -1.8223 -0.7854;
        0.7854 -1.9271 0.0096 0 -0.0096 1.8223 -0.7854;
        0 1.8281 0 0 0 -1.6314 0;
        0.7854 1.9721 0.0096 0 -0.0096 -1.8223 -0.7854];

% show trajectories with and without calibration
tr1=Traj2Points_Kuka(traj1q,realParams, TbaseR);
tr2=Traj2Points_Kuka(traj1q,idealParams, Tbase);
tr3=Traj2Points_Kuka(traj1q,idealParams+p, tb);
tr4=Traj2Points_Kuka(traj1q,idealParams+p_op, tb_op);
figure()
hold on
grid on
plot3(tr1(1,:), tr1(2,:), tr1(3,:), 'Color','blue')
plot3(tr2(1,:), tr2(2,:), tr2(3,:), 'Color', 'black')
plot3(tr3(1,:), tr3(2,:), tr3(3,:), 'Color', 'red')
plot3(tr4(1,:), tr4(2,:), tr4(3,:), 'Color', 'green')
legend('target trajectory','without calibration', 'with calibration','Optimal')
view(3)
% tr1=Traj2Points_Kuka(traj2q,realParams, TbaseR);
% tr2=Traj2Points_Kuka(traj2q,idealParams, Tbase);
% tr3=Traj2Points_Kuka(traj2q,idealParams+p, tb);
% figure()
% hold on
% grid on
% plot3(tr1(1,:), tr1(2,:), tr1(3,:))
% plot3(tr2(1,:), tr2(2,:), tr2(3,:))
% plot3(tr3(1,:), tr3(2,:), tr3(3,:))
% legend('target trajectory','without calibration','with calibration')
% view(3)
% tr1=Traj2Points_Kuka(traj3q,realParams, TbaseR);
% tr2=Traj2Points_Kuka(traj3q,idealParams, Tbase);
% tr3=Traj2Points_Kuka(traj3q,idealParams+p, tb);
% figure()
% hold on
% grid on
% plot3(tr1(1,:), tr1(2,:), tr1(3,:))
% plot3(tr2(1,:), tr2(2,:), tr2(3,:))
% plot3(tr3(1,:), tr3(2,:), tr3(3,:))
% legend('target trajectory','without calibration','with calibration')
% view(3)

% q = RandomConfig_Kuka(qNum, lowLimit, upLimit);
% for i=1:size(q,1)
%         Mr(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,0,TbaseR,eye(4));
%         Mc(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams,0,Tbase,eye(4));
%         Mdist(:,:,i) = Mr(:,:,i) - Mc(:,:,i);
%         n(i)=norm(Mdist(1:3,4,i));       
% end
% disp('without calibration')
% acc = mean(n)
% for i=1:size(q,1)
%       %  Mr(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,0,TbaseR,eye(4));
%         Mc(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + p ,0,tb,eye(4));
%         Mdist(:,:,i) = Mr(:,:,i) - Mc(:,:,i);
%         n(i)=norm(Mdist(1:3,4,i));       
% end
% disp('with calibration')
% acc = mean(n)
% for i=1:size(q,1)
%        % Mr(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,0,TbaseR,eye(4));
%         Mc(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + p_op ,0,tb_op,eye(4));
%         Mdist(:,:,i) = Mr(:,:,i) - Mc(:,:,i);
%         n(i)=norm(Mdist(1:3,4,i));       
% end
% disp('with optimal calibration')
% acc = mean(n)
