public class CoursDAO {
    private int num_cours;
    private String nom;
    private int nbheures;
    private int annee;

    public CoursDAO(int num_cours, String nom, int nbheures, int annee) {
        this.num_cours = num_cours;
        this.nom = nom;
        this.nbheures = nbheures;
        this.annee = annee;
    }

    public int getNum_cours() {
        return this.num_cours;
    }

    public void setNum_cours(int num_cours) {
        this.num_cours = num_cours;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getNbheures() {
        return this.nbheures;
    }

    public void setNbheures(int nbheures) {
        this.nbheures = nbheures;
    }

    public int getAnnee() {
        return this.annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public boolean updateNbHeures(String nomCours, int nbHeures){
        this.nom = nomCours;
        this.nbheures = nbHeures;
        return true;
    }
}
