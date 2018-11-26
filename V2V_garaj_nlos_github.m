clear all;
close all
clc
linestyle={'-b';'-r';'-g';'-m';'-k';'-c';'--b*';'--r*';'--g*'};

Tsym=1e-6;	%%% Symbol Rate: e.g., Tsym = 1/fsym = 1/20e6 
Ts=Tsym/1000;		%%% CppSim internal time step, also used to sample %40 Mhz = Ts > 2.5e-8  %1ns resolution, 1 Ghz of total BW,fill up to 500MHz 
nsym_short=400*1e-7/Tsym; 

FileName = '20180902_0.s2p';
SingleEndedData = read(rfdata.data, FileName);
HSon= sparameters('20180902_0.s2p');
HSoff= sparameters('20180902_1.s2p');
% HSon_1=sparameters('20180902_24.s2p'); %Osram on
% HSoff_1=sparameters('20180902_25.s2p');
% HSon_2=sparameters('20180902_26.s2p');%osram on engel
% HSoff_2=sparameters('20180902_29.s2p');
% HSon_3=sparameters('20180902_27.s2p'); %osram nlos Linea
% HSoff_3=sparameters('20180902_29.s2p');
% HSon_4=sparameters('20180902_28.s2p'); % osram nlos linea engel
% HSoff_4=sparameters('20180902_29.s2p');
% HSon_5=sparameters('20180902_10.s2p');
% HSoff_5=sparameters('20180902_11.s2p');
% HSon_6=sparameters('20180902_12.s2p');
% HSoff_6=sparameters('20180902_13.s2p');
% HSon_7=sparameters('20180902_14.s2p');
% HSoff_7=sparameters('20180902_15.s2p');
% HSon_8=sparameters('20180902_16.s2p');
% HSoff_8=sparameters('20180902_17.s2p');
% HSon_9=sparameters('20180902_18.s2p');
% HSoff_9=sparameters('20180902_19.s2p');
% HSon_10=sparameters('20180902_20.s2p');
% HSoff_10=sparameters('20180902_21.s2p');
% HSon_11=sparameters('20180902_22.s2p');
% HSoff_11=sparameters('20180902_23.s2p');
% HSon_12=sparameters('20180902_31.s2p');
% % HSoff_12=sparameters('12m_d4led_off.s2p');
% HSon_13=sparameters('20180209_36.s2p');
% HSoff_13=sparameters('20180209_37.s2p');
% HSon_14=sparameters('20180209_38.s2p');
% HSoff_14=sparameters('20180209_37.s2p');
% HSon_15=sparameters('20180902_40.s2p');
% HSoff_15=sparameters('20180902_41.s2p');
% HSon_16=sparameters('20180902_42.s2p');
% HSoff_16=sparameters('20180902_43.s2p');
% HSon_17=sparameters('20180902_45.s2p');
% HSoff_17=sparameters('20180902_46.s2p');
% HSon_18=sparameters('20180902_48.s2p');
% HSoff_18=sparameters('20180902_49.s2p');
% HSon_19=sparameters('20180902_50.s2p');
% HSoff_19=sparameters('20180902_49.s2p');
% HSon_20=sparameters('20180902_51.s2p');
% HSoff_20=sparameters('20180902_49.s2p');
% HSon_21=sparameters('20180902_52.s2p');
% HSoff_21=sparameters('20180902_49.s2p');


