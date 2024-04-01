package Util;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import LocalStrays.AnimalServlet;

public class LocalStrayListUpdateListener implements ServletContextListener {
	private static final long UPDATE_INTERVAL = 60 * 60 * 1000;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			updateData(); // 초기 데이터 업데이트

			// 타이머 설정
			Timer timer = new Timer();
			TimerTask task = new TimerTask() {
				@Override
				public void run() {
					updateData(); // 주기적으로 데이터 업데이트
				}
			};
			timer.schedule(task, UPDATE_INTERVAL, UPDATE_INTERVAL); // 처음 실행은 0초 후에 시작하고, 그 이후로는 UPDATE_INTERVAL마다 실행

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void updateData() {
		try {
			AnimalServlet.allAnimalList = AnimalServlet.getAllAnimal();
			AnimalServlet.localGovernmentList = AnimalServlet.getLocalGovernmentList();
			System.out.println("AllAnimalUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
