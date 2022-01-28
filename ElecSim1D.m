% Initialization
set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);


%Velocity

v_prev = [0 0];
v = [0 0];
v_next = [0 0];

a = 0;
R = 0;
v_drift = 0;

%Position

x = [0 0];

m_e = 9.1e-31;

t = 0;
dt = 1e-3;
a = 100;
v = [10 20];
v_total = 0;

% Number of electrons
N = length(x);

for t = 2:1000
    
    for i = 1:N
        x_prev(i) = x(i);
        x(i) = x(i) + v(i)*dt;
        v_prev(i) = v(i);
        v(i) = v(i) + a*dt;
        % Random scattering
        R = rand;
        if R <= 0.05
            v(i) = 0;
        end
        % Drift velocity
        v_total = v_total + v_prev(i);
    end
    
    % Drift Velocity
    v_drift = 1/N * v_total;
    
    for j = 1:N
        
        subplot(3,1,1);
        plot ([t-1 t],[x_prev(j) x(j)], "b")
        xlabel('Time')
        ylabel('Position')

        subplot(3,1,2);
        plot ([t-1 t],[v_prev(j) v(j)], "b")
        xlabel('Time')
        ylabel('Velocity')

        subplot(3,1,3);
        plot ([x_prev(j) x(j)],[v_prev(j) v(j)], "b")
        xlabel('Position')
        ylabel('Velocity')

        hold on
        pause(0.1)
    end
    
end

