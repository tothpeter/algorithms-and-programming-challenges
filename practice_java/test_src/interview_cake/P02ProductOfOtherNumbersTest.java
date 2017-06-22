package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;
import java.util.Arrays;

public class P02ProductOfOtherNumbersTest {

	@Test
	public void testGeneralCase() {
		int[] inputList = new int[] { 1, 7, 3, 4 };
		int[] expectedList = new int[] { 84, 12, 28, 21 };

		int[] result = P02ProductOfOtherNumbers.getProductsOfAllIntsExceptAtIndex(inputList);

		assertEquals(Arrays.toString(expectedList), Arrays.toString(result));
	}

	@Test
	public void testInputWithAZero() {
		int[] inputList = new int[]    { 1, 0, 2, 4 };
		int[] expectedList = new int[] { 0, 8, 0, 0 };

		int[] result = P02ProductOfOtherNumbers.getProductsOfAllIntsExceptAtIndex(inputList);
		
		assertEquals(Arrays.toString(expectedList), Arrays.toString(result));
	}

}
