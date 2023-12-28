with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_compter_bombe is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    nb_bombes_a_poser : constant T_Nb_Bombe := 15;
    grille_solution : T_Grille (1 .. nb_lignes + 2, 1 .. nb_colonnes + 2);
    subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes;
    subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes;
    ligne : T_Ligne;
    colonne : T_Colonne;
    package T_Ligne_IO is new
    Ada.Text_IO.Integer_IO (T_Ligne);
    use T_Ligne_IO;
    package T_Colonne_IO is new
    Ada.Text_IO.Integer_IO (T_Colonne);
    use T_Colonne_IO;
    package T_Nb_Bombe_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Bombe);
    use T_Nb_Bombe_IO;
begin
    grille_solution := (others => (others => vide));
    initialisation_bombe (grille_solution, nb_lignes,
    nb_colonnes, nb_bombes_a_poser);
    afficher_grille (grille_solution, nb_lignes + 2, nb_colonnes + 2);
    Put_Line ("Donner une position dans la grille (grille reelle) : ");
    Get (ligne);
    Get (colonne);
    Put_Line ("Le nombre de bombes est : "
    & T_Nb_Bombe'Image (compter_bombe (grille_solution,
    ligne, colonne)));

end test_compter_bombe;