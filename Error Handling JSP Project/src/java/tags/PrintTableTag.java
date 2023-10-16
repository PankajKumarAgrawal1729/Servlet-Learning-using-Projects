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
public class PrintTableTag extends TagSupport {

    public int number;

    //setter
    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            for (int i = 1; i <= 10; i++) {
                out.println(number * i);
            }
        } catch (IOException e) {
        }

        return SKIP_BODY;
    }
}
