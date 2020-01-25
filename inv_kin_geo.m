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
    




    
