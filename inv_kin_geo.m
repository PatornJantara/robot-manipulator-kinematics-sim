 clc;
    alpha = [-90,0,0];
    a = [0,15,15];
    d = [20,0,0];
    
    prompt1 = 'insert x pos : ' ;
    prompt2 = 'insert y pos : ';
    prompt3 = 'insert z pos : ';

    x = input(prompt1);
    y = input(prompt2);
    z = input(prompt3); 
   
    z = z - d(1) ;
    
    r = sqrt(x^2+y^2) ;
    
    theta1 = atand(y/x); 
    
    theta3 = -acosd((x^2+y^2+z^2-a(2)^2-a(3)^2)/2*a(2)*a(3)) ;
    
    theta2 = atand(z/r)+atand((a(3)*sind(theta3))/(a(2)+a(3)*cosd(theta3))) ;
    
    theta = real([theta1 , theta2 , theta3]) ;
    
    disp(theta);
   
    alpha = [90,0,0];
    a = [0,15,15];
    d = [20,0,0];

    hold on
    T = 1 ;
    old_link = [0,0,0];

    for i = 1 : 3
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
        if i == 3
            disp(T);
        end
    end
    text(T(1,4),T(2,4),T(3,4),['  (', num2str(T(1,4),3), ', ', num2str(T(2,4),3),', ', num2str(T(3,4),3), ')']);
    p1 = [-10 -25 0]; p2 = [50 -25 0]; p3 = [50 25 0]; p4 = [-10 25 0]; 
    plane_x = [p1(1) p2(1) p3(1) p4(1)];
    plane_y = [p1(2) p2(2) p3(2) p4(2)];
    plane_z = [p1(3) p2(3) p3(3) p4(3)];
    fill3(plane_x, plane_y, plane_z, [0.5 0.5 0.5]);
    axis([-10,50,-30,30,0,60]);
    hold off ; grid on



    
