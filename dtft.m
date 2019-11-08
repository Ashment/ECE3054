function [X,f] = dtft(x,T)

% [X,f] = dtft(x,T)
% Discrete-Time Fourier Transform
% (Magnitude)
%
% x : signal
% T : sampling period (optional, default T = 1)
%
% % Example:
% n = 0:100;
% x = (n>30)-(n>50);
% [X,f] = dtft(x);
% plot(f,X)
% xlabel('FREQUENCY (Hz)')
% ylabel('|DTFT|')

x = x(:);
N = length(x);
L = 2^ceil(log2(2*N));

if L < 2^10;
   L = 2^10;
end;

X = fft(x,L);
X = abs(fftshift(X));
X = [X; X(1)];

if nargin < 2
   T = 1;
end


f = [[0:L]/L-0.5]/T;

