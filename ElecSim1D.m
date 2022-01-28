% Initialization
set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);


%Velocity

v_prev = 0;
v = 0;
v_next = 0;

a = 0;

%Position

x = 0;

m_e = 9.1e-31;

t = 0;
dt = 1e-3;
a = 100;
v = 10;

for t = 2:1000
    x_prev = x;
    x = x + v*dt;
    v_prev = v;
    v = v + a*dt;
    
    % Random Scattering
    
    
    subplot(3,1,1);
    plot ([t-1 t],[x_prev x], "b")
    xlabel('Time')
    ylabel('Position')
    
    subplot(3,1,2);
    plot ([t-1 t],[v_prev v], "b")
    xlabel('Time')
    ylabel('Velocity')
    
    subplot(3,1,3);
    plot ([x_prev x],[v_prev v], "b")
    xlabel('Position')
    ylabel('Velocity')
    
    hold on
    pause(0.1)
    
end

