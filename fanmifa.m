close all;clc;clear;
tic;
%设置初始矩阵
A = [-1,4;-3,6];
%获取矩阵A的相关信息
[row_A, col_A] = size(A);
%求解对称正定矩阵
B = A*A.';
%设置初始迭代矩阵
U = cell(1,999);
V = cell(1,999);
U{1} = zeros(row_A,1);
U{1}(row_A) = 1;
V{1} = U{1};
m_k = 0;
for k = 2:999
    V{k} = A^-1*U{k-1};
    m_k = max(V{k});
    U{k} = V{k}./m_k;
end

fprintf('按模最小特征值 = %.2f\n',1/m_k);
fprintf('对应特征向量 = %.2f\n',U{k});
toc