
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<div class="topbar">
    <div class="container">           
                <div class="topbar-text">
                    <span>工作时间：</span>
                    <span>周一到周五: 08AM-06PM</span>
                    <span id="time">
                        <script>
                            document.getElementById('time').innerHTML =
                                    new Date().toLocaleString()+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
                            setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
                                    1000);
                        </script>
                    </span>
                </div>  
    </div>
</div>
<header >
    
</header>

