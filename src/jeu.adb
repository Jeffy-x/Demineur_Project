with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure jeu is
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    package T_Nb_Ligne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Ligne);
    use T_Nb_Ligne_IO;
    package T_Nb_Colonne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Colonne);
    use T_Nb_Colonne_IO;
    action : T_Action_Joueur;
    package T_Action_Joueur_IO is new
    Ada.Text_IO.Enumeration_IO (T_Action_Joueur);
    use T_Action_Joueur_IO;
    nb_bombes : T_Nb_Bombe;
    package T_Nb_Bombe_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Bombe);
    use T_Nb_Bombe_IO;
    etat_partie : T_Etat_Partie := en_cours;

begin
    New_Line (100);
    Put_Line (" ____                         "
    & "                                  ");
    Put_Line ("/\  _`\                      _"
    & "_                                 ");
    Put_Line ("\ \ \/\ \     __    ___ ___ /\"
    & "_\    ___      __   __  __  _ __  ");
    Put_Line (" \ \ \ \ \  /'__`\/' __` __`\/"
    & "\ \ /' _ `\  /'__`\/\ \/\ \/\`'__\");
    Put_Line ("  \ \ \_\ \/\  __//\ \/\ \/\ \"
    & " \ \/\ \/\ \/\  __/\ \ \_\ \ \ \/ ");
    Put_Line ("   \ \____/\ \____\ \_\ \_\ \_"
    & "\ \_\ \_\ \_\ \____\\ \____/\ \_\ ");
    Put_Line ("    \/___/  \/____/\/_/\/_/\/_"
    & "/\/_/\/_/\/_/\/____/ \/___/  \/_/ ");
    New_Line (2);
    Put_Line ("Veillez donner un nombre de lignes, de colonnes et de bombes");
    Get (nb_lignes);
    Get (nb_colonnes);
    Get (nb_bombes);
    declare
        grille : T_Grille (1 .. (nb_lignes + 2), 1 .. (nb_colonnes + 2));
        grille_solution : T_Grille (1 .. (nb_lignes + 2),
        1 .. (nb_colonnes + 2));
        subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes;
        subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes;
        ligne : T_Ligne;
        colonne : T_Colonne;
    begin
        initialisation_grille (grille, nb_lignes, nb_colonnes);
        initialisation_bombe (grille_solution, nb_lignes,
        nb_colonnes, nb_bombes);
        loop
            New_Line (100);
            afficher_grille (grille, nb_lignes, nb_colonnes);
            New_Line;
            Put_Line ("Quelle action voulez-vous effectuer ?");
            Put_Line ("poser/retirer un drapeau => p");
            Put_Line ("ouvrir une case => o");
            Put_Line ("quitter => q");
            New_Line;
            Get (action);
            New_Line;
            case action is
                when q =>
                    Put_Line ("Fermeture du jeu ...");
                    Put_Line ("Nous vous remercions de votre visite"
                    & " et a bientot...");
                    exit;
                when p =>
                    Put_Line ("Donnez les coordonnees du drapeau a poser ou"
                    & " a retirer ");
                    Get (ligne);
                    Get (colonne);
                    poser_drapeau (grille, ligne, colonne);
                when o =>
                    Put_Line ("Donnez les coordonnees de la case a ouvrir");
                    Get (ligne);
                    Get (colonne);
                    ouvrir_case (grille, grille_solution,
                    ligne, colonne, etat_partie);
                    if etat_partie = perdu then
                        exit;
                    elsif compter_case_a_ouvrir (grille,
                    grille_solution, nb_lignes, nb_colonnes) = 0
                    then
                        etat_partie := gagne;
                        exit;
                    end if;
                    when others =>
                        null;
            end case;
        end loop;
        New_Line (100);
        afficher_grille (grille, nb_lignes, nb_colonnes);
        New_Line;
        case etat_partie is
            when perdu =>
                Put_Line ("Vous etes une vraie quiche, vous etes decedes...");
            when gagne =>
                Put_Line ("Felicitations ! Vous avez survecu...");
            when en_cours =>
                Put_Line ("A bientot !");
        end case;
    end;
end jeu;