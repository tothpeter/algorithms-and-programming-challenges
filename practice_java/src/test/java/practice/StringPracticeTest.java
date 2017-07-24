package practice;

import static org.junit.Assert.*;

import org.junit.Test;

public class StringPracticeTest {

	@Test
	public void testReverseWhenInputIsEvenLong() {
		String input    = "abc";
		String expected = "cba";
		
		String result = StringPractice.reverse(input);
		
		assertEquals(expected, result);
	}
	
	@Test
	public void testReverseWhenInputIsOddLong() {
		String input    = "abcd";
		String expected = "dcba";
		
		String result = StringPractice.reverse(input);
		
		assertEquals(expected, result);
	}

}
