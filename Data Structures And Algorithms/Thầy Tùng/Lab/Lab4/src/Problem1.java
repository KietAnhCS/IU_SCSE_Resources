
public class Problem1 {
	private static CircularLinkedList<Integer> myList = new CircularLinkedList<>();
	
	public static void main(String[] args) {
		myList.insert(0);
		myList.insert(1);
		myList.insert(2);
		myList.display();
		
		if (myList.search(2) != null)
			System.out.println("Found: " + myList.search(2));
		else
			System.out.println("Found null");
		
		myList.delete(2);
		myList.display();
	}
}
