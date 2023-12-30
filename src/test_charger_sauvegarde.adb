with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_charger_sauvegarde is
    grille : T_Grille;
    grille_solution : T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    titre : T_Chaine;
begin
    Put_Line ("Choisissez la sauvegarde que vous voulez charger : ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    charger_lg_grille (nb_lignes, nb_colonnes, titre);
    declare
        grille : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
        grille_solution : T_Grille
        (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
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
    end;
end test_charger_sauvegarde;