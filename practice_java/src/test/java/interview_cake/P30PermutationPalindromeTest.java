package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P30PermutationPalindromeTest {

	@Test
	public void testAnyPermutationIsAPalindromeOf() {
		String inputString = "civic";
		
		boolean result = P30PermutationPalindrome.anyPermutationIsAPalindromeOf(inputString);
		
		assertEquals(true, result);
	}
	
	@Test
	public void testAnyPermutationIsAPalindromeOfForFalseCase() {
		String inputString = "cikc";
		
		boolean result = P30PermutationPalindrome.anyPermutationIsAPalindromeOf(inputString);
		
		assertEquals(false, result);
	}

}
