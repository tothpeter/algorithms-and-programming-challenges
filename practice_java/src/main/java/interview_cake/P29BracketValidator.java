package interview_cake;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.util.Stack;

public class P29BracketValidator {
	private static Map<Character, Character> openersClosersMap = new HashMap<Character, Character>() {{
	    put('(', ')');
	    put('{', '}');
	    put('[', ']');
	}};
	
	private static Set<Character> openers = openersClosersMap.keySet();
	private static Set<Character> closers = new HashSet<>(openersClosersMap.values());

	public static boolean isValid(String inputString) {
		Stack<Character> expectedClosers = new Stack<>();
		
		for (char currentChar : inputString.toCharArray()) {	
			if (isOpener(currentChar)) {
				expectedClosers.push(getClosingPairOf(currentChar));
			} else if (isCloser(currentChar)) {
				if (expectedClosers.isEmpty() || expectedClosers.pop() != currentChar) {
					return false;
				}
			}
		}
		
		return expectedClosers.isEmpty();
	}
	
	private static boolean isOpener(char c) {
		return openers.contains(c);
	}
	
	private static boolean isCloser(char c) {
		return closers.contains(c);
	}
	
	private static char getClosingPairOf(char openingChar) {
		return openersClosersMap.get(openingChar);
	}
}
