clc;
clear ;

prompt1 = 'insert angle of joint 1 (base): ' ;
prompt2 = 'insert angle of joint 2 : ';
prompt3 = 'insert angle of joint 3 : ';
prompt4 = 'insert angle of joint 4 : ';

theta1 = input(prompt1);
theta2 = -input(prompt2)-100;
theta3 = -input(prompt3)+110;
theta4 = -input(prompt4)+80;

theta = [theta1,theta2,theta3,theta4,0];
alpha = [-90,0,0,0,0];
a = [0,20,10,8,5];
d = [21,0,0,0,0];

hold on
T = 1 ;
old_link = [0,0,0];

for i = 1 : 5
Mdh = [ cosd(theta(i)) , (-sind(theta(i)))*cosd(alpha(i)) ,(sind(theta(i)))*sind(alpha(i)), a(i)*cosd(theta(i));
    sind(theta(i)) ,  (cosd(theta(i)))*cosd(alpha(i)) , (-cosd(theta(i)))*sind(alpha(i)) , a(i)*sind(theta(i)) ;
    0 , sind(alpha(i)) , cosd(alpha(i)) , d(i) ;
    0,0,0,1];
    T = T*Mdh ;
    link = [T(1,4),T(2,4),T(3,4)];
    plot3([old_link(1) link(1)],[old_link(2) link(2)],[old_link(3) link(3)], 'b' , 'LineWidth', 3);
    [x,y,z] = sphere(5);
    surf(x+T(1,4),y+T(2,4),z+T(3,4), 'FaceColor', [0,1,0]);
    old_link = link ;
    if i == 5
        disp(link);
    end
end

p1 = [-10 -25 0];
p2 = [50 -25 0];
p3 = [50 25 0];
p4 = [-10 25 0]; 
plane_x = [p1(1) p2(1) p3(1) p4(1)];
plane_y = [p1(2) p2(2) p3(2) p4(2)];
plane_z = [p1(3) p2(3) p3(3) p4(3)];
fill3(plane_x, plane_y, plane_z, [0.5 0.5 0.5]);
xlim([-10 50])
ylim([-25 25])
zlim([0 50])
grid on
hold off

