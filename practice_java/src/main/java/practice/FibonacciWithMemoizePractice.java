package practice;

import java.util.HashMap;
import java.util.Map;

public class FibonacciWithMemoizePractice {
	
	private Map<Integer, Integer> memo = new HashMap<>();
	
	public int getNthFibonacciRecursive(int n) {
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
}
