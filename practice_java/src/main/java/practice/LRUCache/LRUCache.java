package practice.LRUCache;

import java.util.ArrayList;
import java.util.HashMap;

public class LRUCache<ValueType> {
	private int maxSize, currentSize = 0;
	private Node<ValueType> mostRecentlyUsed, leastRecentlyUsed;

	private HashMap<String, Node<ValueType>> cache = new HashMap<>();

	public LRUCache(int maxSize) {
		this.maxSize = maxSize;
	}
	
	public ArrayList<ValueType> getItems() {
		Node<ValueType> currentNode = mostRecentlyUsed;
		ArrayList<ValueType> result = new ArrayList<ValueType>();
		
		while (currentNode != null) {
			result.add(currentNode.getValue());
			currentNode = currentNode.getNext();
		}
		
		return result;
	}
	
	public void put(String key, ValueType item) {
		if (cache.containsKey(key)) {
			updateExistingItem(key, item);
		} else {
			putNewItem(key, item);
		}
	}
	
	private void updateExistingItem(String key, ValueType item) {
		Node<ValueType> existingItem = cache.get(key);
		
		existingItem.setValue(item);

		makeItemMostRecentlyUsed(existingItem);
	}
	
	private void putNewItem(String key, ValueType item) {
		Node<ValueType> newNode = new Node<ValueType>(key, item);
		
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
	
	public ValueType get(String key) {
		Node<ValueType> tmpNode = cache.get(key);

		if (tmpNode == null) {
			return null;
		}

		if (tmpNode.getKey() != mostRecentlyUsed.getKey()) {
			makeItemMostRecentlyUsed(tmpNode);
		}

		return tmpNode.getValue();
	}
	
	private void makeItemMostRecentlyUsed(Node<ValueType> item) {
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
