function [T] = Calc_T(Theta)

    c=cosd(Theta);
    s=sind(Theta); 
    
    T=[c^2,s^2,-2*c*s;s^2,c^2,2*c*s;c*s,-c*s,c^2-s^2];

end