% Define the equation you want to find the root of
function y = equation(x)
    y = x^3 - 4*x^2 + 2*x + 1;
end

% Bisection method to find the root of the equation
function roots = bisection_method(equation, a, b, tolerance, max_iterations)
    roots = zeros(1, max_iterations);
    for i = 1:max_iterations
        c = (a + b) / 2;
        roots(i) = c;
        if equation(c) == 0 || (b - a) / 2 < tolerance
            break;
        end
        if sign(equation(c)) == sign(equation(a))
            a = c;
        else
            b = c;
        end
    end
    roots = roots(1:i); % Trim unused elements
end

% Initial interval [a, b], tolerance, and maximum number of iterations
a = -3;
b = 3;
tolerance = 1e-6;
max_iterations = 50;

% Find roots using the bisection method
roots = bisection_method(@equation, a, b, tolerance, max_iterations);

% Plot the equation and the roots
x = linspace(a, b, 400);
y = arrayfun(@equation, x);
plot(x, y, 'b', 'LineWidth', 1.5);
hold on;
plot(roots, zeros(1, length(roots)), 'ro', 'MarkerSize', 8);
title('Bisection Method for Root Finding');
xlabel('x');
ylabel('y');
grid on;
legend('Equation', 'Roots');
