package interview_cake;

import practice.LinkedList;
import practice.LinkedListNode;

public class P22DeleteLinkedListNodeByOnlyReference extends LinkedList {
	public void remove(LinkedListNode nodeToRemove) {
		if (nodeToRemove.next == null) {
			throw new IllegalArgumentException("Can't delete the last node with this method!");
		}

		nodeToRemove.value = nodeToRemove.next.value;
		nodeToRemove.next = nodeToRemove.next.next;
	}
}
