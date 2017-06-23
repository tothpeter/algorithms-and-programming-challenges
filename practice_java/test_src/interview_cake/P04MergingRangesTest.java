package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;
import java.util.Arrays;

public class P04MergingRangesTest {

	@Test
	public void testWhenEventOnlyTouching() {
		Meeting[] inputList = { new Meeting(0, 1), new  Meeting(1, 2) };
		Meeting[] expectedList = { new Meeting(0, 2) };
		
		Meeting[] result = P04MergingRanges.mergeRanges(inputList);
		
		assertEquals(Arrays.toString(expectedList), Arrays.toString(result));
	}
	
	@Test
	public void testWhenSecondEventStartsLaterAndEndsEarlier() {
		Meeting[] inputList = { new Meeting(0, 10), new  Meeting(2, 5) };
		Meeting[] expectedList = { new Meeting(0, 10) };
		
		Meeting[] result = P04MergingRanges.mergeRanges(inputList);
		
		assertEquals(Arrays.toString(expectedList), Arrays.toString(result));
	}
	
	@Test
	public void testComprehensiveCase() {
		Meeting[] inputList = { new Meeting(0, 1), new  Meeting(3, 5), new Meeting(4, 8), new Meeting(10, 12), new Meeting(9, 10) };
		Meeting[] expectedList = { new Meeting(0, 1), new Meeting(3, 8), new Meeting(9, 12) };
		
		Meeting[] result = P04MergingRanges.mergeRanges(inputList);
		
		assertEquals(Arrays.toString(expectedList), Arrays.toString(result));
	}
	

}
