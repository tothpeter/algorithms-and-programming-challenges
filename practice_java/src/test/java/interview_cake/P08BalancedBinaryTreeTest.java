package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P08BalancedBinaryTreeTest {

	// A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.
	@Test
	public void testIsSuperbalancedIterativeForFalseCase() {
		P08BalancedBinaryTree bst = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);

		assertEquals(false, bst.isSuperbalancedIterative());
	}
	
	public void testIsSuperbalancedIterativeForFalseCaseWhenItHasOnlyTwoLeaves() {
		P08BalancedBinaryTree bst = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 2, 1, 6 };
		bst.addItem(input);

		assertEquals(false, bst.isSuperbalancedIterative());
	}
	
	@Test
	public void testIsSuperbalancedIterativeForTrueCase() {
		P08BalancedBinaryTree bst = new P08BalancedBinaryTree();

		int[] input = { 5, 3, 4, 2, 7, 6, 8 };
		bst.addItem(input);

		assertEquals(true, bst.isSuperbalancedIterative());
	}
}
