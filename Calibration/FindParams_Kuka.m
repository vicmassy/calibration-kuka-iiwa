function out = FindParams_Kuka(q, params, deltaDist, Tbase,Ttool1,Ttool2,Ttool3)
J1 = zeros(23,23);
J2 = zeros(23,1);
for i=1:size(q,1)
J1=J1 + Jparams_Kuka(q(i,:),params,Tbase,Ttool1)'*Jparams_Kuka(q(i,:),params,Tbase,Ttool1)+...
    Jparams_Kuka(q(i,:),params,Tbase,Ttool2)'*Jparams_Kuka(q(i,:),params,Tbase,Ttool2)+...
    Jparams_Kuka(q(i,:),params,Tbase,Ttool3)'*Jparams_Kuka(q(i,:),params,Tbase,Ttool3);

J2=J2 + Jparams_Kuka(q(i,:),params,Tbase,Ttool1)'*deltaDist(:,1,i)+...
    Jparams_Kuka(q(i,:),params,Tbase,Ttool2)'*deltaDist(:,2,i)+...
    Jparams_Kuka(q(i,:),params,Tbase,Ttool3)'*deltaDist(:,3,i);
end
out = J1\J2;
end