with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure teste la procedure Get_Line appliquee
--  au type T_Lettres et T_Indice_Chaine
--  Ce test est CONCLUANT.
procedure test_get_line_t_chaine is
    chaine : T_Chaine;
begin
    Put_Line ("Veillez entrer une chaine : ");
    Get_Line (chaine.lettres, chaine.longueur_chaine);
    New_Line;
    Put_Line ("La chaine que vous avez entre est : ");
    Put (chaine => chaine);
end test_get_line_t_chaine;