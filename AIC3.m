#共分散が無く、さらに分散が等しいガウス分布を仮定した場合のAIC
function AIC=AIC3(n,d,A)
  res1=0;
  #期待値の最尤推定
  mu=mean(A,2);

  #分散の最尤推定
  Sigma=zeros(d,d);
  z=0;
  for i=1:n
    z+=(A(:,i)-mu)'*(A(:,i)-mu);
  end
  z/=n*d;
  Sigma=zeros(d,d);
  for i=1:d
    Sigma(i,i)=z;
  end

  #対数尤度計算
  for i=1:n
    res1+=log((1/(((2*pi)^(d/2))*((det(Sigma))^(1/2))))*exp((-1/2)*(A(:,i)-mu)'*inv(Sigma)*(A(:,i)-mu)));
  end

  #return AIC
  AIC=-res1+1;
endfunction
