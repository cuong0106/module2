package tong_quan_web.thuc_hanh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "display_discountServlet",urlPatterns = "/display_discount")
public class display_discountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float discount_percent = Float.parseFloat(request.getParameter("discount_percent"));
        float Discount_Amount = price*(discount_percent/100);
        float Discount_Price = price*discount_percent-Discount_Amount;
        PrintWriter writer = response.getWriter();

        writer.println("<html><head>\n" +
                "        <title>Product Discount Calculator</title>\n" +
                "        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n" +
                "    </head>\n" +
                "    <body>\n" +
                "        <div id=\"content\">\n" +
                "            <h1>Product Discount Calculator</h1>\n" +
                "            <label>Product Description: </label>\n" +
                "            <span>" +
                description +
                "            </span><br>\n" +
                "            <label>Price: </label>\n" +
                "            <span>$" +
                (int)price +
                "            </span><br>\n" +
                "            <label>Discount Percent: </label>\n" +
                "            <span>" +
                (int)discount_percent +
                "            %</span><br>\n" +
                "            <label>Discount Amount: </label>\n" +
                "            <span>$" +
                (int)Discount_Amount +
                "            </span><br>\n" +
                "            <label>Discount Price: </label>\n" +
                "            <span>$" +
                (int)Discount_Price +
                "            </span><br>\n" +
                "        </div>\n" +
                "    \n" +
                "</body></html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
