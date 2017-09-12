package practice;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.junit.Assert.*;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

@RunWith(Spectrum.class)
public class StringPracticeTest {{
	
	describe(".reverseInPlace", () -> {
		describe("when the length of the input is an even number", () -> {
			it("reverses the given string", () -> {
				String input    = "abc";
				String expected = "cba";
				
				String result = StringPractice.reverseInPlace(input);
				
				assertEquals(expected, result);
			});
		});
		
		describe("when the length of the input is an odd number", () -> {
			it("reverses the given string", () -> {
				String input    = "abcd";
				String expected = "dcba";
				
				String result = StringPractice.reverseInPlace(input);
				
				assertEquals(expected, result);
			});
		});
	});
}}
