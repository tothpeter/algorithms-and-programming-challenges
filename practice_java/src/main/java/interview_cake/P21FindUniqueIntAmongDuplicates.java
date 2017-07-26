package interview_cake;

import java.util.HashSet;
import java.util.Set;

public class P21FindUniqueIntAmongDuplicates {
	private static Set<Integer> oddInteger = new HashSet<>();
	
	public static int performWithSet(int[] list) {
		
		for (int deliveryId : list) {
			if (oddInteger.contains(deliveryId)) {
				oddInteger.remove(deliveryId);
			} else {
				oddInteger.add(deliveryId);
			}
		}
		
		return oddInteger.iterator().next();
	}
	
	public static int performWithXOR(int[] list) {
		int uniqueDeliveryId = 0;
		
		for (int deliveryId : list) {
			uniqueDeliveryId ^= deliveryId;
		}
		
		return uniqueDeliveryId;
	}
}
