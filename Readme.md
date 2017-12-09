NYC Taxi Data Analysis
======================

New York City Yellow Taxi Data analytics to predict the payment type and total amount a single taxi trip costs with pickup from Columbia University and New York University.

Includes exploration in Machine Learning with 

- Ensembles learning with Voted Classifier 

- Unsupervised Learning with Hierarchical Clusters

- Feature Extraction with Pipelining through PCA

Prequisites
-----------

- Python 2.7

- R x64 

- RStudio

- Numpy

- scikit-learn for Python package

- Caret Ensembles package for R

Running Programs in R
---------------------

Use RStudio to open and run the R files within the current directory

Running Programs in Python
--------------------------

Use either command line or notebook to run the Python files within this directory

Execution
--------

1. Download this repo with `git clone https://github.com/millyxun/NYC-College-Taxi.git`

2. Create the following folders inside this directory

- `clusters`

- `extracted_data`

- `yellow_taxi_data`

- `nyu`

- `columbia`

3. Download the following files from [this link](http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml) into the newly created `yellow_taxi_data` folder

- yellow_tripdata_2015-09.csv

- yellow_tripdata_2014-09.csv

- yellow_tripdata_2013-09.csv

- yellow_tripdata_2016-02.csv

- yellow_tripdata_2015-02.csv

- yellow_tripdata_2014-02.csv

- yellow_tripdata_2013-02.csv

They are order by year and month on the website so download the Yellow data for 2013-2016 February and 2013-205 September from the link above.
  
4. Open RStudio and run the file `get_all_data_for_NYU_CU_sept_feb.R`

5. After this program has completed, to continue on to ensembles, pipelining, and prediction through that skip to step 8
6. In RStudio run the file `clustering.r`, to change the file read, manually change the path in line 25 of this file.

7. This program steps through [the hourly heat map shown in this directory](./feb_drop_off_heat_map.PNG) first then show the subsets of the data plotted as the three types of clusters used (complete, average, single). The data will be available in the cluster folder.

8. Run any of the pred_INSERTNAME.py files to get the prediction on the files where they will be printed out.

Error(s)?
---------

### File does not exist

It does exist, but there are two options

1. Set up the working directory to Documents and make folder GitHub and rename the repo to "NYC-College-Taxi" if it is not called that

2. Manually go through every file and change the paths to where these folders and files are located in.


Contributor(s)
--------------

- Abhishek Suntwal

- Milly Xun