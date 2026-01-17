package lab5;

import java.util.Arrays;

public class Lab5 {

	public static int puzzle(int base, int limit) {
		if (base > limit)
			return -1;
		else if (base == limit)
			return 1;
		else
			return base * puzzle(base + 1, limit);
	}

	public static double sumc4(int n) {
		if (n == 1)
			return 1;
		else
			return 1f / n + sumc4(n - 1);
	}

	public static int sumc5(int n) {
		if (n == 1)
			return 1;
		else
			return n + sumc5(n - 1);
	}

	public static int findmin(int a[], int n) {
		if (n == 0)
			return a[0];
		else {
			int min = Math.min(a[n - 1], findmin(a, n - 1));
			return min;
		}
	}

	public static int findsum(int a[], int n) {
		if (n == 1)
			return a[0];
		else
			return a[n - 1] + findsum(a, n - 1);
	}

	public static int gcd(int p, int q) {
		if (q == 0)
			return p;
		else
			return gcd(q, p % q);
	}

	public static void main(String[] args) {
		System.out.println("puzzle(14, 10) = " + puzzle(14, 10));
		System.out.println("puzzle(4 , 7 ) = " + puzzle(4, 7));
		System.out.println("puzzle(0 , 0 ) = " + puzzle(0, 0));

		System.out.println("sumc4(3) = " + sumc4(2));
		System.out.println("sumc5(5) = " + sumc5(5));

		int a[] = { -9, 2, 3, 4, -5, 6, 7 };

		System.out.println("a[] =  " + Arrays.toString(a));

		System.out.println("findmin(a, a.length) = " + findmin(a, a.length));
		System.out.println("findsum(a, a.length) = " + findsum(a, a.length));
		System.out.println("gcd(45, 15) = " + gcd(45, 15));
	}
}
