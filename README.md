# Objective-C ARC Memory Leak

This repository demonstrates a common memory leak scenario in Objective-C when using Automatic Reference Counting (ARC) and strong properties.  The `bug.m` file shows the problematic code, while `bugSolution.m` provides the corrected version.

## Problem
The issue arises from repeated calls to a method that allocates a new object for a strong property without properly managing the previous object. This leads to a chain of retained objects, consuming memory over time.  A memory leak is the result.

## Solution
The solution involves using `weak` properties or better controlling object allocation to prevent unnecessary retention. The `bugSolution.m` demonstrates this correction.