package interview_cake;

import practice.LinkedList;
import practice.LinkedListNode;

public class P23LinkedListCycles extends LinkedList {
	public boolean containsCycle() {
		LinkedListNode fastRunner = head;
		LinkedListNode slowRunner = head;

		while (fastRunner != null && fastRunner.next != null) {
			fastRunner = fastRunner.next.next;
			slowRunner = slowRunner.next;
			
			if (slowRunner == fastRunner) {
				return true;
			}
		}

		return false;
	}
}
