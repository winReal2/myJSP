package common;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSPFunction {

	public JSPFunction() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 알림창을 띄운후 명시한 URL로 이동합니다.
	 * (URL버전)
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			// 삽입할 자바스크립트 코드
			String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+ "		location.href='" + url + "';"
						+ "</script>";
			// 화면에 출력을 위해
			// 우리가 작성한 자바스크립트 코드를 out 내장객체로 출력
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 알림창을 띄운후 이전 페이지로 이동합니다.
	 * (히스토리(-1) 버전)
	 * @param msg
	 * @param out
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
				+ "<script>"
				+ "		alert('" + msg + "');"
				+ "		history.go(-1)"
				+ "</script>";
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
