
%% 1.
% each graph has a different resolution. Namely, samples are taken at
% intervals of 1, 0.2, and 0.02, respectively.
% Adding Labels to Graph.
t = 0:2*pi; plot(t,sin(t))
%%
t = 0:0.2:2*pi; plot(t,sin(t))
%%
t = 0:0.02:2*pi; plot(t,sin(t))


title("SINE FUNCTION")
xlabel('t (Seconds)')
ylabel('y(t)')
axis([0 2*pi -1.2 1.2])

%%
% Multiple Plots
t = 0:0.2:2*pi; plot(t,sin(t),t,sin(2*t))

%%
% None Connected Plot
t = 0:0.2:2*pi; plot(t,sin(t),'.')

%%
% 'r.' colors the plot points red.
t = 0:0.2:2*pi; plot(t,sin(t),t,sin(t),'r.')
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

%% 2.
% EXAMPLE
%n = -10:10;
%f = n >= 0;
%stem(n,f)

%% f(n) = u(n) ? u(n ? 4)
n = -3:6;
f = (n>=0) - (n>=4);
stem(n,f)

%% g(n) = n · u(n) ? 2 (n ? 4) · u(n ? 4) + (n ? 8) · u(n ? 8)
n = -3:11;
f = (n.*(n>=0) - 2.*(n-4).*(n>=4) + (n-8).*(n>=8));
stem(n,f)

%% x(n) = ?(n) ? 2 ?(n ? 4)
n = -1:5;
f = ((n==0) - 2.*(n==4));
stem(n,f)

%% y(n) = (0.9)^n (u(n) ? u(n ? 20))
n = -4:25;
f = ((0.9).^n).*((n>=0) - (n>=20));
stem(n,f)

%% v(n) = cos(0.12 ?n) u(n)

n = -3:20;
f = (cos(0.12*pi*n).*(n>=0));
stem(n,f)


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


%% 3.
% f(n) = u(n) ? u(n ? 4)
% g(n) = n · u(n) ? 2 (n ? 4) · u(n ? 4) + (n ? 8) · u(n ? 8)

n = -2:15;
f = [(n>=0) - (n>=4)];
g = [(n.*(n>=0) - 2.*(n-4).*(n>=4) + (n-8).*(n>=8))];
delt = [(n == 0)];

ffC = conv(f,f);
[~,nn] = size(ffC);
r = -2:(nn-3);
stem(r, ffC)
% f*f is the same as g. 

fffC = conv(ffC, f);
[~,nn] = size(fffC);
r = -2:(nn-3);
stem(r, fffC)

fgC = conv(f,g);
[~,nn] = size(fgC);
r = -2:(nn-3);
stem(r, fgC)

gdC = conv(g,delt);
[~,nn] = size(gdC);
r = -2:(nn-3);
stem(r, gdC)

ggC = conv(g,g);
[~,nn] = size(ggC);
r = -2:(nn-3);
stem(r, ggC)


%% 4.
xt = [6.0, -1.3, -8.0, -11.7, -11.0, -6.0, 1.3, 8.0, 11.7, 11.0, 6.0, -1.3];
rn = [0:0.3:(0.3*11)];
stem(rn,xt)
title("SAMPLED FUNCTION")
xlabel('Time(Seconds)')
ylabel('x(t)')












