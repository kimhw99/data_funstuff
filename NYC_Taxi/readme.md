**Project Report**  
Hyeonwook Kim

**Introduction**  
I am a data scientist working at a ride-hailing company like Uber or Lyft. The company wants to improve driver allocation and pricing strategies by predicting ride demand in New York City. The goal is to optimize driver availability and reduce wait times for customers while maximizing driver earnings. I plan to build a model that predicts hourly ride demand in various city zones based on factors such as historical ride data and time-of-day. I will use the New York City Taxi Trip Data from the NYC TLC (Taxi and Limousine Commission) [https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

**Method**  
Given that the task at hand is to predict a continuous variable, 4 variants of multilinear regression models were chosen for the task. This was preferred over neural network based solutions, which may yield better performance but can also come at the cost of more computation power. Given that the dataset itself consists of roughly 40,000,000 samples, using a more basic model was preferred. The first model was a standard multilinear regression model, another two with either L1 or L2 regularization (Lasso & Ridge Regression) and a final model that used a 0.5 ratio of both (Elastic-Net) with the alpha set to 0.0001. Each model was optimized with Stochastic Gradient Descent with Mean Square Error loss. The initial initial learning rate was set to 0.005, decreasing with an invscaling factor. The learning rate for each iteration is given by:

lrt=lr0t0.25

Where t represents the timestep iteration and lrt represents the learning rate at timestep t. By gradually lowering the learning rate, it allows the optimizer to converge better and prevents oscillations. Each model was trained over 500 epochs, but the models would also stop training if the loss was below a tolerance factor of 0.0001 for 5 epochs. This means that once the algorithm determines that a model has converged, it no longer needs to expend additional effort on unnecessary gradient descent computations. 

**Feature Engineering**  
Most of the feature engineering tasks involved encoding categorical variables with a one-versus-all classification strategy so that a linear model could better understand them. For example, NYC taxi pickup-zone codes are numbers ranging from 1 to 265, each representing a specific part of the city. For example, 45 represents Chinatown in Manhattan. The values of these locations are provided by a separate *taxi\_zone\_lookup.csv* table. These numbers were grouped up by their respective borough and one-hot-encoded for each column. A similar method was employed for time and month, where each hour and month was encoded as a new column. This allows the linear models to better interpret categorical data, but comes at the cost of additional data and calculation complexity. Non-numeric data was dropped or converted into a numeric format when possible, such as the pickup-datetime. 

A travel time column was also computed by subtracting the pickup date-time from the drop-off datetime. However, to account for multicollinearity, the dropoff date-time variable was dropped. Although this is a seemingly useless feature, there were two reasons behind doing this. Firstly, a linear model would better understand a “time difference” variable that acts like a continuous variable and one that scales linearly, as opposed to an “end time” variable which acts more like a discrete variable. Another reason was that encoding the date-time would need additional columns to represent each month, day, hour etc. By calculating the time difference between the start and end time, the hope was to retain the same information without needing to create additional dimensions in the data.

Finally the data was normalized using a min-max scaler for easier calculations, and was processed into each model.

**Results**

| Model                | R-Squared (Train) | R-Squared (Test) | MSE (Train) | MSE (Test) |
| :------------------- | :---------------- | :--------------- | :---------- | :--------- |
| **Linear Regression** | 0.7027             | 0.7031            | 0.0091      | 0.0091     |
| **L1 Regularization** | 0.6951             | 0.6955            | 0.0092      | 0.0092     |
| **L2 Regularization** | 0.7008             | 0.7011            | 0.0091      | 0.0092     |
| **Elastic-Net**       | 0.6986             | 0.6989            | 0.0091      | 0.0091     |


*Table 1: Benchmarks for each model*

Table 1 shows the training results for each model. The Linear and Ridge Regression models are shown to best fit both training and testing data, with R-Square values above 0.7. Models that utilize Lasso regression seem to underperform compared to the models that don’t utilize it. The dataset that is being worked with is one with lots of features, and Lasso regression performing worse could indicate that there does not exist a few specific variables within the dataset that is a significant contributor to the model’s predictive power, at least at face value. This would be especially true for the engineered features, where one column would not be representative of the whole factor, and must be looked at holistically.

|  | Training Time | Testing Time |
| :---- | :---- | :---- |
| **Linear Regression** | 90.2638 | 15.6493 |
| **L1 Regularization** | 149.6564 | 21.5688 |
| **L2 Regularization** | 101.3283 | 18.1478 |
| **Elastic-Net** | 163.2633 | 21.5634 |

*Table 2: Training and Testing Times* 

Table 2 shows the training and testing times for each model. Once again, Linear and L2 regression shows better performance with lower times for both testing and training times, while L1 and Elastic-Net need more time. 

It is notable that the Ridge Regression model performs worse compared to the raw Multilinear Regression model both in terms of time and performance, when L2 is usually used on large datasets to prevent overfitting, penalize large coefficients and converge faster. The models themselves are not necessarily overfitting to the data, which is supported by Table 1 that shows the benchmark scores for training and testing data is virtually identical across all 4 models. While this can be seen as evidence that the data is not prone to overfitting, the complexity of the data also suggests that the models themselves are too simple.

**Conclusion**  
While the Linear and Ridge Regression models both showed signs of underfitting to the data, both models showed an R-Square value of 0.7, which explains much of the variance in the data with relatively good performance, and could be used in real-time applications for drivers to estimate hourly rider demand. However, several improvements could be made to the project in the future. 

Firstly, the data could be tested for multicollinearity or homoscedasticity between variables to ensure that the dataset is a good fit for the model. Using eigenvalues or VIF to determine correlations between variables and dropping highly correlated variables would reduce computational demand without losing model performance, for example.

Using alternate models such as SVD or ensemble models could also result in a better fit to the data compared to simple multilinear models. Incorporating additional data points or additional feature engineering such as adding specific holiday dates could also benefit predictive power.
