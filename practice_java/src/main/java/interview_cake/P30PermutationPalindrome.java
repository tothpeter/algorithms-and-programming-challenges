package interview_cake;

import java.util.Set;
import java.util.HashSet;

public class P30PermutationPalindrome {
	private static Set<Character> unpairedCharacters = new HashSet<>();
	
	public static boolean anyPermutationIsAPalindromeOf(String input) {
		for (char currentChar : input.toCharArray()) {	
			if (unpairedCharacters.contains(currentChar)) {
				unpairedCharacters.remove(currentChar);
			} else {
				unpairedCharacters.add(currentChar);
			}
		}
		
		return unpairedCharacters.size() <= 1;
	}
}
