with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_enregistrer_sauvegardes is
    parties_sauvegardees : T_Parties_Sauvegardees;
    titre : T_Chaine;
begin
    for J in 1 .. 3 loop
        Put_Line ("Entrez un titre à sauvegarder : ");
        Get_Line (titre.lettres, titre.longueur_chaine);
        ajouter_sauvegarde (titre, parties_sauvegardees);
    end loop;
    enregistrer_sauvegardes (parties_sauvegardees);
end test_enregistrer_sauvegardes;