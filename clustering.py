import sys
from os import listdir, getcwd
from os.path import isfile, join
from time import time
from sklearn.cluster import AgglomerativeClustering
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#one for predicting fare
#another for prediction payment type

if __name__ == "__main__":
	
	if len(sys.argv) < 2:
		print ("invalid input")
		print ("usage: python em.py csvdir")
		exit()
		
	dir = sys.argv[1]
	
	if dir[:2] == '.\\':
		dir = getcwd() + dir[1:]
	elif dir[:2] == './':
		dir = getcwd() + '\\' + dir[2:]
		
	onlyfiles = [f for f in listdir(dir) if isfile(join(dir, f))]

	#print (onlyfiles)
	
	for f in onlyfiles:
		print("File: " + f)
		
		df = pd.read_csv(join(dir,f), usecols=range(1,4))
		#print(df)

		nparr = df.as_matrix()
		
		for linkage in ('ward', 'average', 'complete'):
			clustering = AgglomerativeClustering(linkage=linkage, n_clusters=6)
			t0 = time()
			clustering.fit(nparr)
			print("%s : %.2fs" % (linkage, time() - t0))
		
		