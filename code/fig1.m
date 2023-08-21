function createfigure(X1, Y1, Z1)
%CREATEFIGURE(X1, Y1, Z1)
%  X1:  scatter3 x
%  Y1:  scatter3 y
%  Z1:  scatter3 z

%  由 MATLAB 于 09-Nov-2022 10:31:47 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 scatter3
scatter3(X1,Y1,Z1,'MarkerEdgeColor','none','MarkerFaceColor','flat');

% 创建 zlabel
zlabel({'Monetary ','cost'});

% 创建 ylabel
ylabel({'Time cost'});

% 创建 xlabel
xlabel({'Degree of satisfaction'});

view(axes1,[-37.5 30]);
grid(axes1,'on');
hold(axes1,'off');
