package Pack_Demineur is
    type T_Nb_Ligne is range 0 .. 101;
    type T_Nb_Colonne is range 0 .. 101;
    type T_Nb_Bombe is range 0 .. 1000;
    type T_Element_Case is (cache, vide, bombe, drapeau,
    '1', '2', '3', '4', '5', '6', '7', '8');
    type T_Grille is array (T_Nb_Ligne range <>,
    T_Nb_Colonne range <>) of T_Element_Case;
    type T_Action_Joueur is (p, o, q);
    type T_Random is range 1 .. 99;
    type T_Etat_Partie is (gagne, en_cours, perdu);
    type T_Nb_Case_A_Ouvrir is range 0 .. 9801;
    --  Chaine de caractere pour recuperer le chemin
    type T_Indice_Chaine is range 0 .. 100;
    type T_Lettres is array (1 .. T_Indice_Chaine'Last) of Character;
    type T_Chaine is record
        lettres : T_Lettres;
        longueur_chaine : T_Indice_Chaine := 0;
    end record;
    --  Creation stockage de la liste des parties sauvegardees
    type T_Indice_Liste_Sauvegarde is range 0 .. 100;
    type T_Titre_Sauvegarde is
    array (1 .. T_Indice_Liste_Sauvegarde'Last) of T_Chaine;
    type T_Parties_Sauvegardees is record
        titres : T_Titre_Sauvegarde;
        nb_titres_sauvegardes :
        T_Indice_Liste_Sauvegarde := 0;
    end record;

    --  Action : afficher_grille
    --  E/ : grille, nb_lignes, nb_colonnes
    --  Necessite : grille déjà contrainte
    --  Entraîne : affiche la grille
    procedure afficher_grille (grille : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne);

    --  Action : initialisation_bombe
    --  E/S/ : in (nb_lignes, nb_colonnes, nb_bombes), out grille_solution
    --  Necessite : Néant
    --  Entraîne : la grille solution est remplie de bombes
    procedure initialisation_bombe (grille_solution : in out T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; nb_bombes : T_Nb_Bombe);

    --  Action : compter_bombe
    --  E/S/ : grille : T_Grille; nb_lignes : T_Nb_Ligne;
    --  E/S/ : nb_colonnes : T_Nb_Colonne
    --  Renvoie : le nombre de bombe dans les cases adjacentes à la
    --            position ligne, colonne
    --  Necessite : Néant
    function compter_bombe (grille_solution : T_Grille; ligne : T_Nb_Ligne;
    colonne : T_Nb_Colonne) return T_Nb_Bombe;

    --  Action : poser_drapeau
    --  E/S/ : grille, position du drapeau
    --  Necessite : Néant
    --  Entraîne : Place ou enlève un drapeau à la position donnée si c'est
    --          possible.
    procedure poser_drapeau (grille : in out T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne);

    --  Action : ouvrir_case
    --  E/S/ : grille
    --  E/ : grille solution; ligne; colonne
    --  Necessite : néant
    --  Action : ouvre la case considérée et les cases le groupe de cases
    --           adjacentes qui ne sont pas des bombes
    procedure ouvrir_case (grille : in out T_Grille;
    grille_solution : T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne;
    etat_partie : out T_Etat_Partie);

    --  Action : initialisation_grille
    --  E/S/ : grille, nb_lignes, nb_colonnes
    --  Necessite : Néant
    --  Action : met caché dans toutes les cases sauf sur la
    --          couronne qui est remplie de drapeaux.
    procedure initialisation_grille (grille : in out T_Grille;
    nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne);

    --  Action : compter_case_a_ouvrir
    --  E/S/ : grille et grille_solution, nb_lignes, nb_colonnes
    --         retourne le nb de cases restantes à ouvrir
    --  Necessite : Neant
    function compter_case_a_ouvrir (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne) return T_Nb_Case_A_Ouvrir;

    --  Action : sauvegarder_partie
    --  E/S/ : grille, grille_solution, nb_ligne, nb_colonne
    --  Necessite : Neant
    --  Entraîne : Crée un fichier.txt qui comprend la grille
    --             de jeu ainsi que la grille_solution.
    procedure sauvegarder_partie (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne);

    procedure ajouter_sauvegarde (titre : T_Chaine;
    parties_sauvegardee : in out T_Parties_Sauvegardees);

    procedure Put (chaine : T_Chaine);

    procedure Get_Line (lettres : out T_Lettres;
    longueur_chaine : out T_Indice_Chaine);
end Pack_Demineur;