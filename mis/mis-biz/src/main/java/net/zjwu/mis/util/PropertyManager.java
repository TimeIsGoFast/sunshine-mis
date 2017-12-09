package net.zjwu.mis.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 
 * @author Lay
 * 
 */
public class PropertyManager {

	private static Map<String, Properties> map = new HashMap<String, Properties>();

	private static Properties getProperties(String fileName) {
		if (map.containsKey(fileName)) {
			return map.get(fileName);
		} else {
			try {
				String filePath = System.getProperty("user.dir") + "/"
						+ fileName;
				File file = new File(filePath);
				InputStream in = null;
				if (file.exists()) {
					in = new FileInputStream(filePath);
				} else {
					in = PropertyManager.class.getClassLoader()
							.getResourceAsStream(fileName);
				}
				Properties p = new Properties();
				p.load(in);
				map.put(fileName, p);
				return p;
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}

	public static String getString(String fileName, String key) {
		Properties p = getProperties(fileName);
		return p.getProperty(key);
	}
}
