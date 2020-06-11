function out = Jparams_Kuka(q,params,Tbase,Ttool)

Htx = [0 0 0 1;
    0 0 0 0; 
    0 0 0 0;
    0 0 0 0];
Hty = [0 0 0 0;
    0 0 0 1;
    0 0 0 0; 
    0 0 0 0];
Htz = [0 0 0 0;
    0 0 0 0;
    0 0 0 1;
    0 0 0 0];
Hrx = [0 0 0 0;
    0 0 -1 0;
    0 1 0 0;
    0 0 0 0];
Hry = [0 0 1 0;
    0 0 0 0;
    -1 0 0 0;
    0 0 0 0];
Hrz = [0 -1 0 0;
    1 0 0 0;
    0 0 0 0; 
    0 0 0 0];

Td = Tbase*Rz(q(1))*Htx*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J1 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Hty*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J2 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Hry*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J3 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Hrx*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J4 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Hty*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J5 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Htz*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J6 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Hry*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J7 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Hrz*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J8 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Htx*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J9 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Hty*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J10 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Hry*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J11 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))*Hrx* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J12 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))*Hty* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J13 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Htz*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J14 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Hry*Rz(q(5))*Rx(q(6))*Rz(q(7))*Ttool;
J15 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Hrz*Rx(q(6))*Rz(q(7))*Ttool;
J16 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Htx*Rx(q(6))*Rz(q(7))*Ttool;
J17 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Hty*Rx(q(6))*Rz(q(7))*Ttool;
J18 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Hry*Rx(q(6))*Rz(q(7))*Ttool;
J19 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Hrx*Rz(q(7))*Ttool;
J20 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Hty*Rz(q(7))*Ttool;
J21 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Htz*Rz(q(7))*Ttool;
J22 = [Td(1,4), Td(2,4), Td(3,4)]';

Td = Tbase*Rz(q(1))*Rx(q(2))*Tz(params(6))*Rz(q(3))*Rx(q(4))* ...
Tz(params(14))*Rz(q(5))*Rx(q(6))*Hry*Rz(q(7))*Ttool;
J23 = [Td(1,4), Td(2,4), Td(3,4)]';

out = [J1 J2 J3 J4 J5 J6 J7 J8 J9 J10 J11 J12 J13 J14 J15 J16 J17 J18 J19 J20 J21 J22 J23];
end