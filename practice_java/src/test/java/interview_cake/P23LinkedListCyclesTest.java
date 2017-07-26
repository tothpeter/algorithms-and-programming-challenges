package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

import practice.LinkedListNode;

@RunWith(Spectrum.class)
public class P23LinkedListCyclesTest {{
	describe("#remove", () -> {
		it("return false when there is no cycle", () -> {
			P23LinkedListCycles list = new P23LinkedListCycles();

			list.add("a");

			assertThat(list.containsCycle()).isEqualTo(false);
		});
		
		it("return true when there is a cycle", () -> {
			P23LinkedListCycles list = new P23LinkedListCycles();

			list.add("a");
			LinkedListNode secondNode = list.add("b");
			list.add("c");
			LinkedListNode lastNode = list.add("d");
			
			lastNode.next = secondNode;
			
			assertThat(list.containsCycle()).isEqualTo(true);
		});
	});
}}