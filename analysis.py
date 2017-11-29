#Analyzing NYC yellow cab data for Sept 2016
#Trying to get the list of dropoff locationID based on the specific pickup locationID(Columbia University)
#And then generating the heat map for the drop LocationID and check if they are specific to any Tourist attraction
#We are targetting the College Students(here of Columbia University) for Fall(Sept) and Spring(Feb) and
#See if there is any pattern in students travel habits at the start of the semester.
#Finally we can compare it with the end of semester patterns if there is any similarity
# (or difference - which would make more sense)


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from scipy.stats import norm
from sklearn.preprocessing import StandardScaler
from scipy import stats
import warnings
warnings.filterwarnings('ignore')

df = pd.read_csv('')
