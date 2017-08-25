import numpy 


global n 

# change the value of the n for a different matrix (nxn)
n=8

def left_bound(a):
	print "left_bound"+str(a)+"<=",
	for j in range(a,n-a-1):
		print "sample_array("+str(a)+','+str(j)+")"+"+",
	print "sample_array("+str(a)+','+str(n-a-1)+")"

def right_bound(a):
	print "right_bound"+str(a)+"<=",
	for j in range(a,n-a-1):
		print "sample_array("+str(n-a-1)+','+str(j)+")"+"+",
	print "sample_array("+str(n-a-1)+','+str(n-a-1)+")"

def lower_bound(a):
	print "lower_bound"+str(a)+"<=",
	for j in range(a,n-a-1):
		print "sample_array("+str(j)+','+str(a)+")"+"+",
	print "sample_array("+str(n-a-1)+','+str(a)+")"

def up_bound(a):
	print "up_bound"+str(a)+"<=",
	for j in range(a,n-a-1):
		print "sample_array("+str(j)+','+str(n-a-1)+")"+"+",
	print "sample_array("+str(n-a-1)+','+str(n-a-1)+")"

for j in range(n//2):
	left_bound(j)
	# print ''
	right_bound(j)
	# print '' 
	lower_bound(j)
	# print ''
	up_bound(j)
	print ''


