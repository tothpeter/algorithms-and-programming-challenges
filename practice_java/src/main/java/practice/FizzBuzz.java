package practice;

public class FizzBuzz {
	public static String[] perform(int limit) {
		String[] result = new String[limit];

		for (int i = 1; i <= limit; i++) {
			String subResult;

			if (i % 15 == 0) {
				subResult = "FizzBuzz";
			} else if(i % 3 == 0) {
				subResult = "Fizz";
			} else if(i % 5 == 0) {
				subResult = "Buzz";
			} else {
				subResult = "" + i;
			}
			
			result[i - 1] = subResult;
		}
		
		return result;
	}
}
