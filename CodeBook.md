# Project submission for Coursera Geting And Cleaning Data course

## Code book for [data.txt](https://s3.amazonaws.com/coursera-uploads/user-de7c826a7dcbf3761f72cca1/973499/asst-3/78362770cecd11e4ac39d73161853c99.txt)

For a general description of the experiments recorded see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

### Data Columns

#### activitylabel

Identifies the activity recorded
For a video of the experiment including an example of the 6 recorded activities see http://www.youtube.com/watch?v=XOEN9W05_4A

#### subjectnr

Identifies the subject who performed the activity. Its range is from 1 to 30

#### all other columns

##### Original data - filtered and names tidied

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.Accelerometer.XYZ and time.Gyroscope.XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.Body.Accelerometer.XYZ and time.Gravity.Accelerometer.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.Body.Accelerometer.Jerk.XYZ and time.Body.Gyroscope.Jerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.Body.Accelerometer.Magnitude, time.Gravity.Accelerometer.Magnitude, time.Body.Accelerometer.Jerk.Magnitude, time.Body.Gyroscope.Magnitude, time.Body.Gyroscope.Jerk.Magnitude). 

Subsequently a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency.Body.Accelerometer.XYZ, frequency.Body.Accelerometer.Jerk.XYZ, frequency.Body.Gyroscope.XYZ, frequency.Body.Accelerometer.Magnitude, frequency.Body.Body.Accelerometer.Jerk.Magnitude, frequency.Body.Body.Gyroscope.Magnitude, frequency.Body.Body.Gyroscope.Jerk.Magnitude

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* time.Body.Accelerometer.XYZ
* time.Gravity.Accelerometer.XYZ
* time.Body.Accelerometer.Jerk.XYZ
* time.Body.Gyroscope.XYZ
* time.Body.Gyroscope.Jerk.XYZ
* time.Body.Accelerometer.Magnitude
* time.Gravity.Accelerometer.Magnitude
* time.Body.Accelerometer.Jerk.Magnitude
* time.Body.Gyroscope.Magnitude
* time.Body.Gyroscope.Jerk.Magnitude
* frequency.Body.Accelerometer.XYZ
* frequency.Body.Accelerometer.Jerk.XYZ
* frequency.Body.Gyroscope.XYZ
* frequency.Body.Accelerometer.Magnitude
* frequency.Body.Body.Accelerometer.Jerk.Magnitude
* frequency.Body.Body.Gyroscope.Magnitude
* frequency.Body.Body.Gyroscope.Jerk.Magnitude

The set of variables that were estimated from these signals are: 

* .mean: Mean value
* .std: Standard deviation

##### Coursera project

Finally all resulting variables were averaged for each activity and each subject
