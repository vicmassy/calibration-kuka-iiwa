function [p,tb,tt1,tt2,tt3]=FindAllParams_Kuka(q,sigma, idealParams, Tbase,Ttool1,Ttool2,Ttool3, M1, M2, M3)

j=1;
Tbased = eye(4);
Ttool1d =eye(4);
Ttool2d = eye(4);
Ttool3d = eye(4);
paramsDelta=zeros(23,1);
acctemp = 0;
acc = 0;
% two step algorithm
    % calculate distance
    
while 1
    
for i=1:size(q,1)
    M1i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta ,0,Tbase,Ttool1);
    M2i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta,0,Tbase,Ttool2);
    M3i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta ,0,Tbase,Ttool3);
    M1dist(:,:,i) = M1(:,:,i) - M1i(:,:,i);
    M2dist(:,:,i) = M2(:,:,i) - M2i(:,:,i);
    M3dist(:,:,i) = M3(:,:,i) - M3i(:,:,i);
    deltaDist(:,:,i)=[M1dist(1:3,4,i) M2dist(1:3,4,i) M3dist(1:3,4,i)];
end


    % 1st step find Tbase and Ttools
    B = FindBase_Kuka(q, idealParams + paramsDelta, deltaDist);
    pbase = B(1:3);
    phibase = B(4:6);
    rbase = [0 -phibase(3) phibase(2) ; phibase(3) 0 -phibase(1) ; -phibase(2) phibase(1) 0 ] + eye(3);
    Tbased = [rbase pbase; 0 0 0 1];
    Ttool1d = [eye(3) rbase'*B(7:9); 0 0 0 1];
    Ttool2d = [eye(3) rbase'*B(10:12); 0 0 0 1];
    Ttool3d = [eye(3) rbase'*B(13:15); 0 0 0 1];
    
    % recalculate distance with new Tbase and Ttools
    for i=1:size(q,1)
        M1i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta ,0,Tbase*Tbased,Ttool1*Ttool1d);
        M2i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta,0,Tbase*Tbased,Ttool2*Ttool2d);
        M3i(:,:,i) = RobotModelFK_Kuka(q(i,:),idealParams + paramsDelta ,0,Tbase*Tbased,Ttool3*Ttool3d);
        M1dist(:,:,i) = M1(:,:,i) - M1i(:,:,i);
        M2dist(:,:,i) = M2(:,:,i) - M2i(:,:,i);
        M3dist(:,:,i) = M3(:,:,i) - M3i(:,:,i);
        deltaDist(:,:,i) = [M1dist(1:3,4,i) M2dist(1:3,4,i) M3dist(1:3,4,i)];
        n(i) = mean([norm(deltaDist(:,1,i)) norm(deltaDist(:,2,i)) norm(deltaDist(:,3,i))]);
    end
    
    

     % mean error distance
    acctemp = acc;
    acc = mean(n);
    j = j+1;
    if (j> 1000)||(abs(acctemp-acc)<1e-4)
        disp(abs(acctemp-acc))
        break;
    end
   
    % 2st step find robot parameters
    paramsDelta = paramsDelta + FindParams_Kuka(q, idealParams, deltaDist, Tbase*Tbased,Ttool1*Ttool1d,Ttool2*Ttool2d,Ttool3*Ttool3d);
    
    
end
p = paramsDelta;
tb = Tbase*Tbased;
tt1=Ttool1*Ttool1d;
tt2=Ttool2*Ttool2d;
tt3=Ttool3*Ttool3d;

end