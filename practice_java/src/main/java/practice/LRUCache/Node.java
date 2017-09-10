package practice.LRUCache;

public class Node<ValueType> {
	private String key;
	private ValueType value;
	private Node<ValueType> pre, next;
	
	public Node(String key, ValueType value) {
		this.key = key;
		this.value = value;
	}
	
	public ValueType getValue() {
		return value;
	}

	public void setValue(ValueType value) {
		this.value = value;
	}

	public Node<ValueType> getPre() {
		return pre;
	}

	public void setPre(Node<ValueType> pre) {
		this.pre = pre;
	}

	public Node<ValueType> getNext() {
		return next;
	}

	public void setNext(Node<ValueType> next) {
		this.next = next;
	}

	public String getKey() {
		return key;
	}
}
