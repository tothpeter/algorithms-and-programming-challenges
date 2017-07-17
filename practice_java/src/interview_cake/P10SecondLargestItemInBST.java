package interview_cake;

import practice.BinarySearchTree;
import practice.BinaryTreeNode;

public class P10SecondLargestItemInBST extends BinarySearchTree {
	// Recursive solution

	public int getSecondLargestItemRecursive() {
		if (root == null || (root.left == null && root.right == null)) {
			throw new IllegalArgumentException("There are less than 2 nodes");
		}
		
		return getSecondLargestItemRecursive(root);
	}
	
	public int getSecondLargestItemRecursive(BinaryTreeNode node) {
		// should we go to the left direction?
		if (node.right == null && node.left != null) {
			return getLargestItemRecursive(node.left);
		}

		// should we go to the right direction?
		if (node.right != null) {
			if (node.right.right != null) {
				return getSecondLargestItemRecursive(node.right);
			}
			
			if (node.right.left != null) {
				return getSecondLargestItemRecursive(node.right.left);
			}
		}

		// We are on the right node
		return node.value;
	}
	
	public int getLargestItemRecursive(BinaryTreeNode node) {
		if (node.right == null) {
			return node.value;
		} else {
			return getLargestItemRecursive(node.right);
		}
	}
	
	
	// Iterative solution
	
	public int getSecondLargestItemIterative() {
		if (root == null || (root.left == null && root.right == null)) {
			throw new IllegalArgumentException("There are less than 2 nodes");
		}
		
		BinaryTreeNode finalNode = root;

		while (true) {
			// should we go to the left direction?
			if (finalNode.right == null && finalNode.left != null) {
				return getLargestItemIterative(finalNode.left);
			}

			// are we on the right node
			if (finalNode.right != null
					&& finalNode.right.right == null
					&& finalNode.right.left == null) {
				return finalNode.value;
			}
			
			// continue going to the right direction
			finalNode = finalNode.right;
		}
	}
	
	public int getLargestItemIterative(BinaryTreeNode node) {
		while (node.right != null) {
			node = node.right;
		}
		
		return node.value;
	}
}
