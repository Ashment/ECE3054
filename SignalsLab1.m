%Signals Lab 1

% 1.
% a)
A = [1,0,4,5,3,9,0,2];
a = [4,5,0,2,0,0,7,1];
A
a
[ss,sss] = size(A)
AA = [zeros(3); ones(1,3)];
BB = zeros(1,3);
AA
BB

% b)
B = [A,a];
C = [a,A];
B
C
[ss,sss] = size(C)

% c)
D = zeros(1,50);
E = ones(1,50);
D 
E

% d)
F = 1:30;
G = 25:1;
H = 0.0:0.2:2.0;
F
G
H

%2.
V1 = 1:9; V1 = [V1, 0];
V2 = [0.3,1.2,0.5,2.1,0.1,0.4,3.6,4.2,1.7,0.9];
V3 = [4,4,4,4,3,3,2,2,2,1];
V1
V2
V3
%a.
S1 = sum(V1);
S2 = sum(V2);
S3 = sum(V3);
S1
S2
S3

%b.
V1(5)
%gives the fifth cell of array V1.
%Trying to access indeces out of range gives error
%That is, 0 and 11 are not valid indeces.

%c.
V4 = [];
for i = 1:5
    V4 = [V4, V2(i)];
end
V4
V5 = [];
for i = 6:10
    V5 = [V5, V2(i)];
end
V5

%d.
V6 = [];
for i = 1:10
    if i ~= 6
        V6 = [V6, V2(i)];
    end
end
V6
V7 = [];
for i = 1:10
   if i == 7
       V7 = [V7, 1.4];
   else
       V7 = [V7, V2(i)];
   end
end
V7
V8 = [];
for i = 1:2:9
    V8 = [V8, V2(i)];
end
V8

%e.
9-V1 %array with each element subtracted from 9
V1*5 %each elemtn of array multiplied by 5
V1+V2 %Each element summed with the corresponding element
V1-V3 %Same as above but subtracted.
V1.*V2 %Dot Product
%V1*V2 %Invalid. Matrix Multiplication impossible with two row vectors
V1.^2 %Returns Squares of each element of V1
V1.^V3 %Returns V3 element power of each element of V1
V1 == V3 %Compares each element of V1 and V3 for equality
V1>6 %Comapres each element of V1 to 6 and returns results
V1>V3 %Compares corresponding elements and returns results
V3-(V1>2) % Compares V1 to 2 and subtracts results from V3
(V1>2) & (V1<6) %bitwise AND on the two comparison operators
(V1>2) | (V1<6) %bitwise OR on the two comparison operators
any(V1) %returns true if any element in V1 is nonzero
all(V1) %returns true if all elements in V1 are nonzero


%4.
%a.
A = zeros(1,5);
for n = 1:4
    for m = 1:3
        A = A + n*m;
    end
end
%Generates [(1+2+3+2+4+6+3+6+9+4+8+12) * 5] = [60,60,60,60,60]
A

%b.
B = [1 0];
if (all(B))
    B = B + 1;
elseif (any(B))
    B = B + 2;
else
    B = B + 3;
end
%Generates B = B + 2 = [3,2]
B

%c.
C = 7:2:22
num = 0;
while (all( C>0))
    C = C - 3;
    num = num + 1;
end
% result is C = C-9. num = 3, C=[-2:2:12]
C
num


%d. 
%First case, YES
%Second case, YES


%5.
% We use files as macros for commands in the terminal.
% Error from trying to print myfunction is because there are no parameters
% Error from trying to pring g is because g is not defined in this scope.










