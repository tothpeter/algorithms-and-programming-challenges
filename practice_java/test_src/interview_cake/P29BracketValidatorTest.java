package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P29BracketValidatorTest {

	@Test
	public void testIsValid() {
		String inputString = "{ [ ] ( ) }";
		
		boolean result = P29BracketValidator.isValid(inputString);
		
		assertEquals(true, result);
	}
	
	@Test
	public void testIsValidWhenTheInputIsNotValid() {
		String inputString = "{ [ ( ] ) }";
		
		boolean result = P29BracketValidator.isValid(inputString);
		
		assertEquals(false, result);
		
		inputString = "{ [ }";
		
		result = P29BracketValidator.isValid(inputString);
		
		assertEquals(false, result);
		
		inputString = "{  } }";
		
		result = P29BracketValidator.isValid(inputString);
		
		assertEquals(false, result);
	}

}
