with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure vise a tester la procedure
--  ajouter_sauvegarde
--  Ce test est CONCLUANT
procedure test_ajouter_sauvegarde is
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
    Put_Line ("Les titres que vous avez entre sont :");
    for J in 1 .. T_Indice_Liste_Sauvegarde (3) loop
        Put (titres_sauvegardes.titres (J));
        Put (" ");
    end loop;

end test_ajouter_sauvegarde;