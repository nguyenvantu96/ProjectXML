/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.GenkMobileEntities;
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
public class PageMobile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String UrlGenk = "http://genk.vn/mobile.chn";
    private List<GenkMobileEntities> listDataGenk;
    private String link;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        link = request.getParameter("link");
        GenkMobileEntities gs = getDataPaper();
        listDataGenk = getDataMobile();
        request.setAttribute("data", gs);
        request.setAttribute("listMobile", listDataGenk);
        RequestDispatcher rd = request.getRequestDispatcher("PageOfMobile.jsp");
        rd.forward(request, response);
    }

    public GenkMobileEntities getDataPaper() throws IOException {
        GenkMobileEntities gs = new GenkMobileEntities();
        Document d = Jsoup.connect("http://genk.vn" + link).get();
        Elements elesImg = d.select("div[class=fr w640]");
        String titile;
        String content;
        
         
        String time;
        for (Element el : elesImg) {
            Elements imgB = el.select("div[class=knc-content] img");
            titile = el.select("h2.knc-sapo").text();
            content = el.select("div.knc-content").text();
            gs.setImg(imgB.attr("src"));
            gs.setTitle(titile);
            gs.setTileSub(content);
        }
        Elements ele = d.select("div[class=kbwc-meta]");
        for (Element el : ele) {
            time = ele.select("span[class=kbwcm-time]").text();
            gs.setTime(time);
        }

        return gs;
    }

    public List<GenkMobileEntities> getDataMobile() {
        List<GenkMobileEntities> listGenk = new ArrayList<>();
        try {
            GenkMobileEntities gk;
            Document d = Jsoup.connect(UrlGenk).get();
            Elements elesImg = d.select("div[class=kds-new-stream-wrapper listpopup]");
            List<String> imgList = new ArrayList<>();
            List<String> hrefList = new ArrayList<String>();
            List<String> titleList = new ArrayList<>();
            List<String> subTitile = new ArrayList<>();
            for (Element ele : elesImg) {
                for (Element e : ele.select("li[class=knswli clearfix] div[class=knswli-left fl] img")) {
                    String img = e.attr("src");
                    imgList.add(img);
                }
                for (Element e : ele.select("li[class=knswli clearfix] h4[class=knswli-title] a[class=show-popup visit-popup]")) {
                    String aHref = e.attr("href");
                    String title = e.attr("title");
                    hrefList.add(aHref);
                    titleList.add(title);
                }
                for (Element e : ele.select("li[class=knswli clearfix] span[class=knswli-sapo]")) {
                    String subTit = e.text();
                    subTitile.add(subTit);
                }

            }

            for (int i = 0; i < imgList.size(); i++) {
                gk = new GenkMobileEntities();
                gk.setImg(imgList.get(i));
                gk.setAherf(hrefList.get(i));
                gk.setTitle(titleList.get(i));
                gk.setTileSub(subTitile.get(i));
                listGenk.add(gk);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listGenk;
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
