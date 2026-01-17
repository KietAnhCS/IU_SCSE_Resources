import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

public class Array {
	private Integer nElems;
	private Long[] a;
	private Integer maxElems;

	public Array(Integer maxElems) {
		this.maxElems = maxElems;
		a = new Long[maxElems];
	}

	public void randomInit(int numElements) { 
		Random aRandom = new Random();
		nElems = numElements;
		for (int i = 0; i < nElems; i++) {
			a[i] = aRandom.nextLong() % 100000;
		}
	}
	
	public void inverse() {
		Long[] inver = new Long[maxElems];
		for (int i=0; i<nElems; i++) {
			inver[i] = a[nElems-i-1];
		}
		a = inver;
	}

	public void bubbleSort() {
		Long temp;
		for (int out = 0; out < nElems-1; out++) {
			for (int in = 0; in < nElems-i-1; in++) {
				if (a[in] > a[in+1]) {
					temp = a[in];
					a[in] = a[out];
					a[out] = temp;
				}
			}
		}
	}

	public void selectionSort() {
		int min;
		for (int out=0; out < nElems-1; out++) {
			min = out;
			for (int in = out+1; in<nElems; in++) {
				if (a[in] < a[min])
					min = in;
			}
			
			long smallerNum = a[min];
			a[min] = a[out];
			a[out] = smallerNum;
		}
	}

	public void insertionSort() {
		int in = 0;
		Long temp = (long) 0;
		for (int out = 1; out < nElems; out++) {
			temp = a[out];
			in = out;
			while ((in > 0) && (a[in-1] >= temp)) {
				a[in] = a[in-1];
				--in;
			}
			a[in] = temp;
		}
	}

	public void display() {
		for (int i = 0; i < nElems; i++) {
			System.out.print(a[i] + " ");
		}
		System.out.println("");
	}

	public int size() {
		return nElems;
	}
	
	public Array clone() {
		Array clone = new Array(this.maxElems);
		clone.nElems = this.nElems;
		for (int i=0; i<nElems; i++)
			clone.a[i] = this.a[i];
		return clone;
	}

	public Integer getnElems() {
		return nElems;
	}

	public Long[] getA() {
		return a;
	}

	
}
