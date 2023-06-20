package el;

import java.util.Scanner;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}

	// 주민번호(문자열)를 입력받아 성별(문자열)을 반환하는 메서드
	//001225-3000000
	//001225-2000000
	public String getGender(String jumin) {
		String res = "";
		try {
			//시작인덱스(포함)와 끝인덱스(미포함)
			//System.out.println(str.substring(7,8));	
			// 문자열의 위치 확인		
			System.out.println(jumin.indexOf("-")+1);
			
			int startIndex = jumin.indexOf("-") + 1;
			int endIndex = startIndex + 1;
			String gender = jumin.substring(startIndex, endIndex);
			
			if(gender.equals("1") || gender.equals("3")) {
				res = "남자";
			} else if(gender.equals("2") || gender.equals("4")) {
				res = "여자";
			} else {
				// 예외를 발생
				// throw new Exception();
				res = "주민등록번호를 확인해주세요";
			}			
		} catch (Exception e) {
			res = "주민등록번호를 확인해주세요";
		}
		return res;
	}
	//========================================================
	// 입력받은 문자열이 숫자인지 판별하는 정적메서드
	public static boolean isNumber(String value) {
		/*
		try {
			Integer.parseInt(value);
			return true;
		} catch (Exception e) {
			return false;
		}
		 */
		
		//String str = "1234";
		
		/*
		char c = '0';
		char cc = '9';
		System.out.println("0 : " + (int)c);
		System.out.println("9 : " + (int)cc);
		48~57 사이면 숫자로 인식
		 */
		
		//배열을 돌면서 숫자인지 아닌지 확인
		char[] chArr = value.toCharArray();
		
		for(int i=0; i<chArr.length; i++) {
			//System.out.println(chArr[i]);
			// 0을 홑따옴표로 묶어주는 것이 중요
			// 문자가 포함되어 있으면 return false;
			if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
				return false;
				//System.out.println("문자가 포함되어 있습니다.");
			}
			//else {
			//	System.out.println("숫자입니다.");
			//}
		}
		return true;
	}
		
	//========================================================
	// 입력받은 정수까지 구구단을 HTML 테이블로 출력하는 정적메서드
	// 1~9단까지 출력
	public static String showGugudan(int limitDan) {
		//String str ="" + "" ;   //메모리낭비 (똑같은걸 계속 만들어내기 떄문에) 그래서 StringBuffer 사용
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1'>");
		
		for(int dan=2; dan<=limitDan; dan++) {
			sb.append("<tr>");
			for(int i=1; i<=9; i++) {
					sb.append("<td>");
					sb.append(dan+"*"+ i + "=" + (dan*i));
					sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		
		return sb.toString();		
	}

	//========================================================
	public static void main(String[] args) {
		// MyELClass el = new MyELClass();
		// System.out.println(el.getGender("001225-2000000"));
		
		// System.out.println(MyELClass.isNumber("123"));
	
		System.out.println(MyELClass.showGugudan(2));
		
		
	}
}	
	

