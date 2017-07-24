package practice;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.Test;

public class FizzBuzzTest {

	@Test
	public void testPerform() {
		String[] result = FizzBuzz.perform(15);
		String[] expectedResult = {"1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz" };
		
		assertEquals(Arrays.toString(expectedResult), Arrays.toString(result));
	}

}
