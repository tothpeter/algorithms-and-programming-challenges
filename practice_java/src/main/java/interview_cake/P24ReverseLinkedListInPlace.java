package interview_cake;

import practice.LinkedList;
import practice.LinkedListNode;

public class P24ReverseLinkedListInPlace extends LinkedList {
	public void reverse() {
		if (head == null || head.next == null) {
			return;
		}
		
		LinkedListNode prevoisNode = null;
		LinkedListNode currentNode = head;
		LinkedListNode nextNode;
		
		while (currentNode != null) {
			nextNode = currentNode.next;

			currentNode.next = prevoisNode;
			
			prevoisNode = currentNode;
			currentNode = nextNode;
		}
		
		head = prevoisNode;
	}
}
