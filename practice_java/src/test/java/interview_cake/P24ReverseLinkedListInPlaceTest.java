package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;


@RunWith(Spectrum.class)
public class P24ReverseLinkedListInPlaceTest {{
	describe("#reverse", () -> {
		it("will simply return when the list contians 0 or 1 item", () -> {
			P24ReverseLinkedListInPlace list = new P24ReverseLinkedListInPlace();
			
			list.reverse();

			list.add("a");
			
			list.reverse();
		});

		it("reverses the list when it only contains 2 items", () -> {
			P24ReverseLinkedListInPlace list = new P24ReverseLinkedListInPlace();

			list.add("a");
			list.add("b");
			
			list.reverse();
			
			assertThat(list.getHead().value).isEqualTo("b");
			assertThat(list.getHead().next.value).isEqualTo("a");
			assertThat(list.getHead().next.next).isEqualTo(null);
		});

		it("reverses the list", () -> {
			P24ReverseLinkedListInPlace list = new P24ReverseLinkedListInPlace();

			list.add("a");
			list.add("b");
			list.add("c");
			
			list.reverse();
			
			assertThat(list.getHead().value).isEqualTo("c");
			assertThat(list.getHead().next.value).isEqualTo("b");
			assertThat(list.getHead().next.next.value).isEqualTo("a");
			assertThat(list.getHead().next.next.next).isEqualTo(null);
		});
	});
}}