package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P06RectangularLoveTest {
	
	@Test
	public void testNotOverlapingCase() {
		Rectangle rectangleMiddle   = new Rectangle(5, 10, 5, 5);
		Rectangle expectedRectangle = new Rectangle(0, 0,  0, 0);
		
		int[][] expectedOutputs = new int[][] {
			// Top
			{ 5, 15, 5, 5 },
			// Top Right
			{ 10, 15, 5, 5 },
			// Right
			{ 10, 10, 5, 5 },
			// Right Bottom
			{ 10, 5, 5, 5 },
			// Bottom
			{ 5, 5,  5, 5 },
			// Bottom Left
			{ 0, 5,  5, 5 },
			// Left
			{ 0, 10, 5, 5 },
			// Left Top
			{ 0, 15, 5, 5 }
		};

		for (int[] expectedOutput : expectedOutputs) {
			int x      = expectedOutput[0];
			int y      = expectedOutput[1];
			int width  = expectedOutput[2];
			int height = expectedOutput[3];
			
			Rectangle rectangleCurrent = new Rectangle(x, y, width, height);
			
			Rectangle result = P06RectangularLove.getOverlapingRectangle(rectangleCurrent, rectangleMiddle);
			
			assertEquals(expectedRectangle.toString(), result.toString());
		}
	}

}
