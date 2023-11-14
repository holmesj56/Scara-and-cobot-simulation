clear all clc
syms t1 t2 d4 the1 the2 dd4
a1=150; a2=180; a3=190; ;
    H01=[ cos(t1) -sin(t1) 0 a2*cos(t1);...
    sin(t1) cos(t1) 0 a2*sin(t1);...
    0 0 1 a1;...
    0 0 0 1 ];
    H12=[ cos(t2) -sin(t2) 0 a3*cos(t2);...
    sin(t2) cos(t2) 0 a3*sin(t2);...
    0 0 1 0;...
    0 0 0 1 ]
    H23=[ 1 0 0 0;...
    0 1 0 0;...
    0 0 1 -d4;...
    0 0 0 1 ]
    H03=simplify(H01*H12*H23)
    Px= H03(1,4)
    Py= H03(2,4)
    Pz= H03(3,4)


tt1=25/180*pi; %Theta 1
tt2=45/180*pi; % Theta 2
d44 =70         % length 3
%
px_new=vpa(subs(Px,[t1,t2,d4],[tt1,tt2,d44]))
py_new=vpa(subs(Py,[t1,t2,d4],[tt1,tt2,d44]))
pz_new=vpa(subs(Pz,[t1,t2,d4],[tt1,tt2,d44]))

%Inverse Kinematic Solution

[the1,the2,dd4] = solve(Px==px_new,Py==py_new,Pz==pz_new,t1,t2,d4)
Theta1=vpa((the1)*180/pi)
Theta2=vpa((the2)*180/pi)
ddd4=vpa(dd4)
Solution=[Theta1 Theta2 ddd4]

