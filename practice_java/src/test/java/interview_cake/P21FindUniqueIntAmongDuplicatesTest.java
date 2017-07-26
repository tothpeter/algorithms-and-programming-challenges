package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;


@RunWith(Spectrum.class)
public class P21FindUniqueIntAmongDuplicatesTest {{
	int[] input = { 1, 1, 2, 2, 3, 4, 4 };

	describe(".performWithSet", () -> {
		it("returns the uniq item in the input list", () -> {
			int result = P21FindUniqueIntAmongDuplicates.performWithSet(input);

			assertThat(result).isEqualTo(3);
		});
	});
	
	describe(".performWithXOR", () -> {
		it("returns the uniq item in the input list", () -> {
			int result = P21FindUniqueIntAmongDuplicates.performWithXOR(input);

			assertThat(result).isEqualTo(3);
		});
	});
}}