package practice;

import static com.greghaskins.spectrum.dsl.specification.Specification.describe;
import static com.greghaskins.spectrum.dsl.specification.Specification.it;
import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;

@RunWith(Spectrum.class)
public class BinarySearchTreeTest {{
	describe("#addItem", () -> {
		describe("when the input is a single item", () -> {
			it("puts the new item into the right place", () -> {
				BinarySearchTree bst = new BinarySearchTree();
	
				bst.addItem(7);
				bst.addItem(3);
				bst.addItem(9);
				bst.addItem(4);
				bst.addItem(8);
	
				assertEquals(7, bst.getRoot().value);
				assertEquals(4, bst.getRoot().left.right.value);
				assertEquals(8, bst.getRoot().right.left.value);
			});
		});

		describe("when the input is an array", () -> {
			it("puts the new items into the right place", () -> {
				BinarySearchTree bst = new BinarySearchTree();
	
				int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
				bst.addItem(input);
	
				assertEquals(6, bst.getRoot().left.right.right.right.value);
				assertEquals(10, bst.getRoot().right.right.value);
			});
		});
	});

	describe("#getPreOrderList", () -> {
		it("returns the values in preorder", () -> {
			BinarySearchTree bst = new BinarySearchTree();

			int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
			List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
			
			bst.addItem(input);
			
			List<Integer> output = bst.getPreOrderList();
			
			assertEquals(expectedOutput, output);
		});
	});
	
	describe("#getInOrderList", () -> {
		it("returns the values in inorder", () -> {
			BinarySearchTree bst = new BinarySearchTree();

			int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
			List<Integer> expectedOutput = Arrays.asList( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );
			
			bst.addItem(input);
			
			List<Integer> output = bst.getInOrderList();
			
			assertEquals(expectedOutput, output);
		});
	});
	
	describe("#getPostOrderList", () -> {
		it("returns the values in postorder", () -> {
			BinarySearchTree bst = new BinarySearchTree();

			int[] input = { 7, 9, 1, 10, 8, 3, 0, 5, 4, 6, 2 };
			List<Integer> expectedOutput = Arrays.asList( 0, 2, 4, 6, 5, 3, 1, 8, 10, 9, 7 );
			
			bst.addItem(input);
			
			List<Integer> output = bst.getPostOrderList();
			
			assertEquals(expectedOutput, output);
		});
	});
	
	describe("#buildFromPreOrderList", () -> {
		it("constructs a tree from a preorder item list", () -> {
			BinarySearchTree bst = new BinarySearchTree();

			int[] input = { 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 };
			List<Integer> expectedOutput = Arrays.asList( 7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10 );
			
			bst.buildFromPreOrderList(input);
			
			List<Integer> output = bst.getPreOrderList();
			
			assertEquals(expectedOutput, output);
		});
	});
	
	describe("#getMinAndMaxDepthLevelsRecursive", () -> {
		describe("when the tree is balanced", () -> {
			it("returns the expected min and max levels", () -> {
				BinarySearchTree bst = new BinarySearchTree();

				int[] input = { 5, 3, 4, 2, 7, 6, 8 };
				bst.addItem(input);
				
				int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
				int[] resultMinAndMaxDepthLevels = bst.getMinAndMaxDepthLevelsRecursive();

				assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));
			});
		});
		
		describe("when the right subtree is smaller than the left subtree", () -> {
			it("returns the expected min and max levels", () -> {
				BinarySearchTree bst = new BinarySearchTree();

				int[] input = { 5, 3, 4, 2, 7 };
				bst.addItem(input);
				
				int[] expectedMinAndMaxDepthLevels = { 1, 2 }; 
				int[] resultMinAndMaxDepthLevels = bst.getMinAndMaxDepthLevelsRecursive();

				assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
			});
		});
		
		describe("when only left nodes exist", () -> {
			it("returns the expected min and max levels", () -> {
				BinarySearchTree bst = new BinarySearchTree();

				int[] input = { 5, 3, 2 };
				bst.addItem(input);
				
				int[] expectedMinAndMaxDepthLevels = { 2, 2 }; 
				int[] resultMinAndMaxDepthLevels = bst.getMinAndMaxDepthLevelsRecursive();

				assertEquals(Arrays.toString(expectedMinAndMaxDepthLevels), Arrays.toString(resultMinAndMaxDepthLevels));		
			});
		});
	});
}}
