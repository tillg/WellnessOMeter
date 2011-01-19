package com.tillg.WellnessMeter;

import javax.servlet.*;
import javax.servlet.http.*;

import java.text.SimpleDateFormat;
import java.util.HashMap;

public class AddWeight extends HttpServlet {
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			java.io.IOException {
		HttpSession session = request.getSession(true);
		String jspPage = "/weights.jsp";
		String dateStr = request.getParameter("date");
		String weightStr = request.getParameter("weightvalue");
		try {
			UserWeights.addWeight(dateStr, weightStr);
		} catch (Exception e) {
			session.setAttribute("error", e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher(jspPage);
		dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			java.io.IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			java.io.IOException {
		processRequest(request, response);
	}

}
