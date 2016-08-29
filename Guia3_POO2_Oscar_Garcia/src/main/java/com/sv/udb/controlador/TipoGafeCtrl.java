/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.TipoGafe;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author root
 * @version 1.0
 */
public class TipoGafeCtrl {

    /**
     * Método para Guardar datos en la tabla Tipo_Gafe
     * @param obje del modelo TipoGafe
     * @return devuelve false o true dependiendo si se ha guardado o no
     * @see elim
     * @since desde la version 1
     */
    public boolean guard(TipoGafe obje) {
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
     * Método para actualizar datos en la tabla Tipo_Gafe
     * @param obje del modelo TipoGafe
     * @return devuelve false o true dependiendo si se ha modificado o no
     * @see guard
     * @since desde la version 1
     */
    public boolean actu(TipoGafe obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            TipoGafe obj = em.find(TipoGafe.class, obje.getCodiTipoGafe());
            obj.setNombTipoGafe(obje.getNombTipoGafe());
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
     * Método para actualzar los datos de estado en la tabla Tipo_Gafe
     * @param obje del modelo TipoGafe
     * @return devuelve false o true dependiendo si se ha modificado o no
     * @see actu
     * @since desde la version 1
     */
     public boolean elim(TipoGafe obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            TipoGafe obj = em.find(TipoGafe.class, obje.getCodiTipoGafe());
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
     * Método para actualzar los datos de estado en la tabla Tipo_Gafe
     * @return list todos los datos consultados
     * @see elim
     * @since desde la version 1
     */
    public List<TipoGafe> consTodo() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POO2PU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("SELECT t FROM TipoGafe t WHERE t.esta = :esta");
        query.setParameter("esta", 1);
        List<TipoGafe> resultList = query.getResultList();
        em.close();
        emf.close();
        return resultList;
    }

}
