package interview_cake;

public class P27ReverseWords {
	public static String reverseWords(String input) {
		char[] inputArray = input.toCharArray();
		
		// reverse the whole string
		reverseArray(inputArray);
		
		// reverse only the chars within words
		for (int wordStartIndex = 0, wordEndIndex = 0; wordEndIndex <= inputArray.length; wordEndIndex++) {
			if (wordEndIndex == inputArray.length || inputArray[wordEndIndex] == ' ') {
				reverseArray(inputArray, wordStartIndex, wordEndIndex - 1);
				wordStartIndex = wordEndIndex + 1;
			}
		}
		
		return new String(inputArray);
	}

	private static void reverseArray(char[] inputArray) {
		char tmp;
		
		for (int startIndex = 0, endIndex = inputArray.length - 1; startIndex < endIndex; startIndex++, endIndex--) {
			tmp = inputArray[startIndex];
			inputArray[startIndex] = inputArray[endIndex];
			inputArray[endIndex] = tmp;
		}
	}
	
	private static void reverseArray(char[] inputArray, int startIndex, int endIndex) {
		char tmp;
		
		for (; startIndex < endIndex; startIndex++, endIndex--) {
			tmp = inputArray[startIndex];
			inputArray[startIndex] = inputArray[endIndex];
			inputArray[endIndex] = tmp;
		}
	}
}
