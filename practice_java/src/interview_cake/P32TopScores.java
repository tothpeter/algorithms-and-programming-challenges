package interview_cake;

public class P32TopScores {
	public static int[] getSortedScores(int[] unsortedScores, int highestPossibleScore) {
		int[] scoreCounts = new int[highestPossibleScore + 1];
		int[] sortedScores = new int[unsortedScores.length];
		
		for (int score : unsortedScores) {
			scoreCounts[score]++;
		}
		
		int currentSortedIndex = 0;
		
		for (int score = highestPossibleScore; score >= 0 ; score--) {
			int scoreCount = scoreCounts[score];
			
			for (int i = 0; i < scoreCount; i++) {
				sortedScores[currentSortedIndex] = score;
				currentSortedIndex++;
			}
		}
		
		return sortedScores;
	}
}
