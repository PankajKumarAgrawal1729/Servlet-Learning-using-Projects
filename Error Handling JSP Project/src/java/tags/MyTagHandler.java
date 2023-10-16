/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 *
 * @author pankaj-13162
 */
public class MyTagHandler extends TagSupport {

    @Override
    public int doStartTag() throws JspException {
        try {
            //task 
            JspWriter out = pageContext.getOut();
            out.println("<h1>Custom Tag</h1>");
        } catch (IOException e) {
        }
        return SKIP_BODY;
    }
}
