import pandas
from sklearn import model_selection
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.ensemble import VotingClassifier


# Added below code to convert string to seconds(int) and
# replace all the values in time column, but takes a lot of time,
# See if you have better solution which is quicker

def get_sec(time_str):
    h, m, s = time_str.split(':')
    return int(h) * 3600 + int(m) * 60 + int(s)

dataframe = pandas.read_csv('C:/Users/abhishek.suntwal/Downloads/feb_2015_data.csv')
for i in range(len(dataframe)):
     dataframe.loc[i,'time'] = get_sec(dataframe.time[i])

print dataframe.time[0]
array = dataframe.values
X = array[:, 0:5]
Y = array[:, 5]

seed = 7
kfold = model_selection.KFold(n_splits=10, random_state=seed)
# create the sub models
estimators = []
model1 = LogisticRegression()
estimators.append(('logistic', model1))
model2 = DecisionTreeClassifier()
estimators.append(('cart', model2))
model3 = SVC()
estimators.append(('svm', model3))
# create the ensemble model
ensemble = VotingClassifier(estimators)
results = model_selection.cross_val_score(ensemble, X, Y, cv=kfold)
print(results.mean())
