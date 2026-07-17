classdef AddNumbersTest < matlab.unittest.TestCase
% AddNumbersTest - Unit tests for smoketest.addNumbers

    methods (Test)
        function returnsSum(testCase)
            testCase.verifyEqual(smoketest.addNumbers(2, 3), 5)
        end

        function handlesNegativeValues(testCase)
            testCase.verifyEqual(smoketest.addNumbers(-4, 1), -3)
        end
    end
end
