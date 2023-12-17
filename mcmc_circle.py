import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set_style('white')
sns.set_context('paper')

#plt.figure(figsize=(8,8))  # set the figure size

radius = 3

N = 100000  #Use 10000 points 
X = np.random.uniform(low=-radius, high=radius, size=N)  # Random numbers from -1 to 1
Y = np.random.uniform(low=-radius, high=radius, size=N)   

# calculate the distance from the center 
R = np.sqrt(X**2+Y**2);  

box_area =(2.0*radius)**2      # This is the big box 
is_point_inside = R<radius
N_inside=np.sum(is_point_inside)
circle_area = box_area*N_inside/N

plt.scatter(X,Y, c=is_point_inside, s=5.0, edgecolors='none', cmap=plt.cm.Paired)  
plt.axis('equal')

plt.show()
print ("Area of the circle = ", circle_area)
print ("pi = ", circle_area/radius**2)

# Dan's think-through

# N = 100000.0 # number of points
# radius = 1.0 # radius of circle

# # generate points in circumscribing square
# X = np.random.uniform(low=-radius, high=radius, size=int(N))
# Y = np.random.uniform(low=-radius, high=radius, size=int(N))

# origin_dist_sqr = X*X + Y*Y
# is_in_circle = origin_dist_sqr < radius ** 2
# in_circle = np.sum(is_in_circle)

# square_area = (2 * radius) ** 2
# circle_area = in_circle / N * square_area
# pi_approx = circle_area/radius ** 2  # manipulate A = pi*r**2

# plt.scatter(X, Y, c=is_in_circle, edgecolors='none', cmap=plt.cm.Blues)
# plt.axis('equal')
# plt.show()
# print ('Circle area:', circle_area)
# print ('Pi approximation with %4s trials is %.6s' % (str(int(N)), pi_approx))