with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

--  Ce fichier teste l'action d'un joueur grâce au type
--  T_Action_Joueur
--  Ce test est CONCLUANT.
procedure test_action_joueur is
    nb_lignes : constant T_Nb_Ligne := 5;
    nb_colonnes : constant T_Nb_Colonne := 8;
    subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes;
    subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes;
    ligne : T_Ligne;
    colonne : T_Colonne;
    grille : T_Grille (1 .. nb_lignes, 1 .. nb_colonnes)
    := (others => (others => vide));
    action : T_Action_Joueur;
    package T_Element_Case_IO is new
    Ada.Text_IO.Enumeration_IO (T_Element_Case);
    use T_Element_Case_IO;
    package T_Action_Joueur_IO is new
    Ada.Text_IO.Enumeration_IO (T_Action_Joueur);
    use T_Action_Joueur_IO;
    package T_Ligne_IO is new
    Ada.Text_IO.Integer_IO (T_Ligne);
    use T_Ligne_IO;
    package T_Colonne_IO is new
    Ada.Text_IO.Integer_IO (T_Colonne);
    use T_Colonne_IO;
begin
    loop

        --  On affiche la grille
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                Put (T_Element_Case'Image (grille (I, J)) & " ");
            end loop;
            New_Line;
        end loop;
        Put ("Quelle action voulez-vous effectuer ? poser_drapeau"
        & " ou quitter");
        New_Line;
        Get (action);
        case action is
            when q =>
                Put_Line ("Fermeture du jeu...");
                exit;
            when p =>
                Put_Line ("Ou voulez-vous poser un drapeau ? ");
                Get (ligne);
                Get (colonne);
                grille (ligne, colonne) := drapeau;
            when others =>
                null;
        end case;

    end loop;
end test_action_joueur;