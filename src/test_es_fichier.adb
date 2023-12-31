with Ada.Text_IO, Ada.Directories, ES_Fichier;
use Ada.Text_IO, Ada.Directories, ES_Fichier;

procedure test_es_fichier is
    fic : File_Type;
begin
    if not Exists ("salut/") then
        Create_Directory ("salut/");
    end if;
    CreerFichier (fic, "didier.txt");
    Close (fic);
    Put (Current_Directory);

    Set_Directory ("salut/");
    CreerFichier (fic, "les_copains.txt");
    Close (fic);
    New_Line;
    Put (Current_Directory);
    if Exists ("les_copains.txt") then
        Put ("LKsdjM");
    end if;
end test_es_fichier;