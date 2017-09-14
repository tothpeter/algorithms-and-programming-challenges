package practice;

import java.util.ArrayList;

import practice.BinaryTreeNode;

public class BinarySearchTree {
	protected BinaryTreeNode root;
	
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
	
	public ArrayList<Integer> getInorderList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		return getInorderListRecursive(root, list);
	}
	
	private ArrayList<Integer> getInorderListRecursive(BinaryTreeNode node, ArrayList<Integer> list) {
		if (node != null) {
			getInorderListRecursive(node.left, list);
			list.add(node.value);
			getInorderListRecursive(node.right, list);
		}
		
		return list;
	}
	
	public ArrayList<Integer> getPostorderList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		return getPostorderListRecursive(root, list);
	}
	
	private ArrayList<Integer> getPostorderListRecursive(BinaryTreeNode node, ArrayList<Integer> list) {
		if (node != null) {
			getPostorderListRecursive(node.left, list);
			getPostorderListRecursive(node.right, list);
			list.add(node.value);
		}
		
		return list;
	}
	
	//	construct tree
	public void buildFromPreorderList(int[] preOrderList) {
		root = buildFromPreorderList(preOrderList, 0, preOrderList.length - 1);
	}
	
	private BinaryTreeNode buildFromPreorderList(int[] preOrderList, int startIndex, int endIndex) {
		if (startIndex > endIndex) {
			return null;
		}

		BinaryTreeNode node = new BinaryTreeNode(preOrderList[startIndex]);
		
		if (startIndex == endIndex) {
			return node;
		}
		
		int greaterThanRootIndex = startIndex + 1;
		
		for (; preOrderList[greaterThanRootIndex] < preOrderList[startIndex] && greaterThanRootIndex <= endIndex; greaterThanRootIndex++) {}
		
		node.left = buildFromPreorderList(preOrderList, startIndex + 1, greaterThanRootIndex - 1);
		node.right = buildFromPreorderList(preOrderList, greaterThanRootIndex, endIndex);

		return node;
	}
	
	
	// Min And Max Depth Levels Recursive
	public int[] getMinAndMaxDepthLevelsRecursive() {
		int[] minAndMaxDepthLevels = { Integer.MAX_VALUE, -1 }; 
		
		getMinAndMaxDepthLevelsRecursive(root, 0, minAndMaxDepthLevels);
		
		return minAndMaxDepthLevels;
	}
	
	public void getMinAndMaxDepthLevelsRecursive(BinaryTreeNode node, int currentDepthLevel, int[] minAndMaxDepthLevels) {
		if (node == null) {
			return;
		}
		
		if (node.left == null && node.right == null) {
			minAndMaxDepthLevels[0] = Math.min(minAndMaxDepthLevels[0], currentDepthLevel);
			minAndMaxDepthLevels[1] = Math.max(minAndMaxDepthLevels[1], currentDepthLevel);
		} else {
			getMinAndMaxDepthLevelsRecursive(node.left, currentDepthLevel + 1, minAndMaxDepthLevels);
			getMinAndMaxDepthLevelsRecursive(node.right, currentDepthLevel + 1, minAndMaxDepthLevels);
		}
	}
}
