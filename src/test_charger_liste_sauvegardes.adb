with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_charger_liste_sauvegardes is
    parties_sauvegardees : T_Parties_Sauvegardees;
begin
    charger_liste_sauvegardes (parties_sauvegardees);
    Put_Line ("Les parties sauvegardées sont : ");
    New_Line;
    afficher_sauvegardes (parties_sauvegardees);
end test_charger_liste_sauvegardes;