package com.wipro.srs.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class DBUtil {

	private static final SessionFactory sessionFactory;
	
	static{
		try{
			sessionFactory =new AnnotationConfiguration().configure().buildSessionFactory();
		}catch(Throwable ex)
		{
			System.out.println("Initial Session factory creation failed "+ex );
			throw new ExceptionInInitializerError(ex);
		}
	}
	public static SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}
}
