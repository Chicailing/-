close all;clc;clear;
tic;
%设置初始矩阵
A = [-1,4;-3,6];
%获取矩阵A的相关信息
[row_A, col_A] = size(A);
%设置初始迭代矩阵
U = cell(1,999);
V = cell(1,999);
U{1} = zeros(row_A,1);
U{1}(row_A) = 1;
V{1} = U{1};
m=zeros (999, 1);
m(1) = 0;
for k = 2:999
    V{k} = A*U{k-1};
    m(k) = max(V{k});
    U{k} = V{k}./m(k);
end

fprintf('主特征值 = %.2f\n',m(999));
fprintf('对应特征向量 = %.2f\n',U{k});
toc