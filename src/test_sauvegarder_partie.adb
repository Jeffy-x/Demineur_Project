with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure a pour but de tester la procedure
--  sauvegarder_partie.
--  Ce test est CONCLUANT
procedure test_sauvegarder_partie is
    nb_lignes : constant T_Nb_Ligne := 15;
    nb_colonnes : constant T_Nb_Colonne := 20;

    grille : T_Grille (1 .. (nb_lignes + 2), 1 .. (nb_colonnes + 2));
    grille_solution : T_Grille (1 .. (nb_lignes + 2),
    1 .. (nb_colonnes + 2));

    titre : T_Chaine;
    chemin : T_Chaine;
    parties_sauvegardees : T_Parties_Sauvegardees;
    etat_partie : T_Etat_Partie := en_cours;
begin
    initialisation_grille (grille, nb_lignes, nb_colonnes);
    initialisation_bombe (grille_solution, nb_lignes,
    nb_colonnes, 15);
    poser_drapeau (grille, 5, 5);
    ouvrir_case
      (grille          => grille,
       grille_solution => grille_solution,
       ligne           => 8,
       colonne         => 8,
       etat_partie     => etat_partie);
    Put_Line ("Donnez le nom de la sauvegarde : ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    chemin := titre_to_chemin (titre => titre);
    sauvegarder_partie
      (grille              => grille,
       grille_solution     => grille_solution,
       nb_lignes           => nb_lignes,
       nb_colonnes         => nb_colonnes,
       chemin               => chemin,
       parties_sauvegardees => parties_sauvegardees);
    New_Line;
    afficher_grille
      (grille      => grille,
       nb_lignes   => nb_lignes,
       nb_colonnes => nb_colonnes);
    New_Line;
    afficher_grille
      (grille      => grille_solution,
       nb_lignes   => nb_lignes,
       nb_colonnes => nb_colonnes);
end test_sauvegarder_partie;