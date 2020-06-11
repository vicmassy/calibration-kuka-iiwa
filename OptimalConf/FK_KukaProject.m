function T = FK_KukaProject(q)
Tbase = [1 0 0 0; 0 1 0 0; 0 0 1 360; 0 0 0 1];
T = Tbase*Rz(q(1))*Ry(q(2))*Tz(420)*Rz(q(3))*Ry(-q(4))*Tz(400)*...
    Rz(q(5))*Ry(q(6))*Tz(126)*Rz(q(7));
end
