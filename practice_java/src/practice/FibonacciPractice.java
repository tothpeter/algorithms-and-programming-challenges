package practice;

import java.util.HashMap;
import java.util.Map;

public class FibonacciPractice {
	
	private static Map<Integer, Integer> memo = new HashMap<>();
	
	public static int getNthFibonacciRecursive(int n) {
		if (n <= 2) {
			return n - 1;
		}
		
		if (memo.containsKey(n)) {
			return memo.get(n);
		}
		
		int result = getNthFibonacciRecursive(n - 1) + getNthFibonacciRecursive(n - 2);
		
		memo.put(n, result);
		
		return result;
	}
	
	public static int getNthFibonacciIterative(int n) {
		int a = 0, b = 1, sum;

		for (int i = 1; i < n; i++) {
			sum = a + b;
			a = b;
			b = sum;
		}
		
		
		return a;
	}
}
