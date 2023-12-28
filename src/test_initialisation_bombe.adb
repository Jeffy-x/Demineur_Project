with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_initialisation_bombe is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    nb_bombes : constant T_Nb_Bombe := 35;
    grille_solution : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
begin
    Put_Line ("Tableau rempli de bombes :");
    initialisation_bombe (grille_solution, nb_lignes, nb_colonnes, nb_bombes);
    afficher_grille (grille_solution, nb_lignes + 2, nb_colonnes + 2);

end test_initialisation_bombe;