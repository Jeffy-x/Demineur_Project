with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure vise a tester la procedure afficher_sauvegardes
--  Ce test est CONCLUANT
procedure test_afficher_sauvegardes is
    titres_sauvegardes : T_Parties_Sauvegardees;
    titre : T_Chaine;
begin
    for k in 1 .. 3 loop
        New_Line;
        Put_Line ("Veillez entrer un titre a sauvegarder : ");
        Get_Line (titre.lettres, titre.longueur_chaine);
        ajouter_sauvegarde (titre, titres_sauvegardes);
    end loop;
    New_Line;
    afficher_sauvegardes (parties_sauvegardees => titres_sauvegardes);
end test_afficher_sauvegardes;