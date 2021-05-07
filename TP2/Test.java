import java.util.List;

public class Test {
    public static void main(String[] args) {
        DataAccess d = new DataAccess(args[0], args[1], args[2]);
        List<CoursDAO> l = d.getCours();
        for (CoursDAO coursDAO : l) {
            coursDAO.updateNbHeures(coursDAO.getNom(), coursDAO.getNbheures()+2);
            d.updateCours(coursDAO);
        }
        d.close();
    }
}
