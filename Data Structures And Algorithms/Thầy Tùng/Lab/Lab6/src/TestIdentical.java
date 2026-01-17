
public class TestIdentical {

	public static void main(String[] args) {
		int value;
		Tree theTree = new Tree();

		theTree.insert(50, 1.5);
		theTree.insert(25, 1.25);
		theTree.insert(75, 1.75);
		theTree.insert(12, 1.12);
		theTree.insert(36, 1.36);
		theTree.insert(60, 1.60);
		theTree.insert(85, 1.85);
		
		Tree theTree2 = new Tree();
		theTree2.insert(50, 1.5);
		theTree2.insert(25, 1.25);
		theTree2.insert(75, 1.75);
		theTree2.insert(12, 1.12);
		theTree2.insert(36, 1.36);
		theTree2.insert(60, 1.60);
		theTree2.insert(85, 1.85);
		
		if (theTree.checkIdentical(theTree2))
			System.out.println("Identical");
		else
			System.out.println("Not identical");
	}

}
