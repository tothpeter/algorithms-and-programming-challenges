package practice;

import static org.junit.Assert.*;

import org.junit.Test;

public class FibonacciPracticeTest {

	@Test
	public void testgGetNthFibonacciRecursive() {
		int input    = 11;
		int expected = 55;
		
		int result = FibonacciPractice.getNthFibonacciRecursive(input);
		
		assertEquals(expected, result);
	}
	
	@Test
	public void testGetNthFibonacciIterative() {
		int input    = 11;
		int expected = 55;
		
		int result = FibonacciPractice.getNthFibonacciIterative(input);
		
		assertEquals(expected, result);
	}

}
