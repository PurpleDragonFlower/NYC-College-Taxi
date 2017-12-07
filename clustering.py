import sys
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
		print ("usage: python em.py csvfile")
		exit()
		
	df = pd.read_csv(sys.argv[1], usecols=range(1,4))
	#print(df)
	nparr = df.as_matrix()
	print(nparr)

	for linkage in ('ward', 'average', 'complete'):
		clustering = AgglomerativeClustering(linkage=linkage, n_clusters=6)
		t0 = time()
		clustering.fit(nparr)
		print("%s : %.2fs" % (linkage, time() - t0))