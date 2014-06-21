CodeBook for Project of Coursera course Getting and Cleaning Data 
==================================================================

==============================================
Description of the tidy_data.txt file
==============================================

The original data are downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The codes for production of the tidy_data.txt file from original data set is in run_analysis.R and the processes are described in README.md file. 

The final tidy data file contains data from 30 subjects numbered 1 - 30, each are engaged in 6 activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying), resulting a total of 180 rows of records. Each record contain 2 metadata columns (Subject and Activity) and 79 data column (see below), resulting in (2+79) x 180 = 14,480 data cells. 

===================================================
Description of data column names and their meaning
===================================================

The data are timed signals (denoted as Time) generated from either accelerometer which was then separated into Body_Acceleration signals and Gravity_Acceleration signals, or gyroscope which generated Body_Gyroscopic signals. The measurements on 3-axis produced signals for X-axis, Y_axis and Z_axis. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm(Magnitude). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals (denoted as Frequency). Only mean and standard deviation data were used to generated the final tidy-data files. All data are normalized and thus unit-less.

Thus the column names are separated on the following levels:

A. Time domain vs Frequency domain signals.

B. Body_Acceleration, Gravity_Acceleration, Body_Gyroscopic, 

   Body_Acceleration_Jerk, Body_Gyroscopic_Jerk, 
   
   Body_Acceleration_Magnitude, Body_Gyroscopic_Magnitude, 
   
   Body_Acceleration_Jerk_Magnitude, Body_Gyroscopic_Jerk_Magnitude

C. mean vs StdDev data (also meanFrequency for Frequency domain signals).

D. X_axis, Y_axis, Z_axis.

Finally, data for each of 30 subjects on each of six activities were averaged and reported in the final tidy-data files. 

All data are normalized and thus unit-less.

==============================================
 81 Column names 
==============================================
 1 Subject 
 
 2 Activity 
 
 3 Average_Time_Body_Acceleration_mean_X_axis                      
 4 Average_Time_Body_Acceleration_mean_Y_axis                     
 5 Average_Time_Body_Acceleration_mean_Z_axis                       
 6 Average_Time_Body_Acceleration_StdDev_X_axis                   
 7 Average_Time_Body_Acceleration_StdDev_Y_axis                     
 8 Average_Time_Body_Acceleration_StdDev_Z_axis                   
 9 Average_Time_Gravity_Acceleration_mean_X_axis                    
