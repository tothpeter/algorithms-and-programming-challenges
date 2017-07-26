package practice;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;


@RunWith(Spectrum.class)
public class LinkedListTest {{
	describe("#add", () -> {
		it("adds element to the list", () -> {
			LinkedList list = new LinkedList();

			list.add("a");
			list.add("b");

			assertThat(list.getHead().value).isEqualTo("a");
			assertThat(list.getHead().next.value).isEqualTo("b");
			assertThat(list.getHead().next.next).isEqualTo(null);
		});
	});
	
	describe("#contains", () -> {
		it("returns false when the list is empty", () -> {
			LinkedList list = new LinkedList();

			assertThat(list.contains("a")).isEqualTo(false);
		});
		
		it("returns true when the required item is in the list", () -> {
			LinkedList list = new LinkedList();

			list.add("a");
			list.add("b");

			assertThat(list.contains("b")).isEqualTo(true);
		});
		
		it("returns false when the required item is not in the list", () -> {
			LinkedList list = new LinkedList();

			list.add("a");
			list.add("b");

			assertThat(list.contains("c")).isEqualTo(false);
		});
	});
	
	describe("#remove", () -> {
		it("returns null when the list is empty", () -> {
			LinkedList list = new LinkedList();

			assertThat(list.remove("a")).isEqualTo(null);
		});
		
		it("removes the required item and returns its value", () -> {
			LinkedList list = new LinkedList();

			list.add("a");
			list.add("b");
			list.add("c");

			assertThat(list.remove("b")).isEqualTo("b");
			assertThat(list.getHead().value).isEqualTo("a");
			assertThat(list.getHead().next.value).isEqualTo("c");
		});
		
		it("returns null when the required item is not in the list", () -> {
			LinkedList list = new LinkedList();

			list.add("a");
			list.add("b");

			assertThat(list.remove("c")).isEqualTo(null);
		});
	});
}}
