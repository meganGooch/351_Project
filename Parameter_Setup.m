%SYDE 351 Final Project
%Group 27
%Task 0-B
%Parameter Calculations and Setup

%File is used to define relevant information to the project externally
%This includes givens, such as the mass
%This includes calculations, such as the moment of inertia

%List givens

m_load = 20;                    %mass of the load carried [kg]
m_robot = 20;                   %mass of the robot itself [kg]

m_total = m_load + m_robot;     %mass of the system

H_robot = 1;                    %height of the robot [m]

D_robot = 0.5;                  %diameter of the robot [m]
R_robot = D_robot/2;            %radius of the robot [m]


D_wheel = 0.1;                  %diameter of the robot wheels [m]
R_wheel = D_wheel/2;            %radius of the robot wheels [m]

%Assumed Dimensions/Geometry

theta_wheels = (pi / 4);

%d_COM = R_robot * cos(theta_wheels);
%L_wheel = R_robot * sin(theta_wheels);
d_COM = 0;
L_wheel = D_robot;

%Assumption: the robot can be modeled with uniform mass

J_robot = 0.5 * m_total * ((R_robot)^2); 
                                %moment of inertia about the cylinder axis 
                                %passing through both central circles
J_total = J_robot + (m_total * (d_COM^2));

%Motor Characteristics

N = 1;
K = 1;
Ra = 1;
La = 0.01;

