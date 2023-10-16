package com.kopo.hanaglobal.hana_global.web.interceptor;

import com.kopo.hanaglobal.hana_global.web.entity.Member;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("---------------preHandle 로그인 체크 동작-----------------");
        System.out.println("서블릿 Path = " + request.getServletPath());
        System.out.println("context Path = " +request.getContextPath());
        System.out.println("URI Path = " + request.getRequestURI());

        HttpSession session = request.getSession();
        session.setAttribute("dest", request.getServletPath());
        System.out.println("도착지: " + session.getAttribute("dest"));

        Member member = (Member) session.getAttribute("currentMember");

        if (member == null) {
            System.out.println("member is null");
            response.sendRedirect(request.getContextPath()+"/");
            return false;
        }  else if ("N".equals(member.getStatus()) && !"/accountInfo".equals(request.getServletPath()) && !"/error_page".equals(request.getServletPath())) {
            System.out.println(member.getStatus());
            response.sendRedirect(request.getContextPath()+"/error_page");
            return false;
        }  else {
            System.out.println("member 로그인 했음");
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