Freq = SingleEndedData.Freq;
Freq=Freq(1:2048); % Decide How Many Points will be used
thru_S21(1,:)= rfparam(HSon,2,1); %S21 when LED on
thru_S21=thru_S21(1:2048);
thru_S21off(1,:)=rfparam(HSoff,2,1); %S21 when LED off
thru_S21off=thru_S21off(1:2048);
thru_S21_mag=20*log10(abs(thru_S21-thru_S21off)); % Subtract the off case
% % thru_S21_mag=20*log10(abs(thru_S21));
% thru_S21_1(1,:)= rfparam(HSon_1,2,1);
% thru_S21_1=thru_S21_1(1:2048);
% thru_S21off_1(1,:)=rfparam(HSoff_1,2,1);
% thru_S21off_1=thru_S21off_1(1:2048);
% %%
% thru_S21_2(1,:)= rfparam(HSon_2,2,1);
% thru_S21_2=thru_S21_2(1:2048);
% thru_S21off_2(1,:)=rfparam(HSoff_2,2,1);
% thru_S21off_2=thru_S21off_2(1:2048);
% % %%
% thru_S21_3(1,:)= rfparam(HSon_3,2,1);
% thru_S21_3=thru_S21_3(1:2048);
% thru_S21off_3(1,:)=rfparam(HSoff_3,2,1);
% thru_S21off_3=thru_S21off_3(1:2048);
% %%
% thru_S21_4(1,:)= rfparam(HSon_4,2,1);
% thru_S21_4=thru_S21_4(1:2048);
% thru_S21off_4(1,:)=rfparam(HSoff_4,2,1);
% thru_S21off_4=thru_S21off_4(1:2048);
% %%
% thru_S21_5(1,:)= rfparam(HSon_5,2,1);
% thru_S21_5=thru_S21_5(1:2048);
% thru_S21off_5(1,:)=rfparam(HSoff_5,2,1);
% thru_S21off_5=thru_S21off_5(1:2048);
% % %
% thru_S21_6(1,:)= rfparam(HSon_6,2,1);
% thru_S21_6=thru_S21_6(1:2048);
% thru_S21off_6(1,:)=rfparam(HSoff_6,2,1);
% thru_S21off_6=thru_S21off_6(1:2048);
% % %%
% thru_S21_7(1,:)= rfparam(HSon_7,2,1);
% thru_S21_7=thru_S21_7(1:2048);
% thru_S21off_7(1,:)=rfparam(HSoff_7,2,1);
% thru_S21off_7=thru_S21off_7(1:2048);
% %%
% thru_S21_8(1,:)= rfparam(HSon_8,2,1);
% thru_S21_8=thru_S21_8(1:2048);
% thru_S21off_8(1,:)=rfparam(HSoff_8,2,1);
% thru_S21off_8=thru_S21off_8(1:2048);
% % % % %
% thru_S21_9(1,:)= rfparam(HSon_9,2,1);
% thru_S21_9=thru_S21_9(1:2048);
% thru_S21off_9(1,:)=rfparam(HSoff_9,2,1);
% thru_S21off_9=thru_S21off_9(1:2048);
% % % % %%
% thru_S21_10(1,:)= rfparam(HSon_10,2,1);  %12m 4 led tx down
% thru_S21_10=thru_S21_10(1:2048);
% thru_S21off_10(1,:)=rfparam(HSoff_10,2,1);
% thru_S21off_10=thru_S21off_10(1:2048);
% % %%
% thru_S21_11(1,:)= rfparam(HSon_11,2,1); %12m 1 led tx down
% thru_S21_11=thru_S21_11(1:2048);
% thru_S21off_11(1,:)=rfparam(HSoff_11,2,1);
% thru_S21off_11=thru_S21off_11(1:2048);
% % % %%
% thru_S21_12(1,:)= rfparam(HSon_12,2,1);
% thru_S21_12=thru_S21_12(1:2048);
% % thru_S21off_12(1,:)=rfparam(HSoff_12,2,1);
% % thru_S21off_12=thru_S21off_12(1:2048);
% % % %%
% thru_S21_13(1,:)= rfparam(HSon_13,2,1);
% thru_S21_13=thru_S21_13(1:2048);
% thru_S21off_13(1,:)=rfparam(HSoff_13,2,1);
% thru_S21off_13=thru_S21off_13(1:2048);
% % %%
% thru_S21_14(1,:)= rfparam(HSon_14,2,1);
% thru_S21_14=thru_S21_14(1:2048);
% thru_S21off_14(1,:)=rfparam(HSoff_14,2,1);
% thru_S21off_14=thru_S21off_14(1:2048);
% % % %%
% thru_S21_15(1,:)= rfparam(HSon_15,2,1);
% thru_S21_15=thru_S21_15(1:2048);
% thru_S21off_15(1,:)=rfparam(HSoff_15,2,1);
% thru_S21off_15=thru_S21off_15(1:2048);
% % %%
% thru_S21_16(1,:)= rfparam(HSon_16,2,1);
% thru_S21_16=thru_S21_16(1:2048);
% thru_S21off_16(1,:)=rfparam(HSoff_16,2,1);
% thru_S21off_16=thru_S21off_16(1:2048);
% % %
% thru_S21_17(1,:)= rfparam(HSon_17,2,1);
% thru_S21_17=thru_S21_17(1:2048);
% thru_S21off_17(1,:)=rfparam(HSoff_17,2,1);
% thru_S21off_17=thru_S21off_17(1:2048);
% % %%
% thru_S21_18(1,:)= rfparam(HSon_18,2,1);
% thru_S21_18=thru_S21_18(1:2048);
% thru_S21off_18(1,:)=rfparam(HSoff_18,2,1);
% thru_S21off_18=thru_S21off_18(1:2048);
% %%
% thru_S21_19(1,:)= rfparam(HSon_19,2,1);
% thru_S21_19=thru_S21_19(1:2048);
% thru_S21off_19(1,:)=rfparam(HSoff_19,2,1);
% thru_S21off_19=thru_S21off_19(1:2048);
% % %%
% thru_S21_20(1,:)= rfparam(HSon_20,2,1);
% thru_S21_20=thru_S21_20(1:2048);
% thru_S21off_20(1,:)=rfparam(HSoff_20,2,1);
% thru_S21off_20=thru_S21off_20(1:2048);
% % %%
% thru_S21_21(1,:)= rfparam(HSon_21,2,1);
% thru_S21_21=thru_S21_21(1:2048);
% thru_S21off_21(1,:)=rfparam(HSoff_21,2,1);
% thru_S21off_21=thru_S21off_21(1:2048);
% %%
% thru_S21_22(1,:)= rfparam(HSon_22,2,1);
% thru_S21_22=thru_S21_22(1:2048);
% thru_S21off_22(1,:)=rfparam(HSoff_22,2,1);
% thru_S21off_22=thru_S21off_22(1:2048);
% %%
% thru_S21_23(1,:)= rfparam(HSon_23,2,1);
% thru_S21_23=thru_S21_23(1:2048);
% thru_S21off_23(1,:)=rfparam(HSoff_23,2,1);
% thru_S21off_23=thru_S21off_23(1:2048);
% %%
% thru_S21_24(1,:)= rfparam(HSon_24,2,1);
% thru_S21_24=thru_S21_24(1:2048);
% thru_S21off_24(1,:)=rfparam(HSoff_24,2,1);
% thru_S21off_24=thru_S21off_24(1:2048);

