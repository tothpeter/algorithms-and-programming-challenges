package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

@RunWith(Spectrum.class)
public class P25KthToLastNodeInSinglyLinkedListTest {{
	describe("#kthToLastNodeWithLookAhead", () -> {
		it("returns the kth item", () -> {
			P25KthToLastNodeInSinglyLinkedList list = new P25KthToLastNodeInSinglyLinkedList();

			list.add("a");
			list.add("b");
			list.add("c");
			list.add("d");

			assertThat(list.kthToLastNodeWithLookAhead(1).value).isEqualTo("d");
			assertThat(list.kthToLastNodeWithLookAhead(4).value).isEqualTo("a");
		});
		
		it("returns null when there is not enough element in the list", () -> {
			P25KthToLastNodeInSinglyLinkedList list = new P25KthToLastNodeInSinglyLinkedList();

			list.add("a");
			list.add("b");
			list.add("c");
			list.add("d");

			assertThat(list.kthToLastNodeWithLookAhead(5)).isEqualTo(null);
		});
	});
	
	describe("#kthToLastNodeWithCounting", () -> {
		it("returns the kth item", () -> {
			P25KthToLastNodeInSinglyLinkedList list = new P25KthToLastNodeInSinglyLinkedList();

			list.add("a");
			list.add("b");
			list.add("c");
			list.add("d");

			assertThat(list.kthToLastNodeWithCounting(1).value).isEqualTo("d");
			assertThat(list.kthToLastNodeWithCounting(4).value).isEqualTo("a");
		});
		
		it("returns null when there is not enough element in the list", () -> {
			P25KthToLastNodeInSinglyLinkedList list = new P25KthToLastNodeInSinglyLinkedList();

			list.add("a");
			list.add("b");
			list.add("c");
			list.add("d");

			assertThat(list.kthToLastNodeWithCounting(5)).isEqualTo(null);
		});
	});
}}