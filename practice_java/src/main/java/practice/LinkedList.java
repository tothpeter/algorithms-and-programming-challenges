package practice;

public class LinkedList {
	protected LinkedListNode head;
	
	public LinkedListNode add(String item) {
		LinkedListNode newNode = new LinkedListNode(item);
		
		if (head == null) {
			head = newNode;
		} else {
			LinkedListNode lastNode = getLastNode();
			
			lastNode.next = newNode;
		}

		return newNode;
	}
	
	private LinkedListNode getLastNode() {
		LinkedListNode currentNode = head;
		
		while (currentNode.next != null) {
			currentNode = currentNode.next;
		}
		
		return currentNode;
	}
	
	public boolean contains(String str) {
		if (head == null) {
			return false;
		}
		
		LinkedListNode currentNode = head;
		
		while (currentNode != null) {
			if (currentNode.value.equals(str)) {
				return true;
			}

			currentNode = currentNode.next;
		}
		
		return false;
	}
	
	public LinkedListNode getHead() {
		return head;
	}
}
