package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P27ReverseWordsTest {

	@Test
	public void testReverseWords() {
		String input          = "find you will pain only go you recordings security the into if";
		String expectedResult = "if into the security recordings you go only pain will you find";
		  
		String result = P27ReverseWords.reverseWords(input);

	  	assertEquals(expectedResult, result);
	}

}
