%Anoigma tou arxeiou excel
fn='Times New Roman';fs=10; fontsize = 10;    
[d,s,r] = xlsread('1235rpm_3brb');
freq=xlsread('1235rpm_hlthy',2);

%%eisagwgi dedomenwn
Time = d(:,1);
Vph  = d(:,2);
Iph  = d(:,3);

%%orismos diakritwn simeiwn tou M/S Fourier
N=size(d,1);

%%periodos kai sixnotita deigmatolhpsias
Ts = mean(diff(Time));
Fs =1/Ts;

%%ektipwsi sto pedio tou xronou
figure(1);
plot(Time,Iph,'g');
grid on;
xlabel('Time (sec)');
ylabel('Current (A)');

%%metasximatismos fourier
FIph = fft(Iph,N)/size(d,1);
Fv = Fs/2*linspace(0,1,N/2+1);
Fi = 1:length(Fv);

saveTightFigure('Plot_1.emf');

%ektipwsi Platos revmatos (se Ambere)-Sixnotitas
figure(2);
plot(Fv,abs(FIph(Fi)),'r');
grid on;
axis([0 500  ylim]);
xlabel('Frequency (Hz)');
ylabel('Current (A)');
saveTightFigure('Plot_2.emf');

%ektipwsi se db-sixnotita
figure(3);
plot(Fv,10*log(FIph(Fi)),'r','LineWidth',0.3);hold on;
grid on;
axis([0 350 ylim]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

for i = 1:8
    
    % orio gia anixneusi gyrw apo ti sixnotita (Hz)
    range_threshold = 3;
    % proseggisi sixnotitas opou entopizetai armoniki
    freq_approx = round(freq(i));
    % ypologismos olis tis perioxis
    start= freq_approx - range_threshold;
    finish = freq_approx + range_threshold;
    freq_all = [start : 1 : finish];
    % ypologismos olwn twn entasewn gia tis epimerous sixnotites
    currents = real(10*log(FIph(freq_all+1)));
    % euresi thesis megistou current
    [~, ind] = max(currents);
    % euresi sixnotitas pou antistoixei sto megisto current
    ii = freq_all(ind);
    
    x=[ii,ii];
    y=[real(10*log(FIph(ii+1))),real(10*log(FIph(ii+1)))+35];
    plot(ii,real(10*log(FIph(ii+1))),'o','Color',[0 0 1]);
    line(x,y,'Color',[0 0 1]); hold on;
    text(ii-5,10*log(FIph(ii+1))+38,strcat('[',num2str(i),']'),'FontName',fn,'FontSize',fs-2);
end

saveTightFigure('Plot_3.emf');