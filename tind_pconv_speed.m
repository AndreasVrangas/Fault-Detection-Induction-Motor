
r1 = 20.57; % Stator resistance
x1 = 24; % Stator Inductive reaction
r2 = 12.75; %Rotor resistance
x2 = 20.58;% Rotor Inductive reaction
xm = 117.21;% Vertical Inductive Reaction
rc=4921.8;% Core loss resistance
v_phase_1=138; % Phase voltage
v_phase_2=415/sqrt(3);
n_sync = 1500;% synchronous speed (r/min) 
w_sync = 157.1;% synhronη speed (rad/s)
% Calculate voltage and complex Thevenin resistance
z_p=(rc*(1i*xm))/(rc+(1i*xm));
z_th=((z_p)*(r1+1i*x1))/(r1+(1i*x1)+z_p);
v_th_1=v_phase_1*(z_p/(r1+(1i*x1)+z_p)); 
r_th=real(z_th);
x_th=imag(z_th); 
% Ολίσθηση
s=(0:1:100) / 100;
s(1)=0.001;

wm= (1 - s) * w_sync; % Mechanical Speed  (rad/sec)
nm= (1-s) * n_sync; %Mechanical Speed (rpm)
 
%Calculate Induced Torque 
for ii = 1:101
t_ind(ii) = ((3*v_th_1^2)*r2/s(ii)) / ...
(w_sync *(( r_th+r2/s(ii))^2+(x_th+x2)^2)) ;
end

%Calculate convertible power
for ii = 1:101
p_conv(ii) =( t_ind(ii)*wm(ii));


end
%Plot
figure (1)
figure('Color',[1 1 1 1]);
plotyy(nm,t_ind,nm,p_conv)
xlabel ('Speed(rpm)');
legend ('Tind(N*m)' , 'Pconv(W) ','Location','Northwest');
grid on
set(gca,'Color',[1 1 1 1]);
hold off



