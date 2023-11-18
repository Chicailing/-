close all;clc;clear;

%这是编写各阶差商与Newton 插值程序

n = input('请输入节点数： ');
x = zeros(1,n);
y = zeros(1,n);
%读入数据
for i =1:n
    
    fprintf('目前为第%d个节点',i);
    x(i) = input('请输入插值节点值： ');
    y(i) = input('请输入该节点处函数值： ');
end


%计算差商
chasj = input('请输入你想知道的差商的阶数： ');
if chasj<n && chasj >=0 && chasj ==fix(chasj)
    
    for a = 0:n
        sum =0;
        if chasj + a +1>n
            break
        end
        for i =1+a:chasj+a+1
            lk = 1.0;
            for j=1+a:chasj+1+a
                if j~=i
                lk=(x(i)-x(j))*lk;
                end
            end
        sum = sum+y(i)/lk;
        end
        fprintf('%d阶差商值为：%.6f\n',chasj,sum);
    end
else
    fprintf('请确保输入数据正确');
end

z = input('请输入插值函数目标点： ');

N_z = y(1);
leicheng = 1;
for k =1:n-1
    sum = 0;
    for i =1:k+1
                lk = 1.0;
                for j=1:k+1
                    if j~=i
                    lk=(x(i)-x(j))*lk;
                    end
                end
            sum = sum+y(i)/lk;
    end
    leicheng = leicheng*(z-x(k));
    N_z = N_z+sum*leicheng;
    
end

fprintf('结果是%.6f',N_z);




