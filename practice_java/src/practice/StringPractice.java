package practice;

public class StringPractice {
	public static String reverse(String input) {
		char[] chars = input.toCharArray();
		char tempChar;

		int lastIndex = input.length() - 1;
		
		for (int firstIndex = 0; firstIndex < lastIndex; firstIndex++, lastIndex--) {
			tempChar = chars[firstIndex];
			chars[firstIndex] = chars[lastIndex];
			chars[lastIndex] = tempChar;
		}
		
		return new String(chars);
	}
}
