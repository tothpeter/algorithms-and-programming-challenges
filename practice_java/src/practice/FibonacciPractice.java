package practice;

public class FibonacciPractice {
	public static int getNthFibonacciRecursive(int n) {
		return n <= 2 ? n - 1 : getNthFibonacciRecursive(n - 1) + getNthFibonacciRecursive(n - 2); 
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
