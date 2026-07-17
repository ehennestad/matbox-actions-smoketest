function total = addNumbers(a, b)
% addNumbers - Return the sum of two numbers
%
%   total = smoketest.addNumbers(a, b) returns a + b.
%
%   This trivial function exists only to give the matbox-actions smoke-test
%   toolbox something to analyse, test, and package.

    arguments
        a (1,1) double
        b (1,1) double
    end

    total = a + b;
end
