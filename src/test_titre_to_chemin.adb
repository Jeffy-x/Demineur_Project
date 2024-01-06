with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Cette procedure teste la procedure titre_to_chemin
--  ainsi que la procedure chemin_to_titre
--  Ce test est CONCLUANT
procedure test_titre_to_chemin is
    titre : T_Chaine;
    chemin : T_Chaine;
begin
    Put_Line ("Entrez un titre : ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    New_Line;
    Put_Line ("Le chemin pour y acceder est : ");
    chemin := titre_to_chemin (titre);
    Put (chemin);
    titre := chemin_to_titre (chemin);
    New_Line;
    Put_Line ("Le titre est :");
    Put (titre);
end test_titre_to_chemin;