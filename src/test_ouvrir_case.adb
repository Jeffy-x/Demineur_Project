with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_ouvrir_case is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    grille : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
    nb_bombes : constant T_Nb_Bombe := 5;
    grille_solution : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
    subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes + 2;
    subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes + 2;
    ligne : T_Ligne;
    colonne : T_Colonne;
    package T_Ligne_IO is new
    Ada.Text_IO.Integer_IO (T_Ligne);
    use T_Ligne_IO;
    package T_Colonne_IO is new
    Ada.Text_IO.Integer_IO (T_Colonne);
    use T_Colonne_IO;
begin
    initialisation_grille (grille, nb_lignes, nb_colonnes);
    initialisation_bombe (grille_solution, nb_lignes, nb_colonnes, nb_bombes);
    New_Line (2);
    afficher_grille (grille_solution, nb_lignes + 2, nb_colonnes + 2);
    New_Line (2);
    afficher_grille (grille, nb_lignes + 2, nb_colonnes + 2);
    New_Line;
    Put_Line ("Quelle case souhaitez-vous ouvrir ? ");
    Get (ligne);
    Get (colonne);
    ouvrir_case (grille, grille_solution, ligne, colonne);
    afficher_grille (grille, nb_lignes + 2, nb_colonnes + 2);
end test_ouvrir_case;