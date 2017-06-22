package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P03HighestProductOf3Test {

	@Test
	public void testBasicCase() {
		int[] inputList = new int[] { 0, 5, 10, 1, 0, 0 };
		int expectedResult = 50;

		int result = P03HighestProductOf3.highestProductOf3(inputList);

		assertEquals(expectedResult, result);
	}
	
	@Test
	public void testWhenWeHaveNegativeNumbers() {
		int[] inputList = new int[] { -2, 5, 10, 1, 0, 0 };
		int expectedResult = 50;

		int result = P03HighestProductOf3.highestProductOf3(inputList);

		assertEquals(expectedResult, result);
	}
	
	@Test
	public void testWhenANegativePairIsABetterChoiche() {
		int[] inputList = new int[] { -10, 0, 1, 3, 2, -10 };
		int expectedResult = 300;

		int result = P03HighestProductOf3.highestProductOf3(inputList);

		assertEquals(expectedResult, result);
	}

}
