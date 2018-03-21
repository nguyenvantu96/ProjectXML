/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author nguye
 */
public class DBConnection {
          private final String FILE_PATH = "config.properties";
    
    private Properties readPropertiesFile() throws FileNotFoundException, IOException {
        Properties p = new Properties();
        InputStream is = getClass().getClassLoader().getResourceAsStream(FILE_PATH);
        if (is == null) {
            throw new FileNotFoundException("File config is not found!");
        } else {
            p.load(is);
        }
        return p;
    }
      public Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
        Connection connection;
        Properties properties = readPropertiesFile();
        String username = properties.getProperty("username");
        String password = properties.getProperty("password");
        String databaseName = properties.getProperty("databaseName");
        String url = properties.getProperty("url") + databaseName;
        Class.forName(properties.getProperty("driver"));
        connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
}
