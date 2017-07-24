package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P10SecondLargestItemInBSTTest {
	
	// Recursive solution

	@Test
	public void testGetSecondLargestItemRecursive() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		bst.addItem(input);

		assertEquals(9, bst.getSecondLargestItemRecursive());
	}
	
	@Test
	public void testGetSecondLargestItemRecursiveWhenTheTreeHasOnlyLeftChildren() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 7, 1, 0 };
		bst.addItem(input);

		assertEquals(1, bst.getSecondLargestItemRecursive());
	}
	
	@Test
	public void testGetSecondLargestItemRecursiveWhenTheSecondLargestIsInTheMostLeftOfTheRightSubTree() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 10, 20, 15 };
		bst.addItem(input);

		bst.getSecondLargestItemRecursive();
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGetSecondLargestItemRecursiveWhenThereIsNoNodes() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		bst.getSecondLargestItemRecursive();
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testGetSecondLargestItemRecursiveWhenThereIsOnlyOneNode() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		bst.addItem(7);

		bst.getSecondLargestItemRecursive();
	}
	
	
	// Iterative solution
	
	@Test
	public void testGetSecondLargestItemIterative() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		bst.addItem(input);

		assertEquals(9, bst.getSecondLargestItemIterative());
	}
	
	@Test
	public void testGetSecondLargestItemIterativeWhenTheTreeHasOnlyLeftChildren() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 7, 1, 0 };
		bst.addItem(input);

		assertEquals(1, bst.getSecondLargestItemIterative());
	}
	
	@Test
	public void testGetSecondLargestItemIterativeWhenTheTreeHasOnlyTwoLeftChildren() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 7, 1 };
		bst.addItem(input);

		assertEquals(1, bst.getSecondLargestItemIterative());
	}
	
	@Test
	public void testGetSecondLargestItemIterativeWhenTheSecondLargestIsInTheMostLeftOfTheRightSubTree() {
		P10SecondLargestItemInBST bst = new P10SecondLargestItemInBST();

		int[] input = { 10, 20, 15 };
		bst.addItem(input);

		assertEquals(15, bst.getSecondLargestItemIterative());
	}
}
