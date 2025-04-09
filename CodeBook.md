Data was sourced from UCI HAR Dataset.

Variables
subject: An identifier for each subject who participated in the experiment (1 to 30).
activity: Descriptive name of the activity performed while wearing the smartphone (e.g., WALKING, WALKING_UPSTAIRS, etc.).
tBodyAcc-mean()-X: Mean value of the body acceleration (X axis).
tBodyAcc-mean()-Y: Mean value of the body acceleration (Y axis).
tBodyAcc-mean()-Z: Mean value of the body acceleration (Z axis).
tBodyAcc-std()-X: Standard deviation of the body acceleration (X axis).
tBodyAcc-std()-Y: Standard deviation of the body acceleration (Y axis).
tBodyAcc-std()-Z: Standard deviation of the body acceleration (Z axis).

Data Cleaning & Transformation Steps
Combined the training and testing datasets.
Selected only mean and standard deviation features based on specific regex.
Replaced activity numbers with descriptive names to enhance readability.
Renamed variable names for clarity.

