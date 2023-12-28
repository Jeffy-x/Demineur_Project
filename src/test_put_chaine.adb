with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure teste la procedure Put avec
--  un type T_chaine
--  Ce test est CONCLUANT
procedure test_put_chaine is
    chaine : T_Chaine;
begin
    chaine.longueur_chaine := 19;
    chaine.lettres (1 .. chaine.longueur_chaine)
    := "Salut les saucisses";
    Put_Line ("La chaine est : ");
    Put (chaine => chaine);
end test_put_chaine;