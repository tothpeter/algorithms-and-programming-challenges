package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

@RunWith(Spectrum.class)
public class P31RecursiveStringPermutationsTest {{
	describe(".getPermutations", () -> {
		it("returns all permutations of an input string when the string is 2 characters long", () -> {
			String input = "ab";
			Set<String> expectedResult = new HashSet<String>() {{
				add("ab");
				add("ba");
			}};
			
			Set<String> result = P31RecursiveStringPermutations.getPermutations(input);
			
			assertEquals(expectedResult, result);
		});
		
		it("returns all permutations of an input string", () -> {
			String input = "abc";
			Set<String> expectedResult = new HashSet<String>() {{
				add("abc");
				add("bac");
				add("bca");
				add("acb");
				add("cab");
				add("cba");
		}};
			
			Set<String> result = P31RecursiveStringPermutations.getPermutations(input);
			
			assertEquals(expectedResult, result);
		});
	});

	describe(".allPermutationOf", () -> {
		it("returns all permutations of an input string when the string is 2 characters long", () -> {
			Set<String> expectedResult = new HashSet<String>() {{
				add("abc");
				add("bac");
				add("bca");
			}};
			
			Set<String> result = P31RecursiveStringPermutations.allPermutationsOf('a', "bc");
			
			assertEquals(expectedResult, result);
		});
	});
}}
