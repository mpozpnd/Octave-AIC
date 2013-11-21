#共分散が無いガウス分布を想定した場合のAIC
function AIC=AIC2(n,d,A)
  res1=0;
  #期待値の最尤推定
  mu=mean(A,2);

  #各分散の最尤推定
  Sigma=zeros(d,d);
  for i=1:d
    hoge=0;
      for j=1:n
        hoge+=(A(i,j)-mu(d))^2;
      end
    Sigma(i,i)=hoge/n;
  end

  invS=inv(Sigma);
 
  #対数尤度計算
  for i=1:n
    res1+=log((1/(((2*pi)^(d/2))*((det(Sigma))^(1/2))))*exp((-1/2)*(A(:,i)-mu)'*invS*(A(:,i)-mu)));
  end

  #return AIC
  AIC=-res1+d;
endfunction
