with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_charger_sauvegarde is
    grille : T_Grille;
    grille_solution : T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    titre : T_Chaine;
begin
    charger_sauvegarde
      (grille          => grille,
       grille_solution => grille_solution,
       nb_lignes       => nb_lignes,
       nb_colonnes     => nb_colonnes,
       titre           => titre);
    afficher_grille (grille, nb_lignes, nb_colonnes);
    New_Line;
    afficher_grille (grille_solution, nb_lignes, nb_colonnes);
end test_charger_sauvegarde;