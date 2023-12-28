with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Ce fichier teste le type T_Grille, tableau non contraint.
--  Le but est de tester comment contraindre un tableau.
--  Le test est CONCLUANT.
procedure test_grille is
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    package T_Nb_Ligne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Ligne);
    use T_Nb_Ligne_IO;
    package T_Nb_Colonne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Colonne);
    use T_Nb_Colonne_IO;
    package T_Element_Case_IO is new
    Ada.Text_IO.Enumeration_IO (T_Element_Case);
    use T_Element_Case_IO;

begin
    Put ("Entrer le nombre de lignes du tableau (entre 1 et 32): ");
    Get (nb_lignes);
    Put ("Entrer le nombre de colonnes du tableau (entre 1 et 32): ");
    Get (nb_colonnes);
    definition_grille : declare
        grille : T_Grille (1 .. nb_lignes, 1 .. nb_colonnes);
    begin
        grille := (others => (others => vide));
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                Put (T_Element_Case'Image (grille (I, J)) & " ");
            end loop;
            New_Line;
        end loop;
    end definition_grille;
end test_grille;