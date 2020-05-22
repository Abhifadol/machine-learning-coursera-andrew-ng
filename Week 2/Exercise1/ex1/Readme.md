# Programming Exercise 1 #
Linear Regression

## 1. Simple octave function ##

### Return 5x5 identity matrix in `warmUpExercises.m` ###

	A = eye(5);

## 2. Linear regression with one variable ##

### Loading the Data ###

	data = load('ex1data1.txt'); 		% read comma separated data
	X = data(:, 1); y = data(:, 2);
	m = length(y);						% number of training examples

### Plotting the Data in `plotData.m` ###

	figure; % open a new figure window

        plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
        ylabel('Profit in $10,000s'); % Set the y􀀀axis label
        xlabel('Population of City in 10,000s'); % Set the x􀀀axis label

### Gradient Descent ###

Cost Funtion: \\( J(\theta) = \frac{1}{2m} \sum\_{i=1}^{m} (h\_{\theta}(x^{(i)}) - y^{(i)})^{2} \\) where the hypothesis \\( h\_{\theta}(x^{(i)}) \\) is given by \\( h\_{\theta}(x^{(i)}) = \theta^{T}x = \theta\_{0} + \theta\_{1}x\_{1} \\).

In batch gradient descent, each iteration performs the update:
\\[ \theta\_{j} := \theta\_{j} - \alpha \frac{1}{m} \sum\_{i=1}^{m}(h\_{\theta}(x^{(i)}) - y^{(i)})x\_{j}^{(i)} \qquad \text{(simultaneously update } \theta\_{j} \text{ for all j )} \\]

**Implementation**

	X = [ones(m, 1), data(:,1)]; 	% Add a column of ones to x
	theta = zeros(2, 1); 			% initialize fitting parameters
	iterations = 1500;
	alpha = 0.01;

### Compute the cost \\( J(\theta) \\) in `computeCost.m` ###

My solution uses `sum` which sum up each column and `.^` which is power by element.:

	J = 1 / (2 * m) * sum(((X * theta) - y).^2);

### Gradient Descent in `gradientDecent.m`###

My solution uses two transpose `'` to perform matrix product:

	theta_0 = theta(1) - alpha / m * sum(X * theta - y);
        theta_1 = theta(2) - alpha / m * sum((X * theta - y) .* X(:, 2));

        theta = [theta_0; theta_1]

### Visualizing \\( J(\theta) \\) ###

	% initialize J vals to a matrix of 0's
	J vals = zeros(length(theta0 vals), length(theta1 vals));
	% Fill out J vals
	for i = 1:length(theta0 vals)
		for j = 1:length(theta1 vals)
			t = [theta0 vals(i); theta1 vals(j)];
			J vals(i,j) = computeCost(x, y, t);
		end
	end

## Linear regression with multiple variables ##

### Feature Normalization in `featureNormalize.m` ###

Two tasks:

- Subtract the mean value of each feature from the dataset.
- After subtracting the mean, additionally scale (divide) the feature values
by their respective "standard deviations". In Octave, you can use the `std` function to
compute the standard deviation.

My solution uses `repmat` to duplicate `mu` and `sigma` to fit the size of `X`:

	mu = mean(X)
       sigma = std(X)

       for iter = 1:size(X, 2)
         X_norm(:,iter) = (X(:,iter) - mu(iter)) / sigma(iter);
       end

### Feature Normalization in `computeCostMulti.m` ###

     J = 1 / (2 * m) * sum(((X * theta) - y).^2);
 
### Feature Normalization in `gradientDescentMulti.m` ###
 
    delta = (1 / m * (X * theta - y)' * X)';

    theta = theta - alpha * delta;
    
### Feature Normalization in `normalEqn.m` ###

    theta = pinv(X' * X) * X' * y
    
