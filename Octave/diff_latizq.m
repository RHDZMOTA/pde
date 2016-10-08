function Tld = diff_latizq(T,alpha,a,b,delta_space, delta_time,space_dim,time_dim)

%% Calcular valor de la función 

Tli = T;
% definir variable lambda
lambda = alpha * b / a;

% crear matriz A 
A = (1 + 2 * lambda) * eye(delta_space-1);
for c=2:(delta_space-1)
    A(c,c-1) = -lambda;
    A(c-1,c) = -lambda;
end
% determinar valores de función T
for j=2:(delta_time)
    
    % crear vector B
    B = Tli(2:end-1,j-1);
    B(1) = B(1) + lambda * Tli(1,j);
    B(end) = B(end) + lambda * Tli(end,j);
    
    Tli(2:end-1,j) = inv(A) * B;
end

%% Graficar 

% Por lateral izquierda
[space, time] = size(Tli);
figure
plot(space_dim, Tli(:,1))
for t=2:(time-1)
    hold on
    plot(space_dim, Tli(:,t))
end
title('Diferencias por laterial izquierda')
xlabel('Dimensión espacial')
ylabel('Valor de la función')

figure 
mesh(Tli)
title('Por laterial izquierda')


