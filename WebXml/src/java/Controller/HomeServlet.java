/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.CsgoEntities;
import Entities.GenkMobileEntities;
import Entities.HomeEntites;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import sun.rmi.server.Dispatcher;

/**
 *
 * @author TUYEN
 */
public class HomeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private List<HomeEntites> listDataPage;
    private final String URLHltv = "https://www.hltv.org/";
    private final String UrlGenk = "http://genk.vn/mobile.chn";
    private String img;
    private ArrayList<String> imgUrl;
    private List<GenkMobileEntities> listDataGenk;
    private GenkMobileEntities genkM;
    private CsgoEntities csgo;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        listDataPage = getData();
        listDataGenk = getDataMobile();
        genkM = getDataOne();
        request.setAttribute("logo", csgo);
        request.setAttribute("listData", listDataPage);
        request.setAttribute("listMobile", listDataGenk);
        request.setAttribute("entitesList", genkM);
        RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        rd.forward(request, response);
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
                csgo = new CsgoEntities();
                csgo.setImg(imgLogo);
                csgo.setHref(hrefLogo);
                if (ele.select("div.hero-con div[class=hero-text]").text() != null) {
                    csgo.setTitile(ele.select("div[class=hero-text]").text());
                } else {
                    csgo.setTitile("STARSERIES I-LEAGUE S4 AND IEM KATOWICE: THE EVPS");
                }

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

    public GenkMobileEntities getDataOne() {
        GenkMobileEntities data = null;
        try {
            Document d = Jsoup.connect(UrlGenk).get();
            Elements elesImg = d.select("div[class=gbwnpw-left fl]");
            for (Element e : elesImg) {

                String href = e.select("a[class=show-popup visit-popup]").attr("href");
                String title = e.select("a[class=show-popup visit-popup]").attr("titile");
                String img = e.select("a[class= gbwnpw-ava knswa_border show-popup visit-popup] img").attr("src");
                String supTitie = e.select(" span[class=gbwnpw-sapo]").text();
                data = new GenkMobileEntities(img, title, supTitie, href);

            }
        } catch (IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
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
