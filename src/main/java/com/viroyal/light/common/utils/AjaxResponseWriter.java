package com.viroyal.light.common.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Maps;

/**
 * 当前端通过ajax请求时，直接将返回结果写回前端
 * @author yangwk
 */
public class AjaxResponseWriter {

	/**
	 * 写回数据到前端
	 * @param request
	 * @param response
	 * @param message 返回的描述信息
	 * @throws IOException
	 */
	public static void write(HttpServletRequest request, HttpServletResponse response, int code, String message) throws IOException{
		String contentType = "application/json";
		response.setContentType(contentType);
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Credentials", "true");
		response.setHeader("Access-Control-Allow-Origin",request.getHeader("Origin"));
		
		Map<String, Object> map = Maps.newLinkedHashMap();
		map.put(BaseConstant.CODE, code);
		map.put(BaseConstant.MESSAGE, message);
		String result = JacksonHelper.toJson(map);
		PrintWriter out = response.getWriter();
		try{
			out.print(result);
			out.flush();
		} finally {
			out.close();
		}
	}
	
}
