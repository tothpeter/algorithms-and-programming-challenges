package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P28ParenthesesMatchingTest {

	@Test
	public void testMatches() {
		String inputString = "a(b(c)d)";
		int expectedResult = 7;
		
		int result = P28ParenthesesMatching.matches(inputString, 1);
		
		assertEquals(expectedResult, result);
	}
	
	@Test
	public void testMatchesWhenOneClosingParenthesesIsMissing() {
		String inputString = "a(b(cd)";
		int expectedResult = -1;
		
		int result = P28ParenthesesMatching.matches(inputString, 1);
		
		assertEquals(expectedResult, result);
	}

}
