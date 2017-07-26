package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.*;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

import practice.LinkedListNode;

@RunWith(Spectrum.class)
public class P22DeleteLinkedListNodeByOnlyReferenceTest {{
	describe("#remove", () -> {
		it("removes the required item and returns its value", () -> {
			P22DeleteLinkedListNodeByOnlyReference list = new P22DeleteLinkedListNodeByOnlyReference();

			list.add("a");
			LinkedListNode nodeToRemove = list.add("b");
			list.add("c");

			list.remove(nodeToRemove);
			assertThat(list.getHead().value).isEqualTo("a");
			assertThat(list.getHead().next.value).isEqualTo("c");
		});
		
		it("throws an error when trying to remove the last node", () -> {
			P22DeleteLinkedListNodeByOnlyReference list = new P22DeleteLinkedListNodeByOnlyReference();

			list.add("a");
			LinkedListNode nodeToRemove = list.add("b");

			assertThatThrownBy(() -> { list.remove(nodeToRemove); })
				.isInstanceOf(IllegalArgumentException.class)
				.hasMessageContaining("Can't delete the last node with this method!");
		});
	});
}}