#共分散行列が正値対称行列であるガウス分布を仮定した場合のAIC
function AIC=AIC1(n,d,A)
  res1=0;
  #期待値の最尤推定量
  mu=mean(A,2);

  #共分散行列の最尤推定量計算 もっといい書き方あるはず…
  Sigma=zeros(d,d);
  for i=1:n
    Sigma+=(A(:,i)-mu)*(A(:,i)-mu)';
  end
  Sigma/=n;

  #対数尤度計算
  for i=1:n
    res1+=log((1/(((2*pi)^(d/2))*((det(Sigma))^(1/2))))*exp((-1/2)*(A(:,i)-mu)'*inv(Sigma)*(A(:,i)-mu)));
  end

  #return AIC
  AIC=-res1+d*(d+1)*(1/2);
endfunction