figure; hold on;
plot(Freq,thru_S21_mag,char(linestyle(1)));
grid on;

%%% Thru Channel %%%
H21=thru_S21-thru_S21off;
% H21_1=thru_S21_1-thru_S21off_1;
% H21_2=thru_S21_2-thru_S21off_2;
% H21_3=thru_S21_3-thru_S21off_3;
% H21_4=thru_S21_4-thru_S21off_4;
% H21_5=thru_S21_5-thru_S21off_5;
% H21_6=thru_S21_6-thru_S21off_6;
% H21_7=thru_S21_7-thru_S21off_7;
% H21_8=thru_S21_8-thru_S21off_8;
% H21_9=thru_S21_9-thru_S21off_9;
% H21_10=thru_S21_10-thru_S21off_10;
% H21_11=thru_S21_11-thru_S21off_11;
% H21_12=thru_S21_12-thru_S21off_12;
% H21_13=thru_S21_13-thru_S21off_13;
% H21_14=thru_S21_14-thru_S21off_14;
% H21_15=thru_S21_15-thru_S21off_15;
% H21_16=thru_S21_16-thru_S21off_16;
% H21_17=thru_S21_17-thru_S21off_17;
% H21_18=thru_S21_18-thru_S21off_18;
% H21_19=thru_S21_19-thru_S21off_19;
% H21_20=thru_S21_20-thru_S21off_20;
% H21_21=thru_S21_21-thru_S21off_21;
% % H21_8=thru_S21_22-thru_S21off_22;
% % H21_8=thru_S21_23-thru_S21off_23;
% % H21_8=thru_S21_24-thru_S21off_24;

