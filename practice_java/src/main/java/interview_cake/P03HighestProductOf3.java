package interview_cake;

public class P03HighestProductOf3 {
	public static int highestProductOf3(int[] inputList) {
		int highest = Math.max(inputList[0], inputList[1]);
		int lowest = Math.min(inputList[0], inputList[1]);
		
		int highestProductOf3 = inputList[0] * inputList[1] * inputList[2];
		int highestProductOf2 = inputList[0] * inputList[1];
		int lowestProductOf2 = highestProductOf2;
		
		for (int i = 2; i < inputList.length; i++) {
			int currentItem = inputList[i];

			highestProductOf3 = Math.max(
				highestProductOf3,
				Math.max(currentItem * highestProductOf2, currentItem * lowestProductOf2)
			);

			highestProductOf2 = Math.max(
				highestProductOf2,
				Math.max(currentItem * highest, currentItem * lowest)
			);

			lowestProductOf2 = Math.min(
				lowestProductOf2,
				Math.max(currentItem * highest, currentItem * lowest)
			);


			highest = Math.max(highest, currentItem);
			highest = Math.min(lowest, currentItem);
		}
		
		return highestProductOf3;
	}
}
