with Pack_Demineur, Ada.Text_IO;
use Pack_Demineur, Ada.Text_IO;

procedure test_supprimer_elem_liste_sauvegarde is
    parties_sauvegardees : T_Parties_Sauvegardees;
    titre : T_Chaine;
begin
    Put_Line ("Veillez entrer 5 titres");
    for J in 1 .. 5 loop
        Get_Line (titre.lettres, titre.longueur_chaine);
        ajouter_sauvegarde (titre, parties_sauvegardees);
    end loop;
    New_Line;
    afficher_sauvegardes (parties_sauvegardees => parties_sauvegardees);
    New_Line;
    Put_Line ("Donnez un titre a supprimer ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    supprimer_elem_liste_sauvegarde (parties_sauvegardees, titre);
    New_Line;
    Put_Line ("Les titres sauvegardes sont maintenant :");
    New_Line;
    afficher_sauvegardes (parties_sauvegardees => parties_sauvegardees);
end test_supprimer_elem_liste_sauvegarde;