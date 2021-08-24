function Gc = Bode_lead(K,phi_m,omega_m)

  if  phi_m>0 && phi_m<70 
phi_m=phi_m*pi/180;     %Âàrad
alpha=(1+sin(phi_m))/(1-sin(phi_m));
p=omega_m*alpha^0.5;
z=p/alpha;
Gc=K*alpha*tf([1 z],[1 p]);
  else
 error( 'phi_m is too large')
  end 
end

