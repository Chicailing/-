close all;clc;clear;
tic;
%设置初始矩阵
A = [31,-13,0,0,0,-10,0,0,0;-13,35,-9,0,-11,0,0,0,0;0,-9,31,-10,0,0,0,0,0;0,0,-10,79,-30,0,0,0,-9;0,0,0,-30,57,-7,0,-5,0;0,0,0,0,-7,47,-30,0,0;0,0,0,0,0,-30,41,0,0;0,0,0,0,-5,0,0,27,-2;0,0,0,-9,0,0,0,-2,29];
B = [-15;27;-23;0;-20;12;-7;7;10];
%获取矩阵A的相关信息
[row_A, col_A] = size(A);
omega_best = 0;
d = 10;
k=100;%遍历次数
for m = 1:99
    omega = m/50;%松弛因子
    c = 0;err = 0.000005;
    x = zeros(row_A,1);
    y = zeros(row_A,1);
    
    for flag = 1:k%当前迭代次数

        for i = 1:col_A
            sum = B(i);
            for j = 1:col_A
                if j < i
                    sum = sum - A(i,j)*y(j);
            
                elseif j > i 
                    sum = sum - A(i,j)*x(j);
            
                else
                    sum =sum;
                end
            
            end
        y(i) =(1-omega)*x(i) + omega*sum / A(i,i);
        end
        fprintf('松弛因子 = %.2f，迭代次数 = %d\n',omega,flag)
    for i =1:row_A
        c = norm(y-x,"inf");%求无穷范数

        x(i)=y(i);
        
        fprintf('解向量：x^{%d}(%d) =%.7f\n',flag,i,x(i))%解向量
    end
    if flag == 8 && c<d
        d = c;
        omega_best = omega;
    end
    if c <=err
        break;
    end
    %fprintf('%.7f,%.7f \n',c,err)
    end
end
fprintf('最佳松弛因子 = %.2f\n',omega_best)
toc