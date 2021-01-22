function A = adjoint(T)
    R=T(1:3,1:3);
    p=T(1:3,4);
    A = [R,zeros(3,3);skew(p)*R,R];
end