%% 1.

% After computation, we get:
% y(n) = x(n) - 2.5x(n-1) + y(n-1) - 0.7y(n-2)
n = -5:50;
hn = (n==0);
hh = diffeqone(hn);
stem(hh)
hold on

% Using Filter 
ffx = filter([1,-2.5],[1,-1,0.7],hn);
stem(ffx)


%% 2.
clf;

% Using built-in residue function to find h(n).
a = [1, -2.5];
b = [1, -1, 0.7];
[r, p, k] = residue(a,b);
r %C
p %P
n = -5:30;
un = (n>=0);
hn = r(1)*p(1).^n.*(n>=0) + r(2)*p(2).^n.*(n>=0);
stem(hn);


%% 3.
% Converting to Polar, r=>rr, p=>pr
rr1 = abs(r(1));
tr1 = angle(r(1));
rr2 = abs(r(2));
tr2 = angle(r(2));
rr = [rr1*exp(1i*tr1), rr2*exp(1i*tr2)];
rr1 = abs(p(1));
tr1 = angle(p(1));
rr2 = abs(p(2));
tr2 = angle(p(2));
pr = [rr1*exp(1i*tr1), rr2*exp(1i*tr2)];
% Above we confirm that polar form is same as complex form.
% h(n) = 2*R1 * r1^n * cos(?1*n + ?1)*u(n).
hn = 2*abs(r(1))*abs(p(1)).^n.*cos(angle(p(1)*n + angle(r(1)))).*un;
stem(hn);


%% 4.
zplane(r,p)
% r and p are calculated above using the residue function.


%% 5.
% H(z) (1-0.6z^(-1)) / (1-2.1z^(-1)+1.6z^(-2)-0.4z^(-3))
%% 5.1
% After Computation: 
% y(n) = x(n) - 2.1x(n-1) + 1.6x(n-2) - 0.4x(n-3) + 0.6y(n-1)
n = -5:35;
hn = (n==0);

% Using Filter 
ffx = filter([1,-0.6],[1,-2.1,1.6,-0.4],hn);
stem(ffx)

%% 5.2
% Using built-in residue function to find h(n).
a = [1, -0.6];
b = [1,-2.1,1.6,-0.4];
[x, y, k] = residue(a,b);
x %C
y %P
n = -5:30;
un = (n>=0);
hn = x(1)*y(1).^n.*(n>=0) + x(2)*y(2).^n.*(n>=0);
stem(hn);

%% 5.3
% h(n) = Ar^n * cos(?n + theta) * u(n) + Bp3^n * u(n)
r = 2*abs(x(1))*(abs(y(1)).^n).*cos(angle(y(1))*n+angle(x(1))).*(n >=0) + x(3)*y(3).^n.*(n >=0);

stem(r);
%%
function y = diffeqone(x) 
    [~,nn] = size(x);
    y1 = zeros(1,nn+2);
    xx(3:nn+2) = x;
    
    for i = 3:length(x)
        y1(i) = xx(i) - 2.5*(xx(i-1)) + y1(i-1) - 0.7*y1(i-2);
    end
    y = y1(3:length(y1));
end
