function A = warmUpExercise()
%WARMUPEXERCISE Example function in octave
%   A = WARMUPEXERCISE() is an example function that returns the 5x5 identity matrix

A = [];

% ============= YOUR CODE HERE ==============
% Instructions: Return the 5x5 identity matrix 
%               In octave, we return values by defining which variables
%               represent the return values (at the top of the file)
%               and then set them accordingly. 


A = eye(5);

data = load('ex1data1.txt'); 		% read comma separated data
X = data(:, 1); y = data(:, 2);
m = length(y);




% ===========================================


end
