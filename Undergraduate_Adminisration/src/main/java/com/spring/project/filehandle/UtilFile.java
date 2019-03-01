package com.spring.project.filehandle;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;


//@Component > @Service
//: 스프링 프레임워크가 관리하는 컴포넌트의 일반적 타입 
//: 개발자가 직접 조작이 가능한 클래스의 경우 해당 어노테이션을 붙임
//: ( <=> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용)
@Component
//AbstractView : 스프링 MVC 사용시 DispatcherServlet 기능
//: requestURI에 따라 컨트롤러로 분기하고 로직 처리 후 Resolver를 사용하여
//: 해당 jsp 파일을 찾아 응답하게 되는데 그 사이 시점을 잡아 처리하는 부분의 기능
public class UtilFile extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
setContentType("application/download; charset=utf-8");
        
        File file = (File) model.get("downloadFile");
        
        response.setContentType(getContentType());
        response.setContentLength((int) file.length()); 
        
        String header = request.getHeader("User-Agent");
        boolean b = header.indexOf("MSIE") > -1;
        String fileName = null;
        
        if (b) {
            fileName = URLEncoder.encode(file.getName(), "utf-8");
        } else {
            fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
        }
        
        response.setHeader("Conent-Disposition", "attachment); filename=\"" + fileName + "\";");
        response.setHeader("Content-Transter-Encoding", "binary");
        
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        
        try {
            fis = new FileInputStream(file);
            
            FileCopyUtils.copy(fis, out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException ioe) {
                    ioe.printStackTrace();
                }
            }
            
            out.flush();
        }
	}
	
}
