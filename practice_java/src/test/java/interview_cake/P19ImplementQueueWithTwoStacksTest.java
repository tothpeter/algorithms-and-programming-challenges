package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

public class P19ImplementQueueWithTwoStacksTest {

	@Test
	public void testIntegration() {
		P19ImplementQueueWithTwoStacks queue = new P19ImplementQueueWithTwoStacks();
		
		queue.enqueue(1);
		queue.enqueue(2);
		
		assertEquals(1, queue.dequeue());
		
		queue.enqueue(3);
		
		assertEquals(2, queue.dequeue());
		assertEquals(3, queue.dequeue());
	}
}
