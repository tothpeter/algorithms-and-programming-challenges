package interview_cake;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;
import static com.greghaskins.spectrum.dsl.specification.Specification.*;

@RunWith(Spectrum.class)
public class P32TopScoresTest {{
	describe(".getSortedScores", () -> {
		describe("When we do not have duplicated scores", () -> {
			it("returns the sorted list", () -> {
				int[] unsortedScores = { 37, 89, 41, 65, 91, 53 };
				int[] expectedResult = new int[] { 91, 89, 65, 53, 41, 37 };
				
				int[] result = P32TopScores.getSortedScores(unsortedScores, 100);
				
				assertEquals(Arrays.toString(expectedResult), Arrays.toString(result));
			});
		});

		describe("When we have duplicated scores", () -> {
			it("returns the sorted list", () -> {
				int[] unsortedScores = { 3, 3, 5, 4 };
				int[] expectedResult = new int[] { 5, 4, 3, 3 };
				
				int[] result = P32TopScores.getSortedScores(unsortedScores, 5);
				
				assertEquals(Arrays.toString(expectedResult), Arrays.toString(result));
			});
		});
	});
}}
