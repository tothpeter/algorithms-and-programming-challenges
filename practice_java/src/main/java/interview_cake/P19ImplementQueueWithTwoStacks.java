package interview_cake;

import java.util.Stack;

public class P19ImplementQueueWithTwoStacks {
	private Stack<Integer> inStack = new Stack<>();
	private Stack<Integer> outStack = new Stack<>();
	
	public void enqueue(int item) {
		inStack.push(item);
	}
	
	public int dequeue() {
		if (outStack.empty()) {
			moveItemsToOutStack();
		}

		return outStack.pop();
	}
	
	private void moveItemsToOutStack() {
		while (!inStack.empty()) {
			outStack.push(inStack.pop());
		}
	}
}
