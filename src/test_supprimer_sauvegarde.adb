with Pack_Demineur, ES_Fichier;
use Pack_Demineur, ES_Fichier;

procedure test_supprimer_sauvegarde is
    titre : T_Chaine;
    parties_sauvegardees : T_Parties_Sauvegardees;
    fic : File_Type;
begin
    Put_Line ("Veillez entrer trois cinq titres :");
    for J in 1 .. 5 loop
        Get_Line (titre);
        ajouter_sauvegarde (titre, parties_sauvegardees);
        CreerFichier (fic, titre_to_chemin (titre));
    end loop;
    afficher_sauvegardes (parties_sauvegardees);
    Put_Line ("Donnez un titre a supprimer");
end test_supprimer_sauvegarde;