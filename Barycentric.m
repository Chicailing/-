close all;clc;clear;

%这是编写Barycentric插值函数程序

n = input('请输入节点数： ');
x = zeros(1,n);
y = zeros(1,n);
%读入数据
for i =1:n
    fprintf('目前为第%d个节点',i);
    x(i) = input('请输入插值节点值： ');
    y(i) = input('请输入该节点处函数值： ');
end

z = input('请输入插值函数目标点： ');

for k=1:n
    lk = 1.00;
    for i =1:n
        if i ~=k
            lk = lk*(x(k)-x(i));
        end
    end
    w(k) = 1/lk;
end

shang  = 0;
xia = 0;

for k =1:n
    shang = shang+y(k)*w(k)/(z-x(k));
    xia = xia+w(k)/(z-x(k));
end
Ln = shang/xia;

fprintf('结果为%.6f',Ln);



