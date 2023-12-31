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
    parties_sauvegardee : T_Parties_Sauvegardees;
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
        when s =>

        when others =>

    end case;
end demineur_v1.00;