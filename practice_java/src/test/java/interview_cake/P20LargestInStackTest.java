package interview_cake;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;
import static org.assertj.core.api.Assertions.*;


@RunWith(Spectrum.class)
public class P20LargestInStackTest {{
	describe("#push && #pop", () -> {
		describe("When there are no duplicated values", () -> {
			it("returns the largest item", () -> {
				P20LargestInStack myStack = new P20LargestInStack();
				
				myStack.push(4);
				myStack.push(2);
				myStack.push(7);
				myStack.push(10);
				myStack.push(3);
				
				assertThat(myStack.getMax()).isEqualTo(10);
				
				myStack.pop();
				myStack.pop();
				
				assertThat(myStack.getMax()).isEqualTo(7);
				
				myStack.pop();
				
				assertThat(myStack.getMax()).isEqualTo(4);
			});
		});
		
		describe("When there are duplicated values", () -> {
			it("returns the largest item", () -> {
				P20LargestInStack myStack = new P20LargestInStack();
				
				myStack.push(4);
				myStack.push(2);
				myStack.push(7);
				myStack.push(10);
				myStack.push(10);
				myStack.push(3);
				
				assertThat(myStack.getMax()).isEqualTo(10);
				
				myStack.pop();
				myStack.pop();
				
				assertThat(myStack.getMax()).isEqualTo(10);
				
				myStack.pop();
				myStack.pop();
				
				assertThat(myStack.getMax()).isEqualTo(4);
			});
		});
	});
}}