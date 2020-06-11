% confs = subs(confs, [beta1 gamma delta epsilon1 epsilon2 ksi phi  beta2],...
%                        [-60    60    -60    -60      120    60  -60    120]);
%function find_angles
clc, clear all;

syms alpha1 alpha2 alpha3 alpha4 epsilon1 epsilon2 beta1 beta2 ksi gamma 
syms phi delta

confs = [alpha1 epsilon1 beta1 ksi gamma phi delta;
        alpha1 epsilon1+180 beta1 ksi gamma phi+180 delta;
        alpha1 epsilon2 beta1 ksi+180 gamma phi+epsilon1-epsilon2 delta;
        alpha1 epsilon2+180 beta1 ksi+180 gamma phi+epsilon1-epsilon2+180 delta;
        alpha2 epsilon1 beta1+180 ksi gamma phi delta+180;
        alpha2 epsilon1+180 beta1+180 ksi gamma phi+180 delta+180;
        alpha2 epsilon2 beta1+180 ksi+180 gamma phi+epsilon1-epsilon2 delta+180;
        alpha2 epsilon2+180 beta1+180 ksi+180 gamma phi+epsilon1-epsilon2+180 delta+180;
        alpha3 epsilon1 beta2 ksi gamma+180 phi delta+beta1-beta2;
        alpha3 epsilon1+180 beta2 ksi gamma+180 phi+180 delta+beta1-beta2;
        alpha3 epsilon2 beta2 ksi+180 gamma+180 phi+epsilon1-epsilon2 delta+beta1-beta2;
        alpha3 epsilon2+180 beta2 ksi+180 gamma+180 phi+epsilon1-epsilon2+180 delta+beta1-beta2;
        alpha4 epsilon1 beta2+180 ksi gamma+180 phi delta+beta1-beta2+180;
        alpha4 epsilon1+180 beta2+180 ksi gamma+180 phi+180 delta+beta1-beta2+180;
        alpha4 epsilon2 beta2+180 ksi+180 gamma+180 phi+epsilon1-epsilon2 delta+beta1-beta2+180;
        alpha4 epsilon2+180 beta2+180 ksi+180 gamma+180 phi+epsilon1-epsilon2+180 delta+beta1-beta2+180];

n = 7;
m = 16;
step = 10;
optimal = [];
above = [];
confs = subs(confs, [alpha1 alpha2 alpha3 alpha4], [0 0 0 0]);

for f = -170:step:170
    if f >= -165 && f <= 165 && wrapTo180(f+180) >= -165 && wrapTo180(f+180) <= 165
        for c = -90:step:170
            if c >= -165 && c <= 165 && wrapTo180(c+180) >= -165 && wrapTo180(c+180) <= 165
                for d = -170:step:170
                    if d >= -165 && d <= 165 && wrapTo180(d+180) >= -165 && wrapTo180(d+180) <= 165                                                   
                        for a = -120:step:120
                            if a >= -115 && a <= 115 && wrapTo180(a+180) >= -115 && wrapTo180(a+180) <= 115
                                for b = -120:step:120
                                    if b >= -115 && b <= 115 && wrapTo180(b+180) >= -115 && wrapTo180(b+180) <= 115
                                        for e = -120:step:120
                                            if e >= -115 && e <= 115 && wrapTo180(e+180) >= -115 && wrapTo180(e+180) <= 115
                                                g = 0; h = 0;
                                                confs2 = subs(confs, [epsilon1 epsilon2 beta1 beta2 ksi gamma phi delta],[a b c d e f g h]);
                                                confs2 = wrapTo180(confs2);                                                            
                                                disp([a,b,c,d,e,f,g,h])
                                                stop = 0;
                                                for con = 1:16
                                                   T = FK_KukaProject(deg2rad(confs2(con, :)));
                                                   if T(3, 4) < 10
                                                       stop = 1;
                                                       break
                                                   end
                                                end                                                             
                                                if stop == 0
                                                    op = 0;
                                                    above = [above;[a b c d e f g h]];
                                                    for g = -120:step:120
                                                        if g >= -115 && g <= 115 && wrapTo180(g+180) >= -115 && wrapTo180(g+180) <= 115 && wrapTo180(g+a-b) >= -115 && wrapTo180(g+a-b) <= 115 && wrapTo180(g+a-b+180) >= -115 && wrapTo180(g+a-b+180) <= 115                                                        
                                                            for h = -170:step:170                       
                                                                if h >= -170 && h <= 170 && wrapTo180(h+180) >= -170 && wrapTo180(h+180) <= 170 && wrapTo180(h+c-d) >= -170 && wrapTo180(h+c-d) <= 170 && wrapTo180(h+c-d+180) >= -170 && wrapTo180(h+c-d+180) <= 170                                                                                                                                           
                                                                    confs2 = subs(confs, [epsilon1 epsilon2 beta1 beta2 ksi gamma phi delta],[a b c d e f g h]);
                                                                    confs2 = wrapTo180(confs2);
                                                                    sine = 0;
                                                                    cosine = 0;
                                                                    klimchick = 0;
                                                                    for i = 2:n
                                                                        for j = 1:i-1
                                                                            for k = 1:m
                                                                                C = 0;
                                                                                for s=1:i
                                                                                    C = C + deg2rad(confs2(k,s));
                                                                                end
                                                                                for s=1:j
                                                                                    C = C - deg2rad(confs2(k, s));
                                                                                end
                                                                                cosine = cosine + cos(C);
                                                                                sine = sine + sin(C);
                                                                            end
                                                                            if sine ~= 0 || cosine ~= 0
                                                                                klimchick = 1;                                         
                                                                                break;
                                                                            end                                   
                                                                        end
                                                                        if klimchick == 1
                                                                            break;
                                                                        end
                                                                    end
                                                                    if klimchick == 0                                 
                                                                        disp("COOL IT WORKS")
                                                                        disp(confs2)
                                                                        optimal = [optimal;[a b c d e f g h]];
                                                                        op = 1;
                                                                        break;
                                                                    end
                                                                end
                                                                if op == 1
                                                                    break;
                                                                end
                                                            end
                                                        end
                                                        if op == 1
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
%end