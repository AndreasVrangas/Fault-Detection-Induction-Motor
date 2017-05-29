
r1 = 20.57; % ����� ��������� �����
x1 = 24; % ��������� �����
r2 = 12.75; % ����� ��������� ������
x2 = 20.58;% ��������� ������
xm = 117.21;% ��������� ��������� ������
rc=4921.8;% ��������� �������� ������
v_phase_1=138; % ������ ����
v_phase_2=415/sqrt(3);
n_sync = 1500;% �������� �������� (r/min) 
w_sync = 157.1;% �������� �������� (rad/s)
% ����������� ����� ��� ��������� ���������� Thevenin
z_p=(rc*(1i*xm))/(rc+(1i*xm));
z_th=((z_p)*(r1+1i*x1))/(r1+(1i*x1)+z_p);
v_th_1=v_phase_1*(z_p/(r1+(1i*x1)+z_p)); 
r_th=real(z_th);
x_th=imag(z_th); 
% ��������
s=(0:1:100) / 100;
s(1)=0.001;

wm= (1 - s) * w_sync; % �������� ��������  (rad/sec)
nm= (1-s) * n_sync; %�������� �������� (rpm)
 
%����������� ���������� ����� 
for ii = 1:101
t_ind(ii) = ((3*v_th_1^2)*r2/s(ii)) / ...
(w_sync *(( r_th+r2/s(ii))^2+(x_th+x2)^2)) ;
end

%����������� �������������� ������
for ii = 1:101
p_conv(ii) =( t_ind(ii)*wm(ii));


end
figure (1)
figure('Color',[1 1 1 1]);
plotyy(nm,t_ind,nm,p_conv);%%������ ��� ����������� �� ��� �������� ������ (y'y)
xlabel ('Speed(rpm)');
legend ('Tind(N*m)' , 'Pconv(W) ','Location','Northwest');
grid on
set(gca,'Color',[1 1 1 1]);
hold off



