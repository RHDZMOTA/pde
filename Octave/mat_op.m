function z = mat_op(X,A,B)
if size(X) ~= size(B)
    disp('Not possible.')
else
z = B - A*X;
z = z.^2;
z = sum(z); 
end