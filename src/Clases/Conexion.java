package Clases;


import java.sql.*;
import javax.swing.JOptionPane;
public class Conexion {
public static Connection con,con1;
public static Statement state,state1;
public static ResultSet result,result1;

public Conexion(String user,String pass)throws SQLException,ClassNotFoundException
{
    
//    String url = "";
//    
// Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//
//   con=DriverManager.getConnection("jdbc:odbc:Driver={SQL Server};Server=DEVELOPERCOMPAQ"  // <==DEVELOPERCOMPAQ
//       + ";Database=Seguridad_Bancaria;Uid="+user+"; Pwd="+pass); //Conexion Directa
    // con=DriverManager.getConnection(url,user,pass); // Conexion OBDC
    
     DriverManager.registerDriver( new com.microsoft.sqlserver.jdbc.SQLServerDriver() );
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;" // Server=ASUS-DEVELOPER;"
                    + "databaseName=Seguridad_Bancaria", user, pass);
    
    state=con.createStatement(result.TYPE_SCROLL_SENSITIVE,result.CONCUR_UPDATABLE);
    JOptionPane.showMessageDialog(null,"Conexión Establecida");

}//fin del constructor
 public static ResultSet consulta(String sql)throws SQLException{

        state1 = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,result1.CONCUR_READ_ONLY);
        result1 = state1.executeQuery(sql);//aqui hago consultas y devuelvo los resultados
        return result1;
}
}

