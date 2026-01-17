import java.util.Stack;

public class App2 {
	public static Integer evaluate(String expression) {
		char[] tokens = expression.toCharArray();
		Stack<Integer> values = new Stack<Integer>();
		Stack<Character> operands = new Stack<Character>();

		for (int i = 0; i < tokens.length; i++) {
			if (tokens[i] != ' ') {
				if (tokens[i] >= '0' && tokens[i] <= '9') {
					StringBuffer sbuf = new StringBuffer();
					while (i < tokens.length && (tokens[i] >= '0' && tokens[i] <= '9')) {
						sbuf.append(tokens[i++]);
					}
					values.push(Integer.parseInt(sbuf.toString()));
				}
				else if (tokens[i] == '(')
					operands.push(tokens[i]);
				else if (tokens[i] == ')') {
					while (operands.peek() != '(')
						values.push(applyOp(operands.pop(), values.pop(), values.pop()));
					operands.pop();
				} else if (tokens[i] == '+' || tokens[i] == '-' || tokens[i] == '*' || tokens[i] == '/') {
					while (!operands.empty() && hasPrecedence(tokens[i], operands.peek()))
						values.push(applyOp(operands.pop(), values.pop(), values.pop()));
					operands.push(tokens[i]);
				}
			}
		}
		while (!operands.empty())
			values.push(applyOp(operands.pop(), values.pop(), values.pop()));
		return values.pop();
	}

	public static Boolean hasPrecedence(char op1, char op2) {
		if (op2 == '(' || op2 == ')')
			return false;
		if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
			return false;
		else
			return true;
	}

	public static Integer applyOp(char op, int b, int a) {
		switch (op) {
		case '+':
			return a + b;
		case '-':
			return a - b;
		case '*':
			return a * b;
		case '/':
			if (b == 0)
				throw new ArithmeticException("Divide by zero!");
			return a / b;
		}
		return 0;
	}

	public static void main(String[] args) {
		System.out.println(evaluate("20 + 10 / 2 + ( 2 - 5 * 3 )")); // 17
	}
}
