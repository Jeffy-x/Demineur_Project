with Ada.Text_IO, ES_Fichier, Pack_Demineur;
use Ada.Text_IO, ES_Fichier, Pack_Demineur;

procedure test_ReinitialisationFichier is
    fic : File_Type;
    chaine : T_Chaine
begin
    if not Existence ("Test_Divers/") then
        CreerDossier ("Test_Divers/");
    end if;
    if not Existence ("Test_Divers/Test_ReinitialisationFichier.txt") then
        CreerFichier (fic, "Test_Divers/Test_ReinitialisationFichier.txt");
        FermerFichier (fic);
    end if;
    OuvrirFichier (fic, "Test_Divers/Test_ReinitialisationFichier.txt");
    for J in 1 .. 3 loop
        Get_Line (chaine.lettres, chaine.longueur_chaine);
        AjouterAuFichier
        (fic, String (chaine.lettres (1 .. chaine.longueur_chaine)));
    end loop;
    ReinitialisationFichier (fic => fic);
    FermerFichier (fic);
end test_ReinitialisationFichier;