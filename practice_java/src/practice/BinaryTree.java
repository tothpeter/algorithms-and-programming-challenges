package practice;

import java.util.ArrayList;

import practice.BinaryTreeNode;

public class BinaryTree {
	private BinaryTreeNode root;
	
	public BinaryTreeNode getRoot() {
		return root;
	}
	
	public void addItem(int value) {
		root = addItemRecursive(root, value);
	}
	
	public void addItem(int[] values) {
		for (int value : values) {
			addItem(value);
		}
	}
	
	private BinaryTreeNode addItemRecursive(BinaryTreeNode node, int value) {
		if (node == null) {
			return new BinaryTreeNode(value);
		}

		if (node.value == value) {
			return node;
		}

		if (node.value > value) {
			node.left = addItemRecursive(node.left, value);
		} else {
			node.right = addItemRecursive(node.right, value);
		}
		
		return node;
	}
	
	public ArrayList<Integer> getPreOrderList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		return getPreOrderListRecursive(root, list);
	}
	
	private ArrayList<Integer> getPreOrderListRecursive(BinaryTreeNode node, ArrayList<Integer> list) {
		if (node != null) {
			list.add(node.value);
			
			getPreOrderListRecursive(node.left, list);
			getPreOrderListRecursive(node.right, list);
		}
		
		return list;
	}
	
	public ArrayList<Integer> getInOrderList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		return getInOrderListRecursive(root, list);
	}
	
	private ArrayList<Integer> getInOrderListRecursive(BinaryTreeNode node, ArrayList<Integer> list) {
		if (node != null) {
			getInOrderListRecursive(node.left, list);
			list.add(node.value);
			getInOrderListRecursive(node.right, list);
		}
		
		return list;
	}
	
	public ArrayList<Integer> getPostOrderList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		return getPostOrderListRecursive(root, list);
	}
	
	private ArrayList<Integer> getPostOrderListRecursive(BinaryTreeNode node, ArrayList<Integer> list) {
		if (node != null) {
			getPostOrderListRecursive(node.left, list);
			getPostOrderListRecursive(node.right, list);
			list.add(node.value);
		}
		
		return list;
	}
}
