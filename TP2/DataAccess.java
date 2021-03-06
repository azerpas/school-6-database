import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.lang.Class;

/**
 * DataAccess
 */
public class DataAccess {
    private Connection connection;

    public DataAccess(String url, String user, String password){
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            this.connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            System.out.println("Canno't connect to the database");
            e.printStackTrace();
            System.exit(1);
        }
    }

    public void close(){
        try {
            this.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    public List<CoursDAO> getCours(){
        List<CoursDAO> list = new ArrayList<CoursDAO>();
        try {
            Statement st = this.connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM COURS");
            while (rs.next()) {
                System.out.print("ID: " + rs.getInt("NUM_COURS"));
                System.out.print(", Heures: " + rs.getInt("NBHEURES"));
                System.out.print(", Annee: " + rs.getInt("ANNEE"));
                System.out.println(", Nom: " + rs.getString("NOM"));
                CoursDAO c = new CoursDAO(rs.getInt("NUM_COURS"), rs.getString("NOM"), rs.getInt("NBHEURES"), rs.getInt("ANNEE"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CoursDAO> getCoursPS(){
        List<CoursDAO> list = new ArrayList<CoursDAO>();
        try {
            PreparedStatement st = this.connection.prepareStatement("SELECT * FROM COURS");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                System.out.print("ID: " + rs.getInt("NUM_COURS"));
                System.out.print(", Heures: " + rs.getInt("NBHEURES"));
                System.out.print(", Annee: " + rs.getInt("ANNEE"));
                System.out.println(", Nom: " + rs.getString("NOM"));
                CoursDAO c = new CoursDAO(rs.getInt("NUM_COURS"), rs.getString("NOM"), rs.getInt("NBHEURES"), rs.getInt("ANNEE"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateCours(CoursDAO cDao){
        try {
            Statement st = this.connection.createStatement();
            st.executeUpdate("UPDATE COURS SET NOM = '"+cDao.getNom()+"', NBHEURES = "+cDao.getNbheures()+" WHERE NUM_COURS = "+cDao.getNum_cours()+";");
            System.out.println("Updated database for id "+cDao.getNum_cours());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNbHeuresPS(CoursDAO cDao){
        try {
            PreparedStatement st = this.connection.prepareStatement("UPDATE COURS SET NOM = ?, NBHEURES = ? WHERE NUM_COURS = ?;");
            st.setString(1, cDao.getNom());
            st.setInt(2, cDao.getNbheures());
            st.setInt(3, cDao.getNum_cours());
            st.executeUpdate();
            System.out.println("Updated database for id "+cDao.getNum_cours());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}