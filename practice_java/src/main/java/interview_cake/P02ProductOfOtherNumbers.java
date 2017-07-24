package interview_cake;

public class P02ProductOfOtherNumbers {
	 public static int[] getProductsOfAllIntsExceptAtIndex(int[] inputList) {
		 int[] productsOfAllIntsExceptAtIndex = new int[inputList.length];
		 
		 int productSoFar = 1;

		 for (int i = 0; i < inputList.length; i++) {
			 productsOfAllIntsExceptAtIndex[i] = productSoFar;
			 productSoFar *= inputList[i];
		 }
		 
		 productSoFar = 1;
		 
		 for (int i = inputList.length - 1; i >= 0; i--) {
			 productsOfAllIntsExceptAtIndex[i] *= productSoFar;
			 productSoFar *= inputList[i];
		 }
		
		 return productsOfAllIntsExceptAtIndex;
	}
}
