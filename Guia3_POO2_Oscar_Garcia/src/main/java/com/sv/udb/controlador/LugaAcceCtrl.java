/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.LugaAcce;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Oscar
 * @version 1.0
 */
public class LugaAcceCtrl {

    /**
     * Método para Guardar datos en la tabla Luga_Acce
     * @param obje del modelo LugaAcce
     * @return devuelve false o true dependiendo si se ha guardado o no
     * @see TipoDocu.guar()
     * @since desde la version 1
     */
    public boolean guard(LugaAcce obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        et.begin();
        try {
            em.persist(obje);
            et.commit();
            resp = true;
        } catch (Exception ex) {
            et.rollback();
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    /**
     * Método para actualizar datos en la tabla Luga_Acce
     * @param obje del modelo LugaAcce
     * @return devuelve false o true dependiendo si se ha modificado o no
     * @see TipoDocu.actu()
     * @since desde la version 1
     */
    public boolean actu(LugaAcce obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            LugaAcce obj = em.find(LugaAcce.class, obje.getCodiLugaAcce());
            obj.setNombLugaAcce(obje.getNombLugaAcce());
            em.getTransaction().commit();
            resp = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    /**
     * Método para actualzar los datos de estado en la tabla Luga_Acce
     * @param obje del modelo LugaAcce
     * @return devuelve false o true dependiendo si se ha modificado o no
     * @see TipoDocu.guar()
     * @since desde la version 1
     */
    public boolean elim(LugaAcce obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            LugaAcce obj = em.find(LugaAcce.class, obje.getCodiLugaAcce());
            obj.setEsta(obje.getEsta());
            em.getTransaction().commit();
            resp = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }

    /**
     * Método para actualzar los datos de estado en la tabla Luga_Acce
     * @return list todos los datos consultados
     * @see elim
     * @since desde la version 1
     */
    public List<LugaAcce> consTodo() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("SELECT l FROM LugaAcce l WHERE l.esta = :esta");
        query.setParameter("esta", 1);
        List<LugaAcce> resultList = query.getResultList();
        em.close();
        emf.close();
        return resultList;
    }
}
