<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>

<!-- css충돌나서 잘 안읽혀질 수 있어서 삭제함! -->

<%  LocalDate today = LocalDate.now(); //오늘날짜
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); // 내일날짜 
%>