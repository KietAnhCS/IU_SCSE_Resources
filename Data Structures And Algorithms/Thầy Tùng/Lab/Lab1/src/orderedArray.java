// orderedArray.java
// demonstrates ordered array class
// to run this program: C>java OrderedApp
////////////////////////////////////////////////////////////////
class OrdArray {
	private long[] a; // ref to array a
	private int nElems; // number of data items
	// -----------------------------------------------------------

	public OrdArray(int max) // constructor
	{
		a = new long[max]; // create array
		nElems = 0;
	}

	// -----------------------------------------------------------
	public int size() {
		return nElems;
	}

	// -----------------------------------------------------------
	public int find(long searchKey) {
		int lowerBound = 0;
		int upperBound = nElems - 1;
		int curIn;

		while (true) {
			curIn = (lowerBound + upperBound) / 2;
			if (a[curIn] == searchKey)
				return curIn; // found it
			else if (lowerBound > upperBound)
				return nElems; // can't find it
			else // divide range
			{
				if (a[curIn] < searchKey)
					lowerBound = curIn + 1; // it's in upper half
				else
					upperBound = curIn - 1; // it's in lower half
			} // end else divide range
		} // end while
	} // end find()
		// -----------------------------------------------------------

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
	} // end insert()
		// -----------------------------------------------------------

	public boolean delete(long value) {
		int j = find(value);
		if (j == nElems) // can't find it
			return false;
		else // found it
		{
			for (int k = j; k < nElems; k++) // move bigger ones down
				a[k] = a[k + 1];
			nElems--; // decrement size
			return true;
		}
	} // end delete()
		// -----------------------------------------------------------

	public void display() // displays array contents
	{
		for (int j = 0; j < nElems; j++) // for each element,
			System.out.print(a[j] + " "); // display it
		System.out.println("");
	}

	// -----------------------------------------------------------
	public OrdArray merge(OrdArray inputArr, int maxSize) {
		OrdArray newArr = new OrdArray(maxSize);

		int idxA = 0;
		int idxB = 0;

		while (idxA < this.nElems || idxB < inputArr.nElems) {
			if (idxA == this.nElems || this.a[idxA] > inputArr.a[idxB]) {
				newArr.a[newArr.nElems++] = inputArr.a[idxB];
				idxB++;
			} else if (idxB == inputArr.nElems || this.a[idxA] <= inputArr.a[idxB]) {
				newArr.a[newArr.nElems++] = this.a[idxA];
				idxA++;
			}
		}

		return newArr;
	}
} // end class OrdArray
	////////////////////////////////////////////////////////////////

class OrderedApp {
	public static void main(String[] args) {
		int maxSize = 100; 
		OrdArray arr = arr = new OrdArray(maxSize); 
		OrdArray arr2 = arr2 = new OrdArray(maxSize); 

		arr.insert(1);
		arr.insert(3);
		arr.insert(2);

		arr2.insert(2);
		arr2.insert(77);
		arr2.insert(99);
		arr2.insert(44);
		arr2.insert(55);
		arr2.insert(22);
		arr2.insert(88);
		arr2.insert(11);
		arr2.insert(00);
		arr2.insert(66);
		arr2.insert(33);
		
		OrdArray mergedArray = arr.merge(arr2, 2*maxSize);
		System.out.println("Merged Array: ");
		mergedArray.display();
	} // end main()
} // end class OrderedApp
