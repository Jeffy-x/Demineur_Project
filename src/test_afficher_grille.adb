with Pack_Demineur;
use Pack_Demineur;

--  Ce programme a pour but de tester le sous-programme
--  afficher_grille (nb_lignes, nb_colonnes, grille)
--  Ce test est CONCLUANT.
procedure test_afficher_grille is
    nb_lignes :  constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    grille : T_Grille (1 .. nb_lignes, 1 .. nb_colonnes);
begin
    grille := (others => (others => vide));
    afficher_grille (grille, nb_lignes, nb_colonnes);
end test_afficher_grille;