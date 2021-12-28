package com.trism.jesica.Util;

import java.util.List;

/**
 * List에 저장된 값을 Round-robin 방식으로 하나씩 읽어온다.
 * @author devsong@trism.kr
 *
 * @param <T>
 */
public class CircularList<T> {
	private List<T> list;
	private int counter = 0;
	
	public CircularList(List<T> list) {
		this.list = list;
	}

	public synchronized T getOne() {
		if (counter >= list.size()) {
			counter = 0;
		}
		return list.get(counter++);
	}
}
