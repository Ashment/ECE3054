%% 1. Noisey Speech Plots
load mtlb
who

L = length(mtlb);
figure %1
plot([1:L]/Fs,mtlb)
load NoisySpeech.txt
x = NoisySpeech;
figure %2
plot ([1:L]/Fs,x)
axis tight
xlabel('Time (Seconds)')
title('Noisy Speech Signal')
soundsc(x)

%% 2. Discrete Time Fourier Transform

[M,f] = dtft(mtlb,1/Fs);
figure %3
plot(f,M)
xlabel('Frequency (Hz)')
title('Spectrum of MTLB')
soundsc(M)

% Fourier Transform plot can show the presence of specific frequencies in
% the signal. From figure 3 we can see that the largest spike is present at
% 0Hz. Various other spikes show the predominant frequencies in the signal.

%% 3. dtft with Noisey Speech

[M,f] = dtft(x,1/Fs);
figure %4
plot(f,M)
xlabel('Frequency (Hz)')
title('Spectrum of MTLB')
soundsc(M)

% We look again at the fourier transform plot, this time figure 4. Like
% part 2, the spikes in this plot represent the most prominent signal
% frequencies. However, at |?| > 3000Hz, we see signficant noise. To remove
% this noise, a high-cut/low-pass filter should be used. A high-frequency
% cutoff of 3000Hz should be effective at removing the hihg-frequency noise
% from this signal.

%% Part 4

Wn = 0.75;
N = 7;
Rp = 0.3;
Rs = 35;
[b,a] = ellip(N,Rp,Rs,Wn,'low');
Y = filter(b,a,x);
[M,f] = dtft(Y,1/Fs);
figure %8
plot(f,M)
xlabel('Time (Seconds)')
title('Noisy Speech Signal (Low Pass Filter)')
soundsc(M)

% Finding the proper Wn for the appropriate pass-band edge is the most
% important in reducing the noise in the signal. I find that Wn=0.65 works
% very well for reducing noise without losing the original signal. Setting 
% the filter to be too high-order also results in some strange results. I 
% find that 7th order works well. Setting an appropriately high stop-band
% attenuation Rs is also important. Too low and the noise will only be
% reduced in magnitude. 35dB attenuation is enough to mostly remove the
% noise in this case.

% After listening, these settings almost perfectly reproduce the original
% sound.
