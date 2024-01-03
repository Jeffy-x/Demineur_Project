with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure demineur_v1.00 is
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    package T_Nb_Ligne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Ligne);
    use T_Nb_Ligne_IO;
    package T_Nb_Colonne_IO is new Ada.Text_IO.Integer_IO (T_Nb_Colonne);
    use T_Nb_Colonne_IO;
    action : T_Action_Joueur;
    choix_chargement_grille : T_Choix_Chargement_Grille;
    package T_Action_Joueur_IO is new
    Ada.Text_IO.Enumeration_IO (T_Action_Joueur);
    use T_Action_Joueur_IO;
    package T_Choix_Chargement_Grille_IO is new
    Ada.Text_IO.Enumeration_IO (T_Choix_Chargement_Grille);
    use T_Choix_Chargement_Grille_IO;
    nb_bombes : T_Nb_Bombe;
    package T_Nb_Bombe_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Bombe);
    use T_Nb_Bombe_IO;
    etat_partie : T_Etat_Partie := en_cours;
    parties_sauvegardees : T_Parties_Sauvegardees;
    titre : T_Chaine;
    Fichier : File_Type;
    val_ent : Integer;
begin
    initialisation_environnement;
    charger_liste_sauvegardes (parties_sauvegardees);
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
    Put_Line ("Bienvenue dans le jeu de demineur, que voulez-vous faire ?");
    Put_Line ("c => continuer la partie en cours");
    Put_Line ("n => commencer une nouvelle partie");
    Put_Line ("s => charger une sauvegarde");
    Put_Line ("q => quitter");
    Get (choix_chargement_grille);
    case choix_chargement_grille is
        when n =>
            New_Line (2);
            Put_Line ("Veillez donner un nombre de lignes, de colonnes et de bombes");
            Get (nb_lignes);
            Get (nb_colonnes);
            Get (nb_bombes);
            --  initialisation_grille (grille);
            --  initialisation_bombe (grille_solution);
        when s =>
            New_Line (2);
            afficher_sauvegardes (parties_sauvegardees);
            New_Line;
            Put_Line ("Quelle sauvegarde voulez vous utiliser ? ");
            Get_Line (titre.lettres, titre.longueur_chaine);
            charger_lg_grille (nb_lignes, nb_colonnes, titre);
        when c =>
            if Existence (".repertoire/sauvegarde_rapide.txt") then
                OuvrirFichierLect (Fichier, ".repertoire/sauvegarde_rapide.txt");
                Lecture (Fichier, val_ent);
                nb_lignes := T_Nb_Ligne (val_ent);
                Lecture (Fichier, val_ent);
                nb_colonnes := T_Nb_Colonne (val_ent);
                FermerFichier (Fichier);
            else
                Put_Line ("Vous n'avez pas partie en cours !");
            end if;
        when others =>
            Put_Line ("La commande n'est pas encore définie");
    end case;
    declare
        grille : T_Grille (1 .. (nb_lignes + 2), 1 .. (nb_colonnes + 2));
        grille_solution : T_Grille (1 .. (nb_lignes + 2),
        1 .. (nb_colonnes + 2));
        subtype T_Ligne is T_Nb_Ligne range 1 .. nb_lignes;
        subtype T_Colonne is T_Nb_Colonne range 1 .. nb_colonnes;
        ligne : T_Ligne;
        colonne : T_Colonne;
    begin
        case choix_chargement_grille is
            when s or c =>
                
            when others =>
                
        end case;
    end;

end demineur_v1.00;