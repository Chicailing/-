close all;clc;clear;

%这是编写Lagrange插值函数程序

n = input('请输入节点数： ');
x = zeros(1,n);
y = zeros(1,n);
%读入数据
for i =1:n
    
    fprintf('目前为第%d个节点',i);
    x(i) = input('请输入插值节点值： ');
    y(i) = input('请输入该节点处函数值： ');
end

sum = 0;
z = input('请输入插值函数目标点： ');
tic;
for k = 1:n
    fl = 0;
    lk = 1.00;
    for i = 1:n
        if i~=k
            lk=(z-x(i))/(x(k)-x(i))*lk;
        end
    end
    sum=sum+y(k)*lk;

end
fprintf('目前函数值为：%.6f',sum);
toc
