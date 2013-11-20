clear all;

d=2
n=100
Sigma=[1 0;0 9]
Mu=0


A=rand(d,n);
B=randn(d,n);
C=sqrtm(Sigma)*randn(d,n)+Mu;

disp("[0,1]^d 上の一様分布\n");
disp("Sigmaが正値対象行列であるモデル");
AIC1(n,d,A)
disp("共分散を持たないモデル");
AIC2(n,d,A)
disp("分散が等しいモデル");
AIC3(n,d,A)
disp("\n\n");

disp("期待値0で共分散行列が単位行列の正規分布n");
disp("Sigmaが正値対象行列であるモデル");
AIC1(n,d,B)
disp("共分散を持たないモデル");
AIC2(n,d,B)
disp("分散が等しいモデル");
AIC3(n,d,B)
disp("\n\n");


disp("期待値がMuで共分散行列がSigmaである正規分布n");
Mu
Sigma
disp("Sigmaが正値対象行列であるモデル");
AIC1(n,d,C)
disp("共分散を持たないモデル");
AIC2(n,d,C)
disp("分散が等しいモデル");
AIC3(n,d,C)

