package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P08BalancedBinaryTreeTest {

	// A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.
	@Test
	public void testIsSuperbalancedIterativeForFalseCase() {
		P08BalancedBinaryTree binaryTree = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		binaryTree.addItem(input);

		assertEquals(false, binaryTree.isSuperbalancedIterative());
	}
	
	public void testIsSuperbalancedIterativeForFalseCaseWhenItHasOnlyTwoLeaves() {
		P08BalancedBinaryTree binaryTree = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 2, 1, 6 };
		binaryTree.addItem(input);

		assertEquals(false, binaryTree.isSuperbalancedIterative());
	}
	
	@Test
	public void testIsSuperbalancedIterativeForTrueCase() {
		P08BalancedBinaryTree binaryTree = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 4, 2, 7, 6, 8 };
		binaryTree.addItem(input);

		assertEquals(true, binaryTree.isSuperbalancedIterative());
	}
}
