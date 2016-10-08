function Tld = diff_latder(T,alpha,a,b,delta_space, delta_time,space_dim,time_dim)

%% Calcular valor de la función 

Tld = T;
for j=1:(delta_time-1)
    j_1 = j + 1;
    for ind_i=1:(delta_space-1)
        i = ind_i + 1;
        
        % calcular T(i, j+1)
        % T(i, j+1) = T(i,j) + 
        %             alpha * b * (T(i+1,j)-2*T(i,j)+T(i-1,j)) / a^2;
        %j = j_1 - 1;
        Tld(i,j_1) = Tld(i,j) ...
            + alpha * b * (Tld(i+1,j)-2*Tld(i,j)+Tld(i-1,j)) / (1*a^2);
    end
end

%% Graficar 

% Por lateral derecha
[space, time] = size(Tld);

figure
%subplot(1,2,1);
plot(space_dim, Tld(:,1))
for t=2:(time-1)
    hold on
    plot(space_dim, Tld(:,t))
end
title('Diferencias por lateral derecha')
xlabel('Dimensión espacial')
ylabel('Valor de la función')

figure
%subplot(1,2,2);
mesh(Tld)
title('Por lateral derecha')


