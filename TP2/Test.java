import java.util.List;

public class Test {
    public static void main(String[] args) {
        DataAccess d = new DataAccess(args[0], args[1], args[2]);
        List<CoursDAO> l = d.getCours();
        d.close();
    }
}
