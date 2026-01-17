import java.util.Stack;

public class App1 {
	public static String decToOcta(int dec){
		Stack<Integer> octForm = new Stack<>();
		String s = new String();
		if (dec==0) {
			octForm.push(0);
		}
		while (dec > 0) {
			octForm.push(dec%8);
			dec/=8;
		}
		
		while (octForm.isEmpty() != true) {
			s+=octForm.peek().toString();
			octForm.pop();
		}
		return s;
	}
	
	public static <T> Stack<T> concatenate(Stack<T> st1a, Stack<T> st2a) {
		Stack<T> st1 = (Stack<T>) st1a.clone();
		Stack<T> st2 = (Stack<T>) st2a.clone();
		Stack<T> stTemp = new Stack<T>();
		while (!st2.isEmpty()) {
			stTemp.push(st2.peek());
			st2.pop();
		}
		while (!stTemp.isEmpty()) {
			st1.push(stTemp.peek());
			stTemp.pop();
		}
		return st1;
	}
	
	public static <T> Boolean checkStackIdentical(Stack<T> st1, Stack<T> st2) {
		if (st1.size() != st2.size())
			return false;
		
		while (!st1.isEmpty()) {
			if (!st1.peek().equals(st2.peek()))
				return false;
			st1.pop();
			st2.pop();
		}
		return true;
	}
	
	public static void main(String[] args) {
		// ***** Decimal to Octa ***** //
		int dec = 100;
		System.out.println(decToOcta(dec));
		
		// ***** Concatenate ***** //
		Stack<Integer> st1 = new Stack<Integer>();
		Stack<Integer> st2 = new Stack<Integer>();
		
		st1.push(1);
		st1.push(2);
		st1.push(3);
		st1.push(4);
		st1.push(5);
		
		st2.push(6);
		st2.push(7);
		st2.push(8);
		st2.push(9);
		st2.push(10);
		
		Stack<Integer> st = new Stack<Integer>();
		st = concatenate(st1, st2);
		while (!st.isEmpty()) {
			System.out.print(st.peek() + " ");
			st.pop();
		}
	
		System.out.println();
		
		// ***** Check identical***** //
		st1.clear();
		st2.clear();
		
		st1.push(1);
		st1.push(2);
		st1.push(3);
		st1.push(4);
		st1.push(5);
		
		st2.push(1);
		st2.push(2);
		st2.push(3);
		st2.push(4);
		st2.push(5);
		
		System.out.println(checkStackIdentical(st1, st2));
		
	}
}
