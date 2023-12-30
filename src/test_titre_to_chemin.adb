with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_titre_to_chemin is
    titre : T_Chaine;
begin
    Put_Line ("Entrez un titre : ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    New_Line;
    Put_Line ("Le chemin pour y acceder est : ");
    Put (titre_to_chemin (titre));
end test_titre_to_chemin;