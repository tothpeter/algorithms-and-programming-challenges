package interview_cake;

import practice.BinarySearchTree;
import practice.BinaryTreeNode;
import java.util.Stack;

public class P09BSTChecker extends BinarySearchTree {
	public boolean checkIfValidRecursive() {
		return checkIfValidRecursive(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
	}
	
	public boolean checkIfValidRecursive(BinaryTreeNode node, int lowerBound, int upperBound) {
		if (node == null) {
			return true;
		}
		
		if (node.value <= lowerBound || node.value >= upperBound) {
			return false;
		}
		
		return checkIfValidRecursive(node.left, lowerBound, node.value)
			&& checkIfValidRecursive(node.right, node.value, upperBound);
	}

	
	public boolean checkIfValidIterative() {
		Stack<NodeBounds> nodeAndBoundsStack = new Stack<>();
		nodeAndBoundsStack.push(new NodeBounds(root, Integer.MIN_VALUE, Integer.MAX_VALUE));
		
		while (!nodeAndBoundsStack.empty()) {
			NodeBounds nodeBound = nodeAndBoundsStack.pop();
			BinaryTreeNode node = nodeBound.node;
			
			if (node.value <= nodeBound.lowerBound || node.value >= nodeBound.upperBound) {
				return false;
			}
			
			if (node.left != null) {
				nodeAndBoundsStack.push(new NodeBounds(node.left, nodeBound.lowerBound, node.value));
			}
			
			if (node.right != null) {
				nodeAndBoundsStack.push(new NodeBounds(node.right, node.value, nodeBound.upperBound));
			}
		}
		
		return true;
	}
}
