with Pack_Demineur, Ada.Text_IO;
use Pack_Demineur, Ada.Text_IO;

procedure test_chaine_to_string is
    chaine : T_Chaine;
begin
    Put_Line ("Veillez entrer une chaine"
    & " de caractere (qui sera de type T_Chaine)");
    Get_Line (chaine.lettres, chaine.longueur_chaine);
    New_Line;
    Put_Line ("La chaine que vous avez entre est : "
    & Chaine_to_String (chaine));
end test_chaine_to_string;