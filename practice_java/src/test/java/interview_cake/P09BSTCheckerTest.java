package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P09BSTCheckerTest {

	// Recursive
	@Test
	public void testCheckIfValidRecursiveForTrueCase() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);

		assertEquals(true, bst.checkIfValidRecursive());
	}
	
	@Test
	public void testCheckIfValidRecursiveForFalseCase() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);
		bst.getRoot().value = 0;

		assertEquals(false, bst.checkIfValidRecursive());
		
		bst.getRoot().value = 10;

		assertEquals(false, bst.checkIfValidRecursive());
	}
	
	@Test
	public void testCheckIfValidRecursiveFalseCaseWhenTheLeafeShouldBeBiggerThanTheRoot() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);
		bst.getRoot().left.right.value = 10;

		assertEquals(false, bst.checkIfValidRecursive());
	}
	
	
	
	
	// Iterative
	@Test
	public void testCheckIfValidIterativeForTrueCase() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);

		assertEquals(true, bst.checkIfValidIterative());
	}
	
	@Test
	public void testCheckIfValidIterativeForFalseCase() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);
		bst.getRoot().value = 0;

		assertEquals(false, bst.checkIfValidIterative());
		
		bst.getRoot().value = 10;

		assertEquals(false, bst.checkIfValidIterative());
	}
	
	@Test
	public void testCheckIfValidIterativeFalseCaseWhenTheLeafeShouldBeBiggerThanTheRoot() {
		P09BSTChecker bst = new P09BSTChecker();

		int[] input = { 5, 3, 4, 2, 1, 6 };
		bst.addItem(input);
		bst.getRoot().left.right.value = 10;

		assertEquals(false, bst.checkIfValidIterative());
	}
}
