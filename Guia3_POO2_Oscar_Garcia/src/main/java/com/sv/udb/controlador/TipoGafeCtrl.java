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
 */
public class TipoGafeCtrl {

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
