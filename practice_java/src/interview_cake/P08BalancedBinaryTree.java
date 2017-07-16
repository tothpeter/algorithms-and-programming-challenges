package interview_cake;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import practice.BinaryTree;
import practice.BinaryTreeNode;

public class P08BalancedBinaryTree extends BinaryTree {
	// A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.
	public boolean isSuperbalancedIterative() {
		if (root == null) {
			return true;
		}
		
		Stack<NodeDepthPair> nodes = new Stack<>();
	    nodes.push(new NodeDepthPair(root, 0));
	    
	    List<Integer> depths = new ArrayList<>(3);
	    
	    while (!nodes.empty()) {
	    	NodeDepthPair nodeDepthPair = nodes.pop();
	    	BinaryTreeNode node = nodeDepthPair.node;
	        int depth = nodeDepthPair.depth;
	        
	        if (node.left == null && node.right == null) {
				if (!depths.contains(depth)) {
					depths.add(depth);
				}
				
				if (depths.size() > 2 || (depths.size() == 2 && Math.abs(depths.get(0) - depths.get(1)) > 1)) {
					return false;
				}
				
			} else {
				if (node.left != null) {
					nodes.push(new NodeDepthPair(node.left, depth + 1));
				}
				
				if (node.right != null) {
					nodes.push(new NodeDepthPair(node.right, depth + 1));
				}
			}
	        
	        
			
		}
	    
	    return true;
	}
}
