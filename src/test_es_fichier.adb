with ES_Fichier, Ada.Text_IO;
use ES_Fichier, Ada.Text_IO;

procedure test_es_fichier is
    Fichier : File_Type;
    Banane : File_Type;
begin
    Create (Banane, Append_File, "Banane/");
    CreerFichier (fic => Fichier, chemin => "Banane/Fichier.txt");
end test_es_fichier;