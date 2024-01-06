with Ada.Text_IO, Pack_Demineur, ES_Fichier;
use Ada.Text_IO, Pack_Demineur, ES_Fichier;

procedure demineur_v1_00 is
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
    chemin : T_Chaine;
    package T_Nb_Case_A_Ouvrir_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Case_A_Ouvrir);
    use T_Nb_Case_A_Ouvrir_IO;
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
    if choix_chargement_grille = n then
        New_Line (2);
        Put_Line ("Veillez donner un nombre de "
        & "lignes, de colonnes et de bombes");
        Get (nb_lignes);
        Get (nb_colonnes);
        Get (nb_bombes);
    elsif choix_chargement_grille = s then
        New_Line (2);
        afficher_sauvegardes (parties_sauvegardees);
        New_Line;
        Put_Line ("Quelle sauvegarde voulez vous utiliser ? ");
        --  Etrangement, si je ne mets qu'un procedure Get_Line
        --  le programme n'en tient pas compte
        Get_Line (titre.lettres, titre.longueur_chaine);
        Get_Line (titre.lettres, titre.longueur_chaine);
        New_Line;
        Put (titre);
        chemin := titre_to_chemin (titre);
        New_Line;
        Put (chemin);
        charger_lg_grille (nb_lignes, nb_colonnes,
        chemin);
    elsif choix_chargement_grille = c then
        if Existence (".repertoire/sauvegarde_rapide.txt") then
            chemin.longueur_chaine := 33;
            chemin.lettres (1 .. chemin.longueur_chaine) :=
            ".repertoire/sauvegarde_rapide.txt";
            charger_lg_grille (nb_lignes,
            nb_colonnes, chemin);
        else
            Put_Line ("Vous n'avez pas partie en cours !");
        end if;
    else
        Put_Line ("La commande n'est pas encore définie");
    end if;
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
            when c =>
                chemin.longueur_chaine := 33;
                chemin.lettres (1 .. chemin.longueur_chaine) :=
                ".repertoire/sauvegarde_rapide.txt";
                charger_sauvegarde (grille, grille_solution,
                nb_lignes, nb_colonnes, chemin);
            when s =>
                charger_sauvegarde (grille, grille_solution,
                nb_lignes, nb_colonnes, titre_to_chemin (titre));

            when n =>
                initialisation_grille (grille, nb_lignes, nb_colonnes);
                initialisation_bombe (grille_solution,
                nb_lignes, nb_colonnes, nb_bombes);
            when others =>
                null;
        end case;
        --  Partie similaire au programme jeu
        loop
            New_Line (100);
            afficher_grille (grille, nb_lignes, nb_colonnes);
            New_Line;
            Put_Line ("Quelle action voulez-vous effectuer ?");
            Put_Line ("poser/retirer un drapeau => p");
            Put_Line ("ouvrir une case => o");
            Put_Line ("sauvegarder => s");
            Put_Line ("quitter => q");
            New_Line;
            Get (action);
            New_Line;
            case action is
                when q =>
                    chemin.longueur_chaine := 33;
                    chemin.lettres (1 .. chemin.longueur_chaine) :=
                    ".repertoire/sauvegarde_rapide.txt";
                    sauvegarder_partie
                      (grille               => grille,
                       grille_solution      => grille_solution,
                       nb_lignes            => nb_lignes,
                       nb_colonnes          => nb_colonnes,
                       chemin               => chemin,
                       parties_sauvegardees => parties_sauvegardees);
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
                        Put (compter_case_a_ouvrir (grille,
                    grille_solution, nb_lignes, nb_colonnes));
                        etat_partie := gagne;
                        exit;
                    end if;
                when s =>
                    Put_Line ("Veillez entrer le nom que vous "
                    & "souhaitez donner a la sauvegarde");
                    --  Un problème similaire à celui du dessus
                    --  Intervient si on ne met pas deux procedures
                    --  Get_Line
                    Get_Line (titre.lettres, titre.longueur_chaine);
                    Get_Line (titre.lettres, titre.longueur_chaine);
                    chemin := titre_to_chemin (titre);
                    sauvegarder_partie
                      (grille               => grille,
                       grille_solution      => grille_solution,
                       nb_lignes            => nb_lignes,
                       nb_colonnes          => nb_colonnes,
                       chemin               => chemin,
                       parties_sauvegardees => parties_sauvegardees);
                    ajouter_sauvegarde (titre,
                    parties_sauvegardees);
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
                null;
        end case;
        Put_Line ("Fermeture du jeu ...");
        Put_Line ("Nous vous remercions de votre visite"
                    & " et a bientot...");
    end;

end demineur_v1_00;