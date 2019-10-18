

%% 1. 
% Transfer Function: 
% H(z) = (0.1 - 0.1176(z^-1) + 0.1(z^-2)) / (1 - 1.7119(z^-1) + 0.81(z^-2))

%% 2.
% Plotting the frequency response of H(z):
b = [0.1, -0.1176, 0.1];
a = [1, -1.7119, 0.81];
[H, w] = freqz(b,a);
plot(w, abs(H))

%% 3.
% Let input signal be:
% x(n) = cos(0.1*pi*n) * u(n)
n = 0:100;
xn = cos(0.1*pi*n).*(n>=0);

fx = filter(b,a,xn);
plot(fx)

subplot(2,1,1), stem(xn)
subplot(2,1,2), stem(fx)

% The frequency of this input function is 0.1pi. Finding the frequency
% response value at 0.1pi in the frequency response graph in section 2,
% then, would allow us to predict the amplitude of the output.

%% 4.
clf;

eX = exp(i*0.1*pi);
pb = polyval(b, eX);
pa = polyval(a, eX);
Hz = pb/pa;
Hz

%% 5.
% Plot steady state signal s(n):
% s(n) = |Hf(0.1 ?)| cos(0.1 ? n + ?Hf(0.1 ?))

sn = abs(Hz) * cos(0.1*pi*n + angle(Hz));

plot(n,fx,n,sn)

% Notice that y(n) becomes the same as the steady-state signal after
% the transient response, while the steady-state is always at full
% amplitude.

%% 6.
% Let the input signal be:
% x(n) = cos(0.3 ? n) u(n)
n = 0:100;
xn = cos(0.3*pi*n).*(n>=0);

fx = filter(b,a,xn);
plot(fx)

subplot(2,1,1), stem(xn)
subplot(2,1,2), stem(fx)

% We notice that the steady-state signal of this y(n) appears to be zero.
% This behaviour is expected when considering the frequency response of the
% system.

%% 7.
% Plot the poles of the transfer function H(z).
clf;
zplane(b,a)

% The frequency of the input signal is 0.3*pi. We can say that at
% Hf(omega) evaluated at 0.3*pi having angle of one of the zeroes on the
% zplane plot would result in 0. This magnitude is the frequency response
% at some angle in the zplane, and at 0, the steady-state of the signal is
% zero.

%% 8.
n = 0:100;
%% 8.1: y(n) = x(n) + 1.8 y(n ? 1) ? 0.9 y(n ? 2) 
b = [1, 0, 0];
a = [1, -1.8, 0.9];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 8.2: y(n) = x(n) + 1.6 y(n ? 1) ? 0.72 y(n ? 2) 
b = [1, 0, 0];
a = [1, -1.6, 0.72];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 8.3: y(n) = x(n) + 1.53 y(n ? 1) ? 0.9 y(n ? 2) 
b = [1, 0, 0];
a = [1, -1.53, 0.9];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 8.4: y(n) = x(n) + 1.4 y(n ? 1) + 0.72 y(n ? 2) 
b = [1, 0, 0];
a = [1, -1.4, 0.72];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 8.5: y(n) = x(n) ? 0.85 y(n ? 1) 
b = [1, 0, 0];
a = [1, 0.85];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 8.6: y(n) = x(n) ? 0.95 y(n ? 1) 
b = [1, 0, 0];
a = [1, 0.95];
[H, w] = freqz(b,a);
plot(w, abs(H))
zplane(b,a)
fx = filter(b,a,(n==0));
stem(fx)

%% 9
% Placing Poles and Zeros: Generating transfer function based on desired
% zeros and poles:
p1 = 0.8*exp(1i*0.2*pi);
p2 = 0.8*exp(1i*-0.2*pi);
p3 = 0.7;
z1 = -1;
z2 = exp(1i*0.6*pi);
z3 = exp(1i*-0.6*pi);

pp1 = poly([p1,2,p3]);
pz1 = poly([z1,z2,z3]);
zplane(pp1,pz1)

% zplane plots zeroes and poles directy based on the polynomial parameters.
pp1
pz1
% H(z) = (1 + 6(z^-1) + 11(z^-2) + 6(z^-3)) / (1 + 1.618(z^-1) + 1.618(z^-2) + 1(z^-3))
% Difference Equation: 
% y(n) =  x(n) + 6x(n-1) + 11x(n-2) + 6x(n-3) - 1.618y(n-1) - 1.618y(n-2) -
% y(n-3)

p1 = 0.98*exp(1i*0.2*pi);
p2 = 0.98*exp(1i*-0.2*pi);

pp2 = poly([p1,p2,p3]);
pz2 = poly([z1,z2,z3]);
zplane(pp2,pz2)
% zplane plots zeroes and poles directy based on the polynomial parameters.
pp2
pz2
% H(z) = (1 - 2.2857(z^-1) + 2.0704(z^-2) - 0.6723(z^-3)) / (1 + 1.618(z^-1) + 1.618(z^-2) + 1(z^-3))
% y(n) = x(n) - 2.2857x(n-1) + 2.0704x(n-2) - 0.6723x(n-3) - 1.618y(n-1) -
% 1.618y(n-2) - y(n-3)
