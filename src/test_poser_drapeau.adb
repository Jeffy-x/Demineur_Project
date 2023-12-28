with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_poser_drapeau is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    grille : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
    subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes;
    subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes;
    ligne : T_Ligne;
    colonne : T_Colonne;
    package T_Ligne_IO is new
    Ada.Text_IO.Integer_IO (T_Ligne);
    use T_Ligne_IO;
    package T_Colonne_IO is new
    Ada.Text_IO.Integer_IO (T_Colonne);
    use T_Colonne_IO;
begin
    grille := (others => (others => cache));
    grille (2, 3) := '8';
    grille (4, 5) := vide;
    grille (2, 2) := drapeau;
    afficher_grille (grille, nb_lignes + 2, nb_colonnes + 2);
    Put_Line ("Ou souhaitez vous poser un drapeau ? ");
    Get (ligne);
    Get (colonne);
    poser_drapeau (grille, ligne, colonne);
    afficher_grille (grille, nb_lignes + 2, nb_colonnes + 2);
end test_poser_drapeau;