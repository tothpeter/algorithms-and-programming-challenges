package interview_cake;

public class P26ReverseStringInPlace {
	public static String reverse(String input) {
		char[] inputArray = input.toCharArray();
		
		for (int start = 0, end = inputArray.length - 1 ; start < end; start++, end--) {
			char tmp;
			tmp = inputArray[start];
			inputArray[start] = inputArray[end];
			inputArray[end] = tmp;
		}
		
		return new String(inputArray);
	}
}