%%Windowing

% n = size(H21,2);
% wk = hamming(n,'symmetric')'; 
% H21W = wk.*H21;
% H21W_1 = wk.*H21_1;
% H21W_2 = wk.*H21_2;
% H21W_3 = wk.*H21_3;
% H21W_4 = wk.*H21_4;
% H21W_5 = wk.*H21_5;
% H21W_6 = wk.*H21_6;
% H21W_7 = wk.*H21_7;
% H21W_8 = wk.*H21_8;
% H21W_9 = wk.*H21_9;
% %%

imp=cir_converter(Freq',H21,Ts,Tsym); % Produces impulse response
% imp_1=cir_converter(Freq',H21_1,Ts,Tsym);
% imp_2=cir_converter(Freq',H21_2,Ts,Tsym);
% imp_3=cir_converter(Freq',H21_3,Ts,Tsym);
% imp_4=cir_converter(Freq',H21_4,Ts,Tsym);
% imp_5=cir_converter(Freq',H21_5,Ts,Tsym);
% imp_6=cir_converter(Freq',H21_6,Ts,Tsym);
% imp_7=cir_converter(Freq',H21_7,Ts,Tsym);
% imp_8=cir_converter(Freq',H21_8,Ts,Tsym);

% imp_W=cir_converter(Freq',H21W,Ts,Tsym);
% imp_1W=cir_converter(Freq',H21W_1,Ts,Tsym);
% imp_2W=cir_converter(Freq',H21W_2,Ts,Tsym);
% imp_3W=cir_converter(Freq',H21W_3,Ts,Tsym);
% imp_4W=cir_converter(Freq',H21W_4,Ts,Tsym);
% imp_5W=cir_converter(Freq',H21W_5,Ts,Tsym);
% imp_6W=cir_converter(Freq',H21W_6,Ts,Tsym);
% imp_7W=cir_converter(Freq',H21W_7,Ts,Tsym);
% imp_8W=cir_converter(Freq',H21W_8,Ts,Tsym);
% imp_9W=cir_converter(Freq',H21W_9,Ts,Tsym);
% imp_9=cir_converter(Freq',H21_9,Ts,Tsym);
% imp_10=cir_converter(Freq',H21_10,Ts,Tsym);
% imp_11=cir_converter(Freq',H21_11,Ts,Tsym);
% imp_12=cir_converter(Freq',H21_12,Ts,Tsym);
% imp_13=cir_converter(Freq',H21_13,Ts,Tsym);
% imp_14=cir_converter(Freq',H21_14,Ts,Tsym);
% imp_15=cir_converter(Freq',H21_15,Ts,Tsym);
% imp_16=cir_converter(Freq',H21_16,Ts,Tsym);
% imp_17=cir_converter(Freq',H21_17,Ts,Tsym);
% imp_18=cir_converter(Freq',H21_18,Ts,Tsym);
% imp_19=cir_converter(Freq',H21_19,Ts,Tsym);
% imp_20=cir_converter(Freq',H21_20,Ts,Tsym);
% imp_21=cir_converter(Freq',H21_21,Ts,Tsym);
% imp_22=cir_converter(Freq',H21_22,Ts,Tsym);
% imp_23=cir_converter(Freq',H21_23,Ts,Tsym);
% imp_24=cir_converter(Freq',H21_24,Ts,Tsym);
% imp_short=imp(1:floor(nsym_short*Tsym/Ts));
figure; 
plot((abs(imp).^2),'b.-'); hold on; 
% % plot((abs(imp_short).^2),'r.-');
ylabel('imp response'); 
% hold on
% plot((abs(imp_1).^2),'r.-'); %los component
% hold on
% plot((abs(imp_2).^2),'m.-');
% hold on
% plot((abs(imp_3).^2),'k.-');
% hold on
% plot((abs(imp_4).^2),'c.-');
% hold on
% plot((abs(imp_5).^2),':g');
% hold on
% plot((abs(imp_6).^2),'--m');
% hold on
% plot((abs(imp_7).^2),'--k');
% hold on
% plot((abs(imp_8).^2),'--r');
% hold on
% plot((abs(imp_9).^2));
% hold on
% plot((abs(imp_10).^2));
% hold on
% plot((abs(imp_11).^2));
% hold on
% plot((abs(imp_12).^2));
% hold on
% plot((abs(imp_13).^2),'--r');
% hold on
% plot((abs(imp_14).^2));
% hold on
% plot((abs(imp_15).^2));
% hold on
% plot((abs(imp_16).^2));
% hold on
% plot((abs(imp_17).^2));
% hold on
% plot((abs(imp_18).^2));
% hold on
% plot((abs(imp_19).^2));
% hold on
% plot((abs(imp_20).^2));
% hold on
% plot((abs(imp_21).^2));
% hold on
% plot((abs(imp_22).^2),'--c*');
% hold on
% plot((abs(imp_23).^2),'--c*');
% hold on
% plot((abs(imp_24).^2),'--c*');

% plot((abs(imp_W).^2),'b:'); hold on; 
% plot((abs(imp_short).^2),'r.-');
ylabel('imp response'); 
grid on
% hold on
% plot((abs(imp_1W).^2),'r:');
% hold on
% plot((abs(imp_2W).^2),'m:');
% hold on
% plot((abs(imp_3W).^2),'k:');
hold on
% % plot((abs(imp_4W).^2),'c:');
% hold on
% plot((abs(imp_5W).^2),'--g');
% hold on
% plot((abs(imp_6W).^2),':m');
% hold on
% % plot((abs(imp_7W).^2),':k');
% % hold on
% plot((abs(imp_8W).^2),'--b');
% hold on
% plot((abs(imp_9W).^2),'--b');

AX=gca;
% set(AX, 'YLim', [0 2.6e-7]); 
% set(AX, 'YTick', 0:2.6e-7/100:2.6e-7);
% set(AX, 'XLim', [0 600]);
% set(AX, 'XTick', [0:20:600]);
% axis([0 500 0 1e-3]); 
% legend('4m','6m','8m','10m','12m','14m','16m','18m','20m','Through Window 2m','No Window 2m');
% legend('LoS','Engel','NLoS Linea','NLos+Engel+Linea')
legend('LoS&NLoS','Pure NLoS')
% legend('60cm','1m','2m','3m')
% legend('u0','d0')
% legend('2m Night Time')
% Cross check the impulse response with fft
ch1=fft(imp);
ch1_freqs=(1/(Ts*size(ch1,2)))*(1:size(ch1,2))*1e-6; %(in MHz)
% xlabel('Time (ns)')
% ylabel('Watt')
% axis([0 2000 0 1.97e-7]);
% title('2m Power Delay Profile')

figure;
plot(ch1_freqs,20*log10(abs(ch1)),'-r',Freq'*1e-6,20*log10(abs(H21)),'-b');
% axis([0 12048 0 5e-6]); 
grid on;
% axis([0 12048 0 5e-6]);
thru_imp=imp;

% time=(1:size(imp,2))*1e-9;

% figure;
% H=plot(time*1e9,imp*1e3,'b');
% set(H, 'LineWidth', [2.0]);
% AX=gca;
% set(AX, 'FontName', 'utopia');
% set(AX, 'FontSize', [14]);
% set(AX, 'LineWidth', [2.0]);
% set(AX, 'XLim', [0 800]);
% set(AX, 'XTick', [0:50:800]);
% %set(AX, 'XTickLabel', {'0'; '5'; '10'; '15,-15'; '-10'; '-5'; '0'});
% set(AX, 'YLim', [-17 6]); 
% set(AX, 'YTick', -17:0.2:6);
% %set(AX, 'YLim', [-0.55 0.55]); 
% %set(AX, 'YTick', -0.5:0.1:0.5);
% set(AX, 'YColor', [0 0 0]);
% HX = get(AX, 'xlabel');
% set(HX, 'string', 'Time (us)','FontName','utopia', 'FontSize', [12], 'Color', [0 0 0]);
% HY = get(AX, 'ylabel');
% set(HY, 'string', 'Impulse Response (mV)','FontName','utopia', 'FontSize', [20], 'Color', [0 0 0]);
% Htitle = get(AX, 'title');
% set(Htitle, 'string', 'Channel','FontName','utopia', 'FontSize', [20], 'Color', [0 0 0]);
% %L=legend('1','2','3','4',2);
% %set(L, 'FontSize', [14]);
% grid on;

% figure(20);
% H=plot(ch1_freqs,20*log10(abs(ch1)),'-b',Freq'*1e-6,20*log10(abs(H21)),'-r');
% set(H, 'LineWidth', [2.0]);
% AX=gca;
% set(AX, 'FontName', 'utopia');
% set(AX, 'FontSize', [14]);
% set(AX, 'LineWidth', [2.0]);
% set(AX, 'XLim', [0 20]);
% set(AX, 'XTick', [0:5:20]);
% %set(AX, 'XTickLabel', {'0'; '5'; '10'; '15,-15'; '-10'; '-5'; '0'});
% set(AX, 'YLim', [-90 -10]); 
% set(AX, 'YTick', -90:30:-10);
% %set(AX, 'YLim', [-0.55 0.55]); 
% %set(AX, 'YTick', -0.5:0.1:0.5);
% set(AX, 'YColor', [0 0 0]);
% HX = get(AX, 'xlabel');
% set(HX, 'string', 'Frequency (MHz)','FontName','utopia', 'FontSize', [20], 'Color', [0 0 0]);
% HY = get(AX, 'ylabel');
% set(HY, 'string', 'S_2_1 (dB)','FontName','utopia', 'FontSize', [20], 'Color', [0 0 0]);
% Htitle = get(AX, 'title');
% set(Htitle, 'string', ' Channel','FontName','utopia', 'FontSize', [20], 'Color', [0 0 0]);
% L=legend('From Impulse Response','Measured',1);
% set(L, 'FontSize', [14]);
% grid on;


%% Time  Domain Calculation @1m 1637 @2m 1637
apdp = (abs(imp).^2);
D= sum (apdp(1:1185).*[1:1185])/sum (apdp(1:1185)); %% Mean Excess Delay 0:1595 should be inspected 
R= sqrt(sum(apdp(1:1185).*([1:1185]-D).^2)/sum(apdp(1:1185)));

% %% RMS Delay Spread and Mean Excess Delay Plots For og-my 
% dis=[1 2 3 4 5 7.5 10 15 20];
% rms=[128 138 139 141 129 153 194 178 127];
% plot(dis,rms)
% del=[244 251 255 259 259 277 304 342 359];
% hold on
% plot(dis,del)
% hold on
% 
zz=(4.044e-6/1.754e-8);
max(apdp)/zz
