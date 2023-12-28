with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_compter_case_a_ouvrir is
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    package T_Nb_Ligne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Ligne);
    use T_Nb_Ligne_IO;
    package T_Nb_Colonne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Colonne);
    use T_Nb_Colonne_IO;
    nb_bombes : T_Nb_Bombe;
    package T_Nb_Bombe_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Bombe);
    use T_Nb_Bombe_IO;
begin
    Put_Line ("Veillez donner un nombre de lignes, de colonnes et de bombes");
    Get (nb_lignes);
    Get (nb_colonnes);
    Get (nb_bombes);
    declare
        grille : T_Grille (1 .. (nb_lignes + 2), 1 .. (nb_colonnes + 2));
        grille_solution : T_Grille (1 .. (nb_lignes + 2),
        1 .. (nb_colonnes + 2));
    begin
        initialisation_grille (grille, nb_lignes, nb_colonnes);
        initialisation_bombe (grille_solution, nb_lignes,
        nb_colonnes, nb_bombes);
        afficher_grille (grille, nb_lignes, nb_colonnes);
        afficher_grille (grille_solution, nb_lignes, nb_colonnes);
        New_Line;
        Put (T_Nb_Case_A_Ouvrir'Image (compter_case_a_ouvrir (grille,
        grille_solution, nb_lignes, nb_colonnes)));
    end;
end test_compter_case_a_ouvrir;