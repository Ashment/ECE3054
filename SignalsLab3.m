
%% 1.
%f(n) = 3 ?(n + 2) ? ?(n ? 1) + 2 ?(n ? 3)
%g(n) = u(n + 4) ? u(n ? 3)
%%
n = -8:8;

f = 3.*(n == -2) - (n == 1) + 2.*(n == 3);
stem(f)

%%
n = -8:8;
g = (n >= -4) - (n>=3);
stem(g)

%%
%x(n) = f(n) * g(n)
x = conv(f,g);
stem(x)

%% 2.
load dataEOG.txt
x = dataEOG;
plot(x)

%%
h = ones(1,11)/11;
stem(h)

%%
plot(x)
hold on
y = conv(h,x);
plot(y)
% The length of h(n)*x(n) = (len(h)+len(x)) - 1
% The convolution seems to have created a smooth signal that still very
% much resembels the original input signal.

%%
y2 = y;
y2(1:5) = [];
y2(end-4:end) = [];
% y2 takes y and clips the front and back end of the signal so that it
% better matches against the input signal x.
plot(x)
hold on
plot(y2)

%%
h = ones(1,31)/31;
x = dataEOG;
plot(x)
hold on
y = conv(h,x);
y2 = y;
y2(1:15) = [];          %1:15, end-15:end
y2(end-14:end) = [];
plot(y2)

%%
h = ones(1,67)/67;
x = dataEOG;
plot(x)
hold on
y = conv(h,x);
y2 = y;
y2(1:33) = [];          %1:33, end-33:end
y2(end-32:end) = [];
plot(y2)

%% 3.

%% a)
% Function mydiffeq is defined below.
y1 = mydiffeq(1:5);
y2 = mydiffeq(3:7);
y3 = mydiffeq((1:5) + 2.*(3:7));
y3
y1 + 2.*(y2)
% Yes, the function is linear.

%% b)



%% c)
x = [1, zeros(1,100)];
y = mydiffeq(x);
plot(y);

%%
% x = cos(? n/8) [u(n) ? u(n ? 50)]
n = -5:55;
hn = (n==1);
stem(hn)
%%
h = mydiffeq(hn);
plot(h)
x = cos(pi*n/8).*((n>=0) - (n>=50));
plot(x)
%%
xx = mydiffeq(x);
plot(xx)                %Solution using function
%%
conhn = conv(h,x);
plot(conhn(7:68))       %Solution using convolution

%%
n = 0:25;
hn = (n==1);
h = eqe(hn);
stem(h)
% h is impulse reponse of eqe


%%
n=-0:50;
hn = (n==1);
h = eqf(hn);
stem(h)
% h is impulse response of eqf

%% FUNCTIONS
% y(n) = x(n) + 2 x(n ? 1) ? 0.95 y(n ? 1)
function y = mydiffeq(x) 
    [~,nn] = size(x);
    y = zeros(1,nn+1);
    xx(2:nn+1) = x;
    
    for i = 2:length(x)
        y(i) = xx(i) + 2*(xx(i-1)) - 0.95*y(i-1);
    end
end

% y(n) = x(n) + 2 x(n ? 1)
function y = eqe(x)
    [~,nn] = size(x);
    y = zeros(1,nn+1);
    xx(2:nn+1) = x;
    
    for i = 2:length(x)
       y(i) = xx(i) + 2*(xx(i-1));
    end
end

% y(n) = x(n) + 2 x(n ? 1) ? 1.1 y(n ? 1)
function y = eqf(x) 
    [~,nn] = size(x);
    y = zeros(1,nn+1);
    xx(2:nn+1) = x;
    
    for i = 2:length(x)
        y(i) = xx(i) + 2*(xx(i-1)) - 1.1*y(i-1);
    end
end











