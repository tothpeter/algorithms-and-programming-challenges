package interview_cake;

import java.util.Stack;

public class P20LargestInStack {
	private Stack<Integer> stack          = new Stack<>();
	private Stack<Integer> maxItemHistory = new Stack<>();

	public Integer push(int item) {
		stack.push(item);
		
		if (maxItemHistory.empty() || item >= maxItemHistory.peek()) {
			maxItemHistory.push(item);
		}
		
		return item;
	}
	
	public Integer pop() {
		Integer item = stack.pop();
		
		if (item == maxItemHistory.peek()) {
			maxItemHistory.pop();
		}
		
		return item;
	}
	
	public int getMax() {
		return maxItemHistory.peek();
	}
}
