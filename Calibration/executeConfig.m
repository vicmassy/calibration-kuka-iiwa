function [p,tb,tt1,tt2,tt3] = executeConfig(q, idealParams, realParams, sigma, Tbase,Ttool1,Ttool2,Ttool3, TbaseR, Ttool1R, Ttool2R, Ttool3R)
    % generate experimental data for 36 experiments (12 configurations * 3 points)
    for i=1:size(q,1)
        M1(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,sigma,TbaseR,Ttool1R);
        M2(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,sigma,TbaseR,Ttool2R);
        M3(:,:,i) = RobotModelFK_Kuka(q(i,:),realParams,sigma,TbaseR,Ttool3R);

    end

    % find tools, base and delta pi parameters
    [p,tb,tt1,tt2,tt3]=FindAllParams_Kuka(q,sigma, idealParams, Tbase,Ttool1,Ttool2,Ttool3, M1, M2, M3);
    
end