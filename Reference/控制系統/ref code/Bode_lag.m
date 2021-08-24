function Gc = Bode_lag(K,omega_c,attenuation_db)
% Gc=K*(p/z)*(s+z)/(s+p)
z=omega_c/10;
alpha=10^(attenuation_db/20);
p=z/alpha;
Gc=K*p/z*tf([1 z],[1 p]);

end

