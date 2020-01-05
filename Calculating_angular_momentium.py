import	matplotlib as plt
import numpy as np
import	math
import sympy

#The input variables are equ in the form of a differential expression in x
#and X has to be symbolic  
# conv is convergence criteria
#F is the number solving for 
#ittera_max is the max number of allowed itterations
#x=s is the initial guess
#The returned values are i, the number of itterations performed
#s is the value of the number that the problem converged to (or a diverged number if no solution)
#and fval which should be close to zero if converged

def Newtons_Method_Function(equ,conv,F,ittera_max,s):

# Establishing Itterational Variables for Newton's Method 

    error=[0] * ittera_max
    i=0
    boolean=1
    x = sp.Symbol('x')

    # Itteration of Newton's Method

    while boolean==1 & i<=ittera_max:
    
        f = equ-F
        fval = f.subs(x,s)
        fval = double(solve(fval))
        diff = sympy.diff(f)
        df = vpa(diff.subs(x,s))
        df = vpa(df.subs(diff(f),x,s))
        df = vpa(df.subs(f,f))
        df = double(df)
        x_new = s-fval/df
        error.insert(i,abs(x_new-s))
        
        if (error(i)>=conv):
            
            boolean=1
            
        else:
            
            boolean=0
            
        s=x_new
	
        i=i+1

    return (i,s,fval)

def main():

    #First Robot Data
    x = input("Distance left robot is from middle (ft) Remember the central component is 3 in thick = ") #Distance for I calculation 
    m1 = input("Weight left robot is from middle (lbs) = ")/32.2  #mass for I calculation

    #Second robot data
    y = input("Distance right robot is from middle (ft) Remember the central component is 3 in thick = ") #Distance for I calculation 
    m2 = input("Weight right robot is from middle (lbs) = ")/32.2  #mass for I calculation

    angle_desired = 8*math.pi()/180  #Max angle allowed for determining sensitivity of system and offset from ideal

    cg = (2*12+2)/12 #CG of the support structure location in ft (converted from 2 ft 2 in to feet with percentages)
 
    ms = 93 #Mass of suppport structure in lbsf

    h = 54.375/12 #Distance from central pivot to the rung calcualted from the total 9 ft 3 and 3/8 in hight
			    #and the subtraction of the initial starting height of the rung of 5 ft 3 in converted to feet
				
    R1 = math.sqrt( x ** 2 + h ** 2 ) 
    R2 = math.sqrt( y ** 2 + h ** 2 )
    
    
    
    return 0

main()
