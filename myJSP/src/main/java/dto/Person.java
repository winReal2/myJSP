package dto;

public class Person {
	//이름과 나이를 필드로 갖고 있음
	private String name;
	private int age;
	
	
	public Person() {

	}

	//매개변수를 받아 세팅
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}

}
