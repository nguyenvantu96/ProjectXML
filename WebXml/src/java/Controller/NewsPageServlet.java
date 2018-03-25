/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.CsgoEntities;
import Entities.HomeEntites;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author TUYEN
 */
public class NewsPageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String URLHltv = "https://www.hltv.org/";
    private ArrayList<String> imgUrl;
    private String img;
    private List<HomeEntites> listDataPage;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String a=  request.getParameter("link");
        listDataPage = getData();
        CsgoEntities csgoList  = getDataPaper(a);
        request.setAttribute("link", csgoList);
        request.setAttribute("listDataCsgo", listDataPage);
        RequestDispatcher rd = request.getRequestDispatcher("NewsPage.jsp");
        rd.forward(request, response);
    }
    
     public  CsgoEntities  getDataPaper(String link) throws IOException {
         CsgoEntities cs = null ;
        Document d = Jsoup.connect("https://www.hltv.org/"+link).get();
        Elements elesImg = d.select("div[class=newsitem standard-box]");
        String p = null;
        for (Element el : elesImg) {
            Elements span = el.select(".headertext");          
            String temp = el.select("p").text();
            Elements ps = d.select("p:not([class])");       
            String psa = d.select(".image").attr("src");
            cs = new CsgoEntities();
            cs.setTitile(span.text());
            cs.setP(temp);
            cs.setImg(psa);
         
        }
        return cs;
    }
      public List<HomeEntites> getData() {
        List<HomeEntites> listData = new ArrayList<>();

        try {
            HomeEntites page;
            Document d = Jsoup.connect(URLHltv).get();
            Elements elesImg = d.select("div.contentCol");
            String img_url = null;
            String[] tempTitile = null;

            String href = null;
            ArrayList<String> arrayHref = new ArrayList<>();
            imgUrl = new ArrayList<>();
            for (Element ele : elesImg) {
                for (Element elementImg : ele.select("[class=newsflag flag]")) {
                    String img = elementImg.attr("src");
                    imgUrl.add(img);
                }
                img = ele.select(".hero-image").outerHtml();
                String newstext = "<div class=\"newstext\">";
                String title = ele.select("div[class=standard-box standard-list] a div[class=newstext]").outerHtml();
                String tempSplit = title.trim().replaceAll(newstext, "");
                tempTitile = tempSplit.trim().replaceAll("\\s+", " ").split("</div>");
                String imgLogo = ele.select("div.hero-con a[class=big-image-news a-reset] img.hero-image").attr("src");
                String hrefLogo = ele.select("div.hero-con a[class=big-image-news a-reset]").attr("href");

            }

            Elements getHref = d.select("div[class=standard-box standard-list]");
            for (Element ele : getHref) {
                for (Element ad : ele.select("a")) {
                    String hrefString = ad.attr("href");
                    arrayHref.add(hrefString);
                }
            }
            System.out.println("++++++++");
            for (int i = 0; i < tempTitile.length; i++) {
                page = new HomeEntites();
                page.setTitile(tempTitile[i]);
                page.setHref(arrayHref.get(i));
                page.setImg(imgUrl.get(i));
                listData.add(page);
            }

        } catch (IOException ex) {

        }
        return listData;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
