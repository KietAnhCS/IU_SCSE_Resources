class Array {
	private long[] a; // ref to array a
	private int nElems; // number of data items
	// -----------------------------------------------------------

	public Array(int max) // constructor
	{
		a = new long[max]; // create the array
		nElems = 0; // no items yet
	}

	public void insert(long value) // put element into array
	{
		a[nElems] = value; // insert it
		nElems++; // increment size
	}

	public void display() // displays array contents
	{
		for (int j = 0; j < nElems; j++) // for each element,
			System.out.print(a[j] + " "); // display it
		System.out.println("");
	}
	
	public long convertToLongNum() {
		long num = 0;
		for (int i=0; i<nElems; i++) {
			num += a[i] * Math.pow(10, nElems - i - 1);
		}
		return num;
	}
	
}
// <!---------------------------------------------------------/>
public class Sample1 {
	public static void main(String[] args) {
		Array arr = new Array(100);
		arr.insert(2);
		arr.insert(0);
		arr.insert(0);
		arr.insert(2);
		arr.insert(1);
		arr.insert(9);
		arr.insert(9);
		arr.insert(8);
		
		System.out.println("Number: " + arr.convertToLongNum());
	}
}
