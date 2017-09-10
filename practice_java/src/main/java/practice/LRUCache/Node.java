package practice.LRUCache;

public class Node {
	private String key;
	private int value;
	private Node pre, next;
	
	public Node(String key, int value) {
		this.key = key;
		this.value = value;
	}
	
	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public Node getPre() {
		return pre;
	}

	public void setPre(Node pre) {
		this.pre = pre;
	}

	public Node getNext() {
		return next;
	}

	public void setNext(Node next) {
		this.next = next;
	}

	public String getKey() {
		return key;
	}
}
