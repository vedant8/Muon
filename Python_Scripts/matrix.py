array0 = [0,0,0,0,0,0,0,0,0,0]
array1 = [0,0,0,0,0,0,0,0,0,0]
array2 = [0,0,0,0,0,0,0,0,0,0]
array3 = [0,1,0,0,0,0,0,0,0,0]
array4 = [0,0,1,0,0,0,0,0,0,0]
array5 = [0,0,0,1,0,1,0,0,0,0]
array6 = [0,0,0,0,1,1,0,0,0,0]
array7 = [0,0,0,0,0,1,0,0,0,0]
array8 = [0,0,0,0,0,0,0,0,0,0]
array9 = [0,0,0,0,0,0,0,0,0,0]

matrix= [array0,array1,array2,array3,array4,array5,array6,array7,array8,array9]

i=0
s=0

for i in range(10):
	s=0
	for j in matrix[i]:
		if i%2 == 0:
			print "sample_array("+str(i)+","+str(s)+")<='"+str(j)+"';"
		if i%2 == 1:
			print "    sample_array("+str(i)+","+str(s)+")<='"+str(j)+"';"
		s += 1;