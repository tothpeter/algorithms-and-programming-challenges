package interview_cake;

import practice.LinkedList;
import practice.LinkedListNode;

public class P25KthToLastNodeInSinglyLinkedList extends LinkedList {
	public LinkedListNode kthToLastNodeWithLookAhead(int k) {
		LinkedListNode lookAhead = head;
		LinkedListNode requestedNode = head;
		
		for (int i = 0; i < k - 1; i++) {
			if (lookAhead.next == null) {
				return null;
			}
			
			lookAhead = lookAhead.next;
		}
		
		while (lookAhead.next != null) {
			lookAhead = lookAhead.next;
			requestedNode = requestedNode.next;
		}
		
		return requestedNode;
	}
	
	public LinkedListNode kthToLastNodeWithCounting(int k) {
		LinkedListNode requestedNode = head;
		int listLength = 1;
		
		while (requestedNode.next != null && k > 0) {
			requestedNode = requestedNode.next;
			listLength++;
		}
		
		if (listLength < k) {
			return null;
		}
		
		requestedNode = head;
		
		int stepsRequired = listLength - k;
		
		for (int i = 0; i < stepsRequired; i++) {
			requestedNode = requestedNode.next;	
		}
		
		return requestedNode;
	}
}
