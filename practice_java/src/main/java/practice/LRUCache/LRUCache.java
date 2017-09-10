package practice.LRUCache;

import java.util.HashMap;

public class LRUCache {
	private int maxSize, currentSize = 0;
	private Node mostRecentlyUsed, leastRecentlyUsed;

	private HashMap<String, Node> cache = new HashMap<>();

	public LRUCache(int maxSize) {
		this.maxSize = maxSize;
	}
	
	public int[] getItems() {
		Node currentNode = mostRecentlyUsed;
		
		int[] result = new int[currentSize];
		int i = 0;
		
		while (currentNode != null) {
			result[i] = currentNode.getValue();
			currentNode = currentNode.getNext();
			i++;
		}
		
		return result;
	}
	
	public void put(int item, String key) {
		Node newNode = new Node(key, item);
		
		if (mostRecentlyUsed == null) {
			leastRecentlyUsed = newNode;
		} else {
			mostRecentlyUsed.setPre(newNode);
			newNode.setNext(mostRecentlyUsed);	
		}
		
		cache.put(key, newNode);
		
		mostRecentlyUsed = newNode;

		if (currentSize < maxSize) {
			currentSize++;
		} else {
			removeLeastRecentlyUsedItem();
		}
	}
	
	public Object get(String key) {
		Node tmpNode = cache.get(key);

		if (tmpNode == null) {
			return null;
		}

		if (tmpNode.getKey() != mostRecentlyUsed.getKey()) {
			makeItemMostRecentlyUsed(tmpNode);
		}

		return tmpNode.getValue();
	}
	
	private void makeItemMostRecentlyUsed(Node item) {
		// Un chain
		if (item.getPre() != null) {
			item.getPre().setNext(item.getNext());			
		}

		if (item.getNext() != null) {
			item.getNext().setPre(item.getPre());			
		}

		// chain in
		item.setPre(null);
		item.setNext(mostRecentlyUsed);
		mostRecentlyUsed.setPre(item);
		
		mostRecentlyUsed = item;
	}

	private void removeLeastRecentlyUsedItem() {
		cache.remove(leastRecentlyUsed.getKey());

		leastRecentlyUsed = leastRecentlyUsed.getPre();
		
		leastRecentlyUsed.getNext().setPre(null);
		leastRecentlyUsed.setNext(null);
	}
}
