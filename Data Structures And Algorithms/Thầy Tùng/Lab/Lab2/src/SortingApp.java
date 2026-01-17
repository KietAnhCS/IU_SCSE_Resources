public class SortingApp {
	public static void test(Array a) {
		long startTime, endtime;
		Array clone1 = a.clone(); 
		Array clone2 = a.clone(); 
		Array clone3 = a.clone();
		
		System.out.println("Test case: " + a.getnElems());
		// --- bubble sort ---
//		clone1.display();
		startTime = TimeUtils.now();
		clone1.bubbleSort();
		endtime = TimeUtils.now();
		System.out.printf("Bubble Sort: %d ms\n", endtime - startTime);
//		clone1.display();
		System.out.println();
		
		// --- selection sort ---
//		clone2.display();
		startTime = TimeUtils.now();
		clone2.selectionSort();
		endtime = TimeUtils.now();
		System.out.printf("Selection Sort: %d ms\n", endtime - startTime);
//		clone2.display();
		System.out.println();
		
		// --- Insertion sort ---
//		clone3.display();
		startTime = TimeUtils.now();
		clone3.insertionSort();
		endtime = TimeUtils.now();
		System.out.printf("Insertion Sort: %d ms\n", endtime - startTime);
//		clone3.display();
		System.out.println();
	}

	public static void main(String[] args) {
		Integer testNum = (Integer) 25000;
		Array a = new Array(testNum);
		a.randomInit(testNum);
		a.selectionSort();
		a.inverse();
		test(a);
	}
}
