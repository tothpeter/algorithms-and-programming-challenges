package practice;

import practice.BinaryTreeNode;

public class BinaryTree {
	private BinaryTreeNode root;
	
	public BinaryTreeNode getRoot() {
		return root;
	}
	
	public void addItem(int value) {
		if (root == null) {
			root = new BinaryTreeNode(value);
		} else {
			addItem(root, value);
		}
	}
	
	public void addItem(int[] values) {
		for (int value : values) {
			addItem(value);
		}
	}
	
	private void addItem(BinaryTreeNode node, int value) {		
		if (node.value == value) {
			return;
		}

		if (node.value > value) {
			if (node.left == null) {
				node.left = node.insertLeft(value);
			} else {
				addItem(node.left, value);
			}
		} else {
			if (node.right == null) {
				node.right = node.insertRight(value);
			} else {
				addItem(node.right, value);
			}
		}
	}
}
