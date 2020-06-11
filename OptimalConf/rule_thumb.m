clear all, clc

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
confs = subs(confs, [alpha1 alpha2 alpha3 alpha4], [0 0 0 0]);        
confs2 = subs(confs, [epsilon1 epsilon2 beta1 beta2 ksi gamma phi delta],[-90 -90 -90 -130 -110 -160 -110 -170]);
confs2 = wrapTo180(confs2);

sine = 0;
cosine = 0;
disp(confs2)
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
        disp(cosine);
        disp(sine);
        cosine = 0; 
        sine = 0;
    end
end