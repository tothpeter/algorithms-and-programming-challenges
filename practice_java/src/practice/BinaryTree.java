package practice;

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
}
