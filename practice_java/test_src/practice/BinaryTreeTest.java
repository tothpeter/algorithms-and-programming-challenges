package practice;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;

//import org.hamcrest.collection.IsIterableContainingInOrder;
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
	
	@Test
	public void testGetPreOrderList() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
		
		binaryTree.addItem(input);
		
		List<Integer> output = binaryTree.getPreOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testGetInOrderList() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );
		
		binaryTree.addItem(input);
		
		List<Integer> output = binaryTree.getInOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testGetPostOrderList() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 0, 2, 4, 6, 5, 3, 1, 8, 10, 9, 7 );
		
		binaryTree.addItem(input);
		
		List<Integer> output = binaryTree.getPostOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testBuildFromPreOrderList() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 };
		List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
		
		binaryTree.buildFromPreOrderList(input);
		
		List<Integer> output = binaryTree.getPreOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	
	// Min And Max Depth Levels Recursive
	@Test
	public void testGetMinAndMaxDepthLevelsRecursive() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 5, 3, 4, 2, 7, 6, 8 };
		binaryTree.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		binaryTree.getMinAndMaxDepthLevelsRecursive(binaryTree.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
	
	@Test
	public void testGetMinAndMaxDepthLevelsRecursiverWithDifferentTree() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 5, 3, 4, 2, 7 };
		binaryTree.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 1, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		binaryTree.getMinAndMaxDepthLevelsRecursive(binaryTree.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
	
	
	@Test
	public void testGetMinAndMaxDepthLevelsRecursiveWhenOnlyLeftNodesExist() {
		BinaryTree binaryTree = new BinaryTree();

		int[] input = { 5, 3, 2 };
		binaryTree.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		binaryTree.getMinAndMaxDepthLevelsRecursive(binaryTree.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
}