10 Average_Time_Gravity_Acceleration_mean_Y_axis                   
11 Average_Time_Gravity_Acceleration_mean_Z_axis                    
12 Average_Time_Gravity_Acceleration_StdDev_X_axis                 
13 Average_Time_Gravity_Acceleration_StdDev_Y_axis                  
14 Average_Time_Gravity_Acceleration_StdDev_Z_axis                 
15 Average_Time_Body_Acceleration_Jerk_mean_X_axis                  
16 Average_Time_Body_Acceleration_Jerk_mean_Y_axis                 
17 Average_Time_Body_Acceleration_Jerk_mean_Z_axis                  
18 Average_Time_Body_Acceleration_Jerk_StdDev_X_axis               
19 Average_Time_Body_Acceleration_Jerk_StdDev_Y_axis                
20 Average_Time_Body_Acceleration_Jerk_StdDev_Z_axis               
21 Average_Time_Body_Gyroscopic_mean_X_axis                         
22 Average_Time_Body_Gyroscopic_mean_Y_axis                        
23 Average_Time_Body_Gyroscopic_mean_Z_axis                         
24 Average_Time_Body_Gyroscopic_StdDev_X_axis                      
25 Average_Time_Body_Gyroscopic_StdDev_Y_axis                       
26 Average_Time_Body_Gyroscopic_StdDev_Z_axis                      
27 Average_Time_Body_Gyroscopic_Jerk_mean_X_axis                    
28 Average_Time_Body_Gyroscopic_Jerk_mean_Y_axis                   
29 Average_Time_Body_Gyroscopic_Jerk_mean_Z_axis                    
30 Average_Time_Body_Gyroscopic_Jerk_StdDev_X_axis                 
31 Average_Time_Body_Gyroscopic_Jerk_StdDev_Y_axis                  
32 Average_Time_Body_Gyroscopic_Jerk_StdDev_Z_axis                 
33 Average_Time_Body_Acceleration_Magnitude_mean                    
34 Average_Time_Body_Acceleration_Magnitude_StdDev                 
35 Average_Time_Gravity_Acceleration_Magnitude_mean                 
36 Average_Time_Gravity_Acceleration_Magnitude_StdDev              
37 Average_Time_Body_Acceleration_Jerk_Magnitude_mean               
38 Average_Time_Body_Acceleration_Jerk_Magnitude_StdDev            
39 Average_Time_Body_Gyroscopic_Magnitude_mean                      
40 Average_Time_Body_Gyroscopic_Magnitude_StdDev                   
41 Average_Time_Body_Gyroscopic_Jerk_Magnitude_mean                 
42 Average_Time_Body_Gyroscopic_Jerk_Magnitude_StdDev              
43 Average_Frequency_Body_Acceleration_mean_X_axis                  
44 Average_Frequency_Body_Acceleration_mean_Y_axis                 
45 Average_Frequency_Body_Acceleration_mean_Z_axis                  
46 Average_Frequency_Body_Acceleration_StdDev_X_axis               
47 Average_Frequency_Body_Acceleration_StdDev_Y_axis                
48 Average_Frequency_Body_Acceleration_StdDev_Z_axis               
49 Average_Frequency_Body_Acceleration_meanFrequency_X_axis         
50 Average_Frequency_Body_Acceleration_meanFrequency_Y_axis        
51 Average_Frequency_Body_Acceleration_meanFrequency_Z_axis         
52 Average_Frequency_Body_Acceleration_Jerk_mean_X_axis            
53 Average_Frequency_Body_Acceleration_Jerk_mean_Y_axis             
54 Average_Frequency_Body_Acceleration_Jerk_mean_Z_axis            
55 Average_Frequency_Body_Acceleration_Jerk_StdDev_X_axis           
56 Average_Frequency_Body_Acceleration_Jerk_StdDev_Y_axis          
57 Average_Frequency_Body_Acceleration_Jerk_StdDev_Z_axis           
58 Average_Frequency_Body_Acceleration_Jerk_meanFrequency_X_axis   
59 Average_Frequency_Body_Acceleration_Jerk_meanFrequency_Y_axis    
60 Average_Frequency_Body_Acceleration_Jerk_meanFrequency_Z_axis   
61 Average_Frequency_Body_Gyroscopic_mean_X_axis                    
62 Average_Frequency_Body_Gyroscopic_mean_Y_axis                   
63 Average_Frequency_Body_Gyroscopic_mean_Z_axis                    
64 Average_Frequency_Body_Gyroscopic_StdDev_X_axis                 
65 Average_Frequency_Body_Gyroscopic_StdDev_Y_axis                 
66 Average_Frequency_Body_Gyroscopic_StdDev_Z_axis                 
67 Average_Frequency_Body_Gyroscopic_meanFrequency_X_axis          
68 Average_Frequency_Body_Gyroscopic_meanFrequency_Y_axis          
69 Average_Frequency_Body_Gyroscopic_meanFrequency_Z_axis           
70 Average_Frequency_Body_Acceleration_Magnitude_mean              
71 Average_Frequency_Body_Acceleration_Magnitude_StdDev             
72 Average_Frequency_Body_Acceleration_Magnitude_meanFrequency     
73 Average_Frequency_Body_Acceleration_Jerk_Magnitude_mean          
74 Average_Frequency_Body_Acceleration_Jerk_Magnitude_StdDev       
75 Average_Frequency_Body_Acceleration_Jerk_Magnitude_meanFrequency 
76 Average_Frequency_Body_Gyroscopic_Magnitude_mean                
77 Average_Frequency_Body_Gyroscopic_Magnitude_StdDev               
78 Average_Frequency_Body_Gyroscopic_Magnitude_meanFrequency       
79 Average_Frequency_Body_Gyroscopic_Jerk_Magnitude_mean           
80 Average_Frequency_Body_Gyroscopic_Jerk_Magnitude_StdDev        
81 Average_Frequency_Body_Gyroscopic_Jerk_Magnitude_meanFrequency 

-----------------
End of file

