package interview_cake;

import static org.junit.Assert.*;

import org.junit.Test;

import interview_cake.P01StockPrice;

public class P01StockPriceTest {

	@Test
	public void testBasicCase() {
		int[] stockPricesYesterday = new int[] { 10, 7, 5, 8, 11, 9 };
		
		int result = P01StockPrice.getMaxProfit(stockPricesYesterday);
		
		assertEquals(6, result);
	}
	
	@Test
	public void testWhenStockValueGoesDownAllDay() {
		int[] stockPricesYesterday = new int[] { 10, 7 };
		
		int result = P01StockPrice.getMaxProfit(stockPricesYesterday);
		
		assertEquals(-3, result);
	}
	
	@Test(expected = IllegalArgumentException.class)  
	public void testWhenInputContainsOnlyOneItem() {
		P01StockPrice.getMaxProfit(new int[] {1});
	}

}
