function out = FindBase_Kuka(q, params, deltaDist)

T1 = zeros(15,15);
T2 = zeros(15,1);

for i=1:size(q,1)
    Tr(:,:,i) = RobotModelFK_Kuka(q(i,:),params,0,eye(4),eye(4));
end
pr= Tr(1:3,4,:);
rr= Tr(1:3,1:3,:);

for i=1:size(q,1)
    skew = [0 -pr(3,:,i) pr(2,:,i) ; pr(3,:,i) 0 -pr(1,:,i) ; -pr(2,:,i) pr(1,:,i) 0 ];   
    A(:,:,i) = [eye(3) skew' rr(:,:,i) zeros(3) zeros(3);
        eye(3) skew'  zeros(3) rr(:,:,i) zeros(3);
        eye(3) skew'  zeros(3) zeros(3) rr(:,:,i);];
    T1=T1 + A(:,:,i)'*A(:,:,i);
    T2=T2 + A(:,:,i)'*[deltaDist(:,1,i);deltaDist(:,2,i);deltaDist(:,3,i)];
end
out = T1\T2;
end

