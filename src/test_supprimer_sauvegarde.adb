with Pack_Demineur, ES_Fichier, Ada.Text_IO;
use Pack_Demineur, ES_Fichier, Ada.Text_IO;

procedure test_supprimer_sauvegarde is
    titre : T_Chaine;
    parties_sauvegardees : T_Parties_Sauvegardees;
    fic : File_Type;
begin
    Put_Line ("Veillez entrer trois cinq titres :");
    for J in 1 .. 5 loop
        Get_Line (titre.lettres, titre.longueur_chaine);
        ajouter_sauvegarde (titre, parties_sauvegardees);
        CreerFichier (fic, Chaine_to_String (titre_to_chemin (titre)));
        FermerFichier (fic);
    end loop;
    afficher_sauvegardes (parties_sauvegardees);
    New_Line;
    Put_Line ("Donnez un titre a supprimer");
    Get_Line (titre.lettres, titre.longueur_chaine);
    supprimer_sauvegarde (titre, parties_sauvegardees);
end test_supprimer_sauvegarde;