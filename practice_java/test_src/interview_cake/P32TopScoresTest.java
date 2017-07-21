package interview_cake;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.Test;

public class P32TopScoresTest {

	@Test
	public void testGetSortedScores() {
		int[] unsortedScores = { 37, 89, 41, 65, 91, 53 };
		int[] expectedResult = new int[] { 91, 89, 65, 53, 41, 37 };
		
		int[] result = P32TopScores.getSortedScores(unsortedScores, 100);
		
		assertEquals(Arrays.toString(expectedResult), Arrays.toString(result));
	}
	
	@Test
	public void testGetSortedScoresWhenWeHaveDuplicatedScores() {
		int[] unsortedScores = { 3, 3, 5, 4 };
		int[] expectedResult = new int[] { 5, 4, 3, 3 };
		
		int[] result = P32TopScores.getSortedScores(unsortedScores, 5);
		
		assertEquals(Arrays.toString(expectedResult), Arrays.toString(result));
	}

}
