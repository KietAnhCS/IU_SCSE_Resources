
public class Problem2_JosephusProblem {
	public static CircularLinkedList<Integer> groupOfPeople = new CircularLinkedList<>() {
		@Override
		public void display() {
			System.out.println("Group remain: " + groupOfPeople.toString());
		}
	};
	public static Integer startAt;
	
	public static void init(Integer numbOfPeople) {
		for (int i=0; i<numbOfPeople; i++)
			groupOfPeople.insert(i);
	}
	
	public static Integer getSurvival() {
		Integer locate = startAt;
		groupOfPeople.setCurrent(groupOfPeople.search(startAt));
		while (groupOfPeople.size() > 1) {
			
			System.out.println("------------");
			
			System.out.printf("People at %d kill %d: \n",groupOfPeople.getCurrent().getData() ,groupOfPeople.getCurrent().getNext().getData());
			groupOfPeople.delete(groupOfPeople.getCurrent().getNext().getData());
			groupOfPeople.display();
			locate = groupOfPeople.getCurrent().getData();
			groupOfPeople.step();
			System.out.println("Remain: " + groupOfPeople.size());
		}
		System.out.println("------------");
		return locate;
	}
	
	public static void main(String[] args) {
		init(10);
		startAt = 1;
		groupOfPeople.display();
		System.out.println("Last man standing: " + getSurvival());
	}
}
