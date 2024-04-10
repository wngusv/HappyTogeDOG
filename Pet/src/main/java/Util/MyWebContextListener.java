package Util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import LocalStrays.Animal;
import LocalStrays.AnimalServlet;

public class MyWebContextListener implements ServletContextListener {
   private static DataSource dataSource;

   @Override
   public void contextInitialized(ServletContextEvent sce) {
      initDataSource();
      System.out.println("데이터베이스 연결 완료");

   }

   private void initDataSource() {
      BasicDataSource ds = new BasicDataSource();
      ds.setUrl("jdbc:mysql://192.168.0.106:3306/pet");
      ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
      ds.setUsername("wngus");
      ds.setPassword("wngus");

      dataSource = ds;
   }

   public static Connection getConnection() throws SQLException {
      return dataSource.getConnection();
   }

}