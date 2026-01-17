class Node<T> {
	private Node<T> next = null;
	private T data = null;

	public Node(T data) {
		this.data = data;
	}

	public void setNext(Node<T> next) {
		this.next = next;
	}

	public void setData(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public Node<T> getNext() {
		return next;
	}

	@Override
	public Node<T> clone() {
		Node<T> cloner = new Node<T>(this.data);
		cloner.setNext(getNext());
		return cloner;
	}

	@Override
	public String toString() {
		if (this.data == null)
			return "null";
		return this.data.toString();
	}
}

public class CircularLinkedList<T> {
	private Node<T> current = null;
	private Node<T> first = null;
	private Node<T> end = null;
	private Integer size = 0;

	public CircularLinkedList() {

	}

	public Boolean isEmpty() {
		if (first == null)
			return true;
		else
			return false;
	}
	
	public void insert(T data) {
		if (first == null) {
			Node<T> newLink = new Node<T>(data);
			first = newLink;
			current = newLink;
			end = newLink;
			current.setNext(first);
		} else {
			current.setNext(new Node<T>(data));
			current.getNext().setNext(first);
			current = current.getNext();
			end = current;
		}
		size++;
	}

	public Node<T> search(T data) {
		Node<T> trace = first;

		if (first == null)
			return null;

		do {
			if (trace.getData() == data)
				return trace;
			trace = trace.getNext();
		} while (trace != first);
		return null;
	}

	public void step() {
		current = current.getNext();
	}

	public void delete(T data) {
		Node<T> trace = first;
		Node<T> prev = end;

		if (first == null)
			return;

		if (first.getNext() == first && first.getData() == data) {
			first = null;
			return;
		}
		

		if (first.getNext() != first) {
			if (first.getData() == data) {
				trace = first.getNext();
				prev.setNext(first.getNext());
				size--;
			}
			do {
				if (trace.getData() == data) {
					prev.setNext(trace.getNext());
					trace = trace.getNext();
					size--;
				}
				prev = prev.getNext();
				trace = trace.getNext();
			} while (trace != first);
		}
	}

	public void display() {
		System.out.println("CircularLinkedList: " + this.toString());
	}
	
	public Node<T> getCurrent() {
		return current;
	}
	
	public void setCurrent(Node<T> current) {
		this.current = current;
	}

	public Integer size() {
		return size;
	}

	@Override
	public String toString() {
		String string = new String();
		Node<T> trace = first;

		if (trace == null)
			return "null";

		do {
			string += trace.toString() + " ";
			trace = trace.getNext();
		} while (trace != first);

		return string;
	}
}
