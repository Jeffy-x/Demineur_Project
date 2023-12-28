with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_chaine is
    chaine : T_Chaine;
    chaine_string : String (1 .. Natural (T_Indice_Chaine'Last));
    chaine_longueur : Natural;
begin
    chaine.lettres (1 .. T_Indice_Chaine'Last) := "                    ";
    for J in 1 .. T_Indice_Chaine'Last loop
        Put (chaine.lettres (J));
    end loop;
    New_Line;
    Put_Line ("La longueur de la chaine est "
    & T_Indice_Chaine'Image  (chaine.longueur_chaine));

    New_Line;
    Put_Line ("Entrez une chaine de caracteres : ");
    Get_Line (chaine_string, chaine_longueur);
    chaine.longueur_chaine := T_Indice_Chaine (chaine_longueur);

    New_Line;
    Put_Line ("La longueur de la chaine est "
    & T_Indice_Chaine'Image (chaine.longueur_chaine));
    New_Line;

    chaine.lettres (1 .. chaine.longueur_chaine) := T_Lettres
    (chaine_string) (1 .. chaine.longueur_chaine);

    Put_Line ("la chaine est : ");
    for J in 1 .. chaine.longueur_chaine loop
        Put (chaine.lettres (J));
    end loop;

end test_chaine;