package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P07TemperatureTrackerTest {
	P07TemperatureTracker tracker = new P07TemperatureTracker();

	@Test
	public void testInsert() {
		tracker.insert(1);
		tracker.insert(2);
		tracker.insert(3);
		
		assertEquals(1, tracker.getMin());
		assertEquals(3, tracker.getMax());
		assertEquals(2.0, tracker.getMean(), 0);
	}
	
	@Test
	public void testMode() {
		tracker.insert(1);
		tracker.insert(2);
		tracker.insert(3);
		tracker.insert(3);
		tracker.insert(2);
		tracker.insert(2);
		
		assertEquals(2, tracker.getMode());
	}
}
