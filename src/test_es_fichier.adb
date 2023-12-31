with Ada.Text_IO, Ada.Directories, ES_Fichier;
use Ada.Text_IO, Ada.Directories, ES_Fichier;

procedure test_es_fichier is
    fic : File_Type;
begin
    if not Exisence ("salut/") then
        CreerDossier ("salut/");
    end if;
    CreerFichier (fic, "didier.txt");
    FermerFichier (fic);
    Put (Current_Directory);

    DesignerDossierPrincipal ("salut/");
    CreerFichier (fic, "les_copains.txt");
    FermerFichier (fic);
    New_Line;
    Put (Current_Directory);
    if Exisence ("les_copains.txt") then
        New_Line;
        Put ("LKsdjM");
    end if;
end test_es_fichier;