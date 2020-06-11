function out=Traj2Points_Kuka(trajq,param, base)
traj = [];
for i=1:size(trajq,1)-1
trajtmp = [linspace(trajq(i,1),trajq(i+1,1))' ...
    linspace(trajq(i,2),trajq(i+1,2))' linspace(trajq(i,3),trajq(i+1,3))' ...
    linspace(trajq(i,4),trajq(i+1,4))' linspace(trajq(i,5),trajq(i+1,5))' ...
    linspace(trajq(i,6),trajq(i+1,6))' linspace(trajq(i,7),trajq(i+1,7))'];
traj = [traj;trajtmp];
end
for i=1:size(traj,1)
    M(:,:,i) = RobotModelFK_Kuka(traj(i,:),param,0,base,eye(4));
    p(:,i)=M(1:3,4,i);
end
out = p;
end

