package practice;

import static org.junit.Assert.*;

import org.junit.Test;

public class FibonacciWithMemoizePracticeTest {

	@Test
	public void testgGetNthFibonacciRecursive() {
		int input    = 11;
		int expected = 55;
		
		FibonacciWithMemoizePractice fiber = new FibonacciWithMemoizePractice();
		
		int result = fiber.getNthFibonacciRecursive(input);
		
		assertEquals(expected, result);
	}
}
