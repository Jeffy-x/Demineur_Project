with Pack_Demineur;
use Pack_Demineur;

procedure test_mettre_solution is
    nb_lignes : constant T_Nb_Ligne := 15;
    nb_colonnes : constant T_Nb_Colonne := 20;
begin
    declare
        grille : T_Grille (1 .. (nb_lignes + 2), 1 .. (nb_colonnes + 2));
        grille_solution : T_Grille (1 .. (nb_lignes + 2),
        1 .. (nb_colonnes + 2));
    begin
        initialisation_grille (grille, nb_lignes, nb_colonnes);
        initialisation_bombe (grille_solution,
        nb_lignes, nb_colonnes, 20);

        afficher_grille
          (grille      => grille,
           nb_lignes   => nb_lignes,
           nb_colonnes => nb_colonnes);

        afficher_grille
          (grille      => grille_solution,
           nb_lignes   => nb_lignes,
           nb_colonnes => nb_colonnes);

        mettre_solution
          (grille          => grille,
           grille_solution => grille_solution,
           nb_lignes       => nb_lignes,
           nb_colonnes     => nb_colonnes);

        afficher_grille
          (grille      => grille,
           nb_lignes   => nb_lignes,
           nb_colonnes => nb_colonnes);

    end;
end test_mettre_solution;