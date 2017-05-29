
r1 = 20.57; % Ωμική Αντίσταση Στάτη
x1 = 24; % Αντίδραση Στάτη
r2 = 12.75; % Ωμική Αντίσταση Δρομέα
x2 = 20.58;% Αντίδραση Δρομέα
xm = 117.21;% Αντίδραση Εγκάρσιου Κλάδου
rc=4921.8;% Αντίσταση Απωλειών Πυρήνα
v_phase_1=138; % Φασική Τάση
v_phase_2=415/sqrt(3);
n_sync = 1500;% Σύγχρονη Ταχύτητα (r/min) 
w_sync = 157.1;% Σύγχρονη Ταχύτητα (rad/s)
% Υπολογισμός τάσης και μιγαδικής αντίστασης Thevenin
z_p=(rc*(1i*xm))/(rc+(1i*xm));
z_th=((z_p)*(r1+1i*x1))/(r1+(1i*x1)+z_p);
v_th_1=v_phase_1*(z_p/(r1+(1i*x1)+z_p)); 
r_th=real(z_th);
x_th=imag(z_th); 
% Ολίσθηση
s=(0:1:100) / 100;
s(1)=0.001;

wm= (1 - s) * w_sync; % Μηχανική Ταχύτητα  (rad/sec)
nm= (1-s) * n_sync; %Μηχανική Ταχύτητα (rpm)
 
%Υπολογισμός Επαγόμενης Ροπής 
for ii = 1:101
t_ind(ii) = ((3*v_th_1^2)*r2/s(ii)) / ...
(w_sync *(( r_th+r2/s(ii))^2+(x_th+x2)^2)) ;
end

%Υπολογισμός Μετατρεπόμενης Ισχύος
for ii = 1:101
p_conv(ii) =( t_ind(ii)*wm(ii));


end
figure (1)
figure('Color',[1 1 1 1]);
plotyy(nm,t_ind,nm,p_conv);%%Εντολή για κυματομορφή με δύο κάθετους άξονες (y'y)
xlabel ('Speed(rpm)');
legend ('Tind(N*m)' , 'Pconv(W) ','Location','Northwest');
grid on
set(gca,'Color',[1 1 1 1]);
hold off



