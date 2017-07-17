package practice;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;

//import org.hamcrest.collection.IsIterableContainingInOrder;
import org.junit.Test;

public class BinarySearchTreeTest {

	@Test
	public void testAddItem() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		bst.addItem(input);

		assertEquals(6, bst.getRoot().left.right.right.right.value);
		assertEquals(10, bst.getRoot().right.right.value);
	}
	
	@Test
	public void testGetPreOrderList() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
		
		bst.addItem(input);
		
		List<Integer> output = bst.getPreOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testGetInOrderList() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );
		
		bst.addItem(input);
		
		List<Integer> output = bst.getInOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testGetPostOrderList() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
		List<Integer> expectedOutput = Arrays.asList( 0, 2, 4, 6, 5, 3, 1, 8, 10, 9, 7 );
		
		bst.addItem(input);
		
		List<Integer> output = bst.getPostOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	@Test
	public void testBuildFromPreOrderList() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 };
		List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
		
		bst.buildFromPreOrderList(input);
		
		List<Integer> output = bst.getPreOrderList();
		
		assertEquals(expectedOutput, output);
	}
	
	
	// Min And Max Depth Levels Recursive
	@Test
	public void testGetMinAndMaxDepthLevelsRecursive() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 5, 3, 4, 2, 7, 6, 8 };
		bst.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		bst.getMinAndMaxDepthLevelsRecursive(bst.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
	
	@Test
	public void testGetMinAndMaxDepthLevelsRecursiverWithDifferentTree() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 5, 3, 4, 2, 7 };
		bst.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 1, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		bst.getMinAndMaxDepthLevelsRecursive(bst.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
	
	
	@Test
	public void testGetMinAndMaxDepthLevelsRecursiveWhenOnlyLeftNodesExist() {
		BinarySearchTree bst = new BinarySearchTree();

		int[] input = { 5, 3, 2 };
		bst.addItem(input);
		
		int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
		int[] resultMinAndMaxDepthLevels = { 9, 0 };
		
		bst.getMinAndMaxDepthLevelsRecursive(bst.getRoot(), 0, resultMinAndMaxDepthLevels);

		assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
	}
}
