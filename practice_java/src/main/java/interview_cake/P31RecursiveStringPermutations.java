package interview_cake;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class P31RecursiveStringPermutations {
	public static Set<String> getPermutations(String input) {
		// base case
		if (input.length() <= 1) {
			return new HashSet<String>(Arrays.asList(input));
		}
		
		// building  up the permutation list
		
		String allCharsExceptFirst = input.substring(1, input.length());
		char firstChar = input.charAt(0);

		Set<String> allPermutationsSoFar = getPermutations(allCharsExceptFirst);
		
		Set<String> permutations = new HashSet<>();		
		
		for (String subPermutation : allPermutationsSoFar) {
			permutations.addAll(allPermutationsOf(firstChar, subPermutation));
		}	

		return permutations; 
	}
	
	public static Set<String> allPermutationsOf(char c, String str) {
		Set<String> permutations = new HashSet<String>();

		for (int position = 0; position <= str.length(); position++) {
			String prefix = str.substring(0, position);
			String postfix = str.substring(position, str.length());

			permutations.add(prefix + c + postfix);
		}

		return permutations;
	}
}
