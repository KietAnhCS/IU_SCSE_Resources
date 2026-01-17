class OrderArray {
	private long[] a; // ref to array a
	private int nElems; // number of data items
	
	public OrderArray(int max) // constructor
	{
		a = new long[max]; // create array
		nElems = 0;
	}

	public int size() {
		return nElems;
	}

	public void insert(long value) // put element into array
	{
		int j;
		for (j = 0; j < nElems; j++) // find where it goes
			if (a[j] > value) // (linear search)
				break;
		for (int k = nElems; k > j; k--) // move bigger ones up
			a[k] = a[k - 1];
		a[j] = value; // insert it
		nElems++; // increment size
	} 
	
	public void display() // displays array contents
	{
		for (int j = 0; j < nElems; j++) // for each element,
			System.out.print(a[j] + " "); // display it
		System.out.println("");
	}
	
	public long getMedian() {
		long median;
		if (nElems % 2 == 0)
		    median = (a[nElems/2] + a[nElems/2 - 1])/2;
		else
		    median = a[nElems/2];
		return median;
	}
}
//<!-------------------------------------------------------------------/>
public class Sample2 {
	public static void main(String[] args) {
		OrderArray arr = new OrderArray(100);
		arr.insert(5);
		arr.insert(7);
		arr.insert(8);
		arr.insert(11);
		arr.insert(0);
		arr.insert(2);
		arr.insert(1);
		arr.insert(7);
		arr.insert(66);
		arr.insert(99);
		
		System.out.println("Array: ");
		arr.display();
		System.out.println("Get Median: " + arr.getMedian());
	}
}
