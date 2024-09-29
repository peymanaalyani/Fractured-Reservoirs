clc;
clear all;
rd=1;
omega=0.024324;
i=1;
lambda=2.576E-6;
pd=zeros(1,100);
td=zeros(1,100);
k=20;
cm=1E-5;
cf=1E-5;
ct=cm+cf;
phi_m=.05;
phi_f=.45;
phi_T=phi_m+phi_f;
miu=1;
B=1;
q=90.5;
h=9.05;
rw=.375;
lambda=2.576E-6;
omega=0.024324;
s=0;

pressure='p.xlsx';
time='t.xlsx';
p = 160 + xlsread(pressure);
t = xlsread(time);

semilogx(t,p);
hold on
grid on


td=(0.0002638*k/((cm*phi_m+cf*phi_f)*miu*rw^2))	* t;
pdf=0.5*log(4*td/(rd*rd*exp(1)^0.55)) - ...
    0.5*(expint((+1)*lambda*td/omega*(1-omega))) +...
    0.5*expint((+1)*lambda*td/(1-omega));
pdf=4000-pdf/((0.00708*k*h)/(q*miu*B));
% pdf=4000-(162.6*q*miu*B/k*h)*(log(k*td/miu*ct*phi_T*rw*rw)-3.23...
%     +0.435*expint((-1)*lambda*td/omega*(1-omega))...
%     -0.435*expint((-1)*lambda*td/(1-omega))+0.87*s);



semilogx(t,pdf);

legend("Kazemi model with eclipse","warren and root model with MATLAB","Location","Southwest");
xlabel('t (hour)');
ylabel('Pw (psi)');
hold off
grid on