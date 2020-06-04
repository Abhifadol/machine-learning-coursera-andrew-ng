# Programming Exercise 3 #
Multi-class Classification and Neural Networks

## 1. Multi-class Classification ##

### Dataset ###

	% Load saved matrices from file
	load('ex3data1.mat');
	% The matrices X and y will now be in your Octave environment

### Vectorizing Logistic Regression in `lrCostFunction.m` ###

The same as `costFunctionReg.m` in Programming Exercise 2.

### One-vs-all Classification in `oneVsAll.m` ###

My solution calculate `theta` in each iteration for one class. `theta` is the `c`th row of `all_theta`, and `y == c` will give 1 if belongs to class c. Notice that theta should be a column vector.

	function [all_theta] = oneVsAll(X, y, num_labels, lambda)
		all_theta = zeros(num_labels, n + 1);
		options = optimset('GradObj', 'on', 'MaxIter', 50);
		
		for c = 1 : num_labels
			theta = all_theta(c,:)';
			all_theta(c,:) = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), theta, options);
		end
	end

### One-vs-all Prediction in `predictOneVsAll.m` ###

My solution calculates \\( z = \theta^{T}x \\) and \\( h\_{\theta}(x) = g(z) \\). Notice the use of `max`.

	z = X * all_theta';
	h = sigmoid(z);
	[m, p]= max(h, [], 2)

## 2. Neural Networks ##

### Model representation ###

### Feedforward Propagation and Prediction in `predict.m` ###

My solution uses `a1`, `a2` and `a3` to represent input layer, hidden layer and output layer, respectively. `a2` and `a3` are calculated by applying logistic regression function with parameter `Theta1` and `Theta2`, respectively.

	function p = predict(Theta1, Theta2, X)
		a1 = X;
		a2 = sigmoid( [ones(m, 1) a1] * Theta1' );
		a3 = sigmoid( [ones(m, 1) a2] * Theta2' );
		[m, p]= amx(a3, [], 2)
	end
