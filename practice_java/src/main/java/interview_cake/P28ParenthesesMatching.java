package interview_cake;

public class P28ParenthesesMatching {
	public static int matches(String inputString, int indexOfOpeningParentheses) {
		int closingParenthesesLeft = 0;
		
		for (int position = indexOfOpeningParentheses + 1; position < inputString.length(); position++) {
			char currentChar = inputString.charAt(position);

			if (currentChar == '(') {
				closingParenthesesLeft++;
			} else if (currentChar == ')') {
				if (closingParenthesesLeft == 0) {
					return position;
				}
				
				closingParenthesesLeft--;
			}
		}
		
		return -1;
	}
}
