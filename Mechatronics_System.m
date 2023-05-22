clear;
clc;
close all;
%function sys_ss = new_twip_ss()  
% OUTPUT: 

% the output is the state space model object 

m_p = 7.5; % Mass of the pendulum 
m_w = 30.5; % Mass of the wheel 
l = 0.97; % Length to CG (Center of Gravity) 
r = 0.483; % Radius of the wheel 
I_p = (1/3)*m_p*l^2;  %Inertia of the pendulum around the wheel axis 
%I_w = m_w *r^2; % inertia of the wheel around the wheel axis 
R = 1; % The resistance of the DC Motor 
k_e = 0.98; % Voltage constant for the DC Motor 
k_a = 0.98; % Motor Torque Constant of the DC Motor 
g = 9.81; % Gravity Acceleration 
c = 0.9; %Frictional constant


q = (m_p+m_w)*(I_p+m_p*l^2)-(m_p*l)^2;
s = tf('s');

Tf_w = (((I_p+m_p*l^2)/q)*s^2 - (m_p*g*l/q))/(s^4 + (c*(I_p + m_p*l^2))*s^3/q - ((m_w + m_p)*m_p*g*l)*s^2/q - c*m_p*g*l*s/q);

Tf_p = (m_p*l*s/q)/(s^3 + (c*(I_p + m_p*l^2))*s^2/q - ((m_w + m_p)*m_p*g*l)*s/q - c*m_p*g*l/q);

t_f = [Tf_p, Tf_w]

% inputs = {'u'};
% outputs = {'x'; 'phi'};
% 
% set(sys_tf,'InputName',inputs)
% set(sys_tf,'OutputName',outputs)


% t=0:0.01:2;
% impulse(sys_tf,t);
% title('Open-Loop Impulse Response')

% fig = openfig('step_p.fig');
% ax = fig.CurrentAxes;
% g_array = ax.Children;
% x1 = g_array(1).XData;
% y1 = g_array(1).YData;
% 
% plot(x1,y1,'b' );
% xlabel('Time (s)')
% ylabel('Displacement (rad)')
% title('Impulse Input: Time response Comparison')
% legend('Non-Linear', 'Linear')

