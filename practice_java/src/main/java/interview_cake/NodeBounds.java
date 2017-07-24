package interview_cake;

import practice.BinaryTreeNode;

public class NodeBounds {
	BinaryTreeNode node;
    int lowerBound;
    int upperBound;

    NodeBounds(BinaryTreeNode node, int lowerBound, int upperBound) {
        this.node = node;
        this.lowerBound = lowerBound;
        this.upperBound = upperBound;
    }
}
