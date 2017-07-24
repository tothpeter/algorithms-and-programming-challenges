package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P26ReverseStringInPlaceTest {

	@Test
	public void testReverse() {
		String input = "abc";
		String expectedResult = "cba";
		
		String result = P26ReverseStringInPlace.reverse(input);
		
		assertEquals(expectedResult, result);
	}

}
