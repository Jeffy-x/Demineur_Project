with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_initialisation_grille is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    grille : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
begin
    Put_Line ("Voici la grille une fois initialisee : ");
    New_Line;
    initialisation_grille (grille, nb_lignes, nb_colonnes);
    afficher_grille (grille, nb_lignes, nb_colonnes);
end test_initialisation_grille;