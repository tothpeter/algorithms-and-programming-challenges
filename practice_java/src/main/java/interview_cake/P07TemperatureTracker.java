package interview_cake;

public class P07TemperatureTracker {
	private int max = Integer.MIN_VALUE;
	private int min = Integer.MAX_VALUE;
	
	private double mean;
	private int count;
	private int sum;
	
	private int mode;
	
	int[] occurrences = new int[111];
	
	public void insert(int temperature) {
		max = Math.max(max, temperature);
		min = Math.min(min, temperature);
		
		sum += temperature;
		count++;
		mean = sum / count;
		
		occurrences[temperature]++;
		
		if (occurrences[temperature] > occurrences[mode]) {
			mode = temperature;
		}
	}

	public int getMax() {
		return max;
	}
	
	public int getMin() {
		return min;
	}
	
	public double getMean() {
		return mean;
	}
	
	public int getMode() {
		return mode;
	}
}
