function imp=cir_converter(f,H,Ts,Tsym)
% input 
%   f - frequency in Hz
%   H - transfer function, S21 
%   Ts - simulator sample time
%   Tsym - simulator symbol period
% output
%   imp_response

num_fft_pts=2^16;

% set the symbol frequency
f_sym=1/Tsym;
% get the maximum sampling frequency from the transfer function
f_sym_max=2*max(f);
% stop the simulation if the symbol frequency is greater than the maximum
% measured sampling frequency
if (f_sym > f_sym_max), 
   error('Max input frequency too low for requested symbol rate, can''t interpolate!');
end	

f_sym_max=f_sym*floor(f_sym_max/f_sym); 
Hm=abs(H);
Hp=angle(H);

%%% need to force phase to zero at zero frequency
if f(1)==0,
   Hm_ds=[fliplr(Hm(2:end-1)) Hm];
   Hp_ds=[fliplr(-Hp(2:end-1)) Hp];
   fds=[-fliplr(f(2:end-1)) f];
   fds_m = fds; 
   fds_p = fds;
else
   Hm_ds=[fliplr(Hm(1:end-1)) Hm];
   Hp_ds=[fliplr(-Hp(1:end-1)) 0 Hp];
   fds_m=[-fliplr(f(1:end-1)) f];
   fds_p=[-fliplr(f(1:end-1)) 0 f];
end

fmax=1/Ts;
df=fmax/2/num_fft_pts;                             
f_ds_interp=-f_sym_max/2+df:df:f_sym_max/2;             
f_ds_interp_a=-fmax/2+df:df:fmax/2;             
Hm_ds_interp=spline(fds_m,Hm_ds,f_ds_interp);           % Interpolate for FFT point number
Hp_ds_interp=spline(fds_p,unwrap(Hp_ds),f_ds_interp);
Hm_ds_interp_sh_orig=fftshift(Hm_ds_interp);
Hp_ds_interp_sh_orig=fftshift(Hp_ds_interp);

Hm_ds_interp_a(1:(2*num_fft_pts-size(Hm_ds_interp,2))/2)=0;
Hm_ds_interp_a((2*num_fft_pts-size(Hm_ds_interp,2))/2+1:(2*num_fft_pts+size(Hm_ds_interp,2))/2)=Hm_ds_interp;
Hm_ds_interp_a((2*num_fft_pts+size(Hm_ds_interp,2))/2+1:2*num_fft_pts)=0;
Hp_ds_interp_a(1:(2*num_fft_pts-size(Hp_ds_interp,2))/2)=0;
Hp_ds_interp_a((2*num_fft_pts-size(Hp_ds_interp,2))/2+1:(2*num_fft_pts+size(Hp_ds_interp,2))/2)=Hp_ds_interp;
Hp_ds_interp_a((2*num_fft_pts+size(Hp_ds_interp,2))/2+1:2*num_fft_pts)=0;

Hm_ds_interp_sh=fftshift(Hm_ds_interp_a);
Hp_ds_interp_sh=fftshift(Hp_ds_interp_a);
size(Hp_ds_interp_sh);

H_ds_interp_sh=Hm_ds_interp_sh.*exp(j*Hp_ds_interp_sh);

% H_ds_interp_sh=Hm_ds_interp_sh;

% impulse response from ifft of interpolated frequency response
size(H_ds_interp_sh)

%%Windowing - Optional 
n = size(H_ds_interp_sh,2);
wk = hamming(n,'symmetric')'; 
H_ds_interp_sh = wk.*H_ds_interp_sh;

imp=ifft(H_ds_interp_sh);
imp_r=real(imp);

dt_sym=1/fmax;
imp=imp_r;

%refit data into simulator's time step
dt_time=0:dt_sym:dt_sym*(length(imp_r)-1);
time = 0:Ts:dt_time(end); 

return
   

