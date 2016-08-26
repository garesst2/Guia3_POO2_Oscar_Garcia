/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.sv.udb.controlador.LugaAcceCtrl;
import com.sv.udb.modelo.LugaAcce;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author root
 */
@WebServlet(name = "LugaAcceServ", urlPatterns = {"/LugaAcceServ"})
public class LugaAcceServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean esValido = request.getMethod().equals("POST");
        if (esValido) {
            String mens = "";
            try {
                String CRUD = request.getParameter("frmLugar");
                if (!CRUD.equals("")) {
                    if (CRUD.equals("Guardar")) {
                        LugaAcce obje = new LugaAcce();
                        obje.setNombLugaAcce(request.getParameter("txtlugar"));
                        Calendar Calendario = new GregorianCalendar().getInstance();
                        Date hoy = Calendario.getTime();
                        SimpleDateFormat fm = new SimpleDateFormat("dd/MM/yyyy H:m:s");
                        String fecha = fm.format(hoy);
                        obje.setFechAlta(hoy);
                        obje.setEsta(1);
                        mens = new LugaAcceCtrl().guard(obje) ? "Datos guardados" : "Datos NO guardados";
                    } else if (CRUD.equals("Modificar")) {
                        LugaAcce obje = new LugaAcce();
                        obje.setCodiLugaAcce(Long.parseLong(request.getParameter("txtlugarid")));
                        obje.setNombLugaAcce(request.getParameter("txtlugar"));
                        mens = new LugaAcceCtrl().actu(obje) ? "Datos guardados" : "Datos NO guardados";
                    }else if (CRUD.equals("Eliminar")) {
                        LugaAcce obje = new LugaAcce();
                        obje.setCodiLugaAcce(Long.parseLong(request.getParameter("txtlugarid")));
                        obje.setEsta(0);
                        mens = new LugaAcceCtrl().elim(obje) ? "Datos guardados" : "Datos NO guardados";
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("mensAler", mens);
            request.setAttribute("estado", "3");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
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
