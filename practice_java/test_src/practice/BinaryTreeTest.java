package practice;

import static org.junit.Assert.*;

import org.junit.Test;

public class BinaryTreeTest {

	@Test
	public void testAddItem() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		binaryTree.addItem(input);

		assertEquals(6, binaryTree.getRoot().left.right.right.right.value);
		assertEquals(10, binaryTree.getRoot().right.right.value);
	}
}
