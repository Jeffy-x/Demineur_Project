package Pack_Demineur is
    type T_Nb_Ligne is range 0 .. 101;
    type T_Nb_Colonne is range 0 .. 101;
    type T_Nb_Bombe is range 0 .. 1000;
    type T_Element_Case is (cache, vide, bombe, drapeau,
    '1', '2', '3', '4', '5', '6', '7', '8');
    type T_Grille is array (T_Nb_Ligne range <>,
    T_Nb_Colonne range <>) of T_Element_Case;
    --  L'action du joueur n'est que d'une lettre pour permettre de jouer
    --  plus rapidement :
    --  p => poser un drapeau
    --  o => ouvrir une case
    --  q => quitter
    --  s => sauvegarder
    --  d => supprimer une sauvegarde
    type T_Action_Joueur is (p, o, q, s, d);
    --  Le choix de chargement de grille est aussi d'une lettre pour
    --  permettre de lancer plus rapidement la partie :
    --  n => nouvelle partie
    --  c => continuer la partie en cours
    --  s => charger une sauvegarde
    --  q => quitter
    type T_Choix_Chargement_Grille is (n, c, s, q);
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
    --  E/ : grille : T_Grille; nb_lignes : T_Nb_Ligne;
    --  E/ : nb_colonnes : T_Nb_Colonne
    --  Necessite : grille de dimension nb_lignes + 2,
    --              nb_colonnes + 2
    --  Ecriture : affiche la grille
    procedure afficher_grille (grille : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne);

    --  Action : initialisation_bombe
    --  E/S/ : grille_solution : T_Grille
    --  E/ : nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne;
    --  E/ : nb_bombes : T_Nb_Bombe
    --  Necessite : grille solution de dimension nb_lignes + 2,
    --              nb_colonnes + 2, nb_bombes <= nb_lignes * nb_colonnes
    --  Entraîne : la grille solution est remplie de nb_bomes bombes
    procedure initialisation_bombe (grille_solution : in out T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; nb_bombes : T_Nb_Bombe);

    --  Action : compter_bombe
    --  E/ : grille : T_Grille; ligne : T_Nb_Ligne;
    --       colonne : T_Nb_Colonne
    --  S/ : le nombre de bombe (T_Nb_Bombe) dans les cases adjacentes à la
    --            position ligne, colonne
    --  Necessite : (ligne, colonne) doit être une coordonnée de la grille
    function compter_bombe (grille_solution : T_Grille; ligne : T_Nb_Ligne;
    colonne : T_Nb_Colonne) return T_Nb_Bombe;

    --  Action : poser_drapeau
    --  E/S/ : grille : T_Grille
    --  E/ : ligne : T_Nb_Ligne; colonne : T_Nb_Colonne
    --  Necessite : (ligne, colonne) ∈ grille
    --  Entraîne : Place ou enlève un drapeau à la position donnée si c'est
    --          possible.
    --  Ecriture : message d'erreur s'il n'est pas possible de
    --             poser un drapeau
    procedure poser_drapeau (grille : in out T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne);

    --  Action : ouvrir_case
    --  E/S/ : grille : T_Grille
    --  E/ : grille solution : T_Grille;
    --       ligne : T_Nb_Ligne; colonne : T_Nb_Colonne
    --  S/ : etat_partie : T_Etat_Partie
    --  Necessite : (ligne, colonne) ∈ grille
    --  Action : ouvre la case considérée et les cases le groupe de cases
    --           adjacentes qui ne sont pas des bombes. Si la case ouverte
    --           est une case vide alors toutes les autres cases vides
    --           ajacentes sont ouvertes par récursivité
    procedure ouvrir_case (grille : in out T_Grille;
    grille_solution : T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne;
    etat_partie : out T_Etat_Partie);

    --  Action : initialisation_grille
    --  E/S/ : grille : T_Grille;
    --         nb_lignes : T_Nb_lines; nb_colonnes : T_Nb_Colonne
    --  Necessite : Néant
    --  Action : met caché dans toutes les cases sauf sur la couronne
    --           (cachée à l'utilisateur) qui est remplie de drapeaux.
    procedure initialisation_grille (grille : in out T_Grille;
    nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne);

    --  Action : compter_case_a_ouvrir
    --  E/ : grille & grille_solution : T_Grille
    --       nb_lignes : T_Nb_Ligne, nb_colonnes : T_Nb_Colonne
    --  S/ : le nombre de cases restantes à ouvrire pour gagner
    --  Necessite : Néant
    function compter_case_a_ouvrir (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne) return T_Nb_Case_A_Ouvrir;

    --  Action : sauvegarder_partie
    --  E/ : grille & grille_solution : T_Grille;
    --       nb_ligne : T_Nb_Ligne; nb_colonne : T_Nb_Colonne
    --       chemin : T_Chaine;
    --  E/S/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Necessite : Neant
    --  Entraîne : Crée un fichier.txt qui comprend la grille
    --             de jeu ainsi que la grille_solution.
    procedure sauvegarder_partie (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; chemin : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees);

    --  Action : ajouter_sauvegarde
    --  E/ : titre : T_Chaine;
    --  E/S/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Nécessite : Néant
    --  Entraîne : ajoute le titre à la liste de parties sauvegardées
    --  Ecriture : Message d'erreur si il y a trop de parties sauvegardées
    procedure ajouter_sauvegarde (titre : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees);

    --  Action : Put
    --  E/ : chaine : T_Chaine
    --  Ecriture : Affiche la chaine
    procedure Put (chaine : T_Chaine);

    --  Action : Get_Line
    --  S/ : lettres : T_Lettres; longueur_chaine : T_Indice_Chaine
    --  Lecture : lettres; longueur chaine
    procedure Get_Line (lettres : out T_Lettres;
    longueur_chaine : out T_Indice_Chaine);

    --  Action : elem_case_to_string
    --  E/ : elem : T_Elem_Case
    --  S/ : les elements de case sous forme de String
    function elem_case_to_string (elem : T_Element_Case) return String;

    --  Action : character_to_elem_case
    --  E/ : char : Character
    --  S/ : les elements de case correspondant au caractère
    function character_to_elem_case (char : Character) return T_Element_Case;

    --  Action : afficher_sauvegardes
    --  E/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Ecriture : la liste et le nombre de parties sauvegardées
    procedure afficher_sauvegardes
    (parties_sauvegardees : T_Parties_Sauvegardees);

    --  Action : charger_sauvegarde
    --  E/ : nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne;
    --       chemin : T_Chaine
    --  S/ : grille & grille_solution : T_Grille
    --  Nécessite : l'existence d'un fichier de sauvegarde à l'adresse chemin
    --  Entraîne : grille & grille_solution sont remplies avec la sauvegarde
    procedure charger_sauvegarde
    (grille : out T_Grille; grille_solution : out T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; chemin : T_Chaine);

    --  Action : charger_lg_grille
    --  E/ : chemin : T_Chaine;
    --  S/ : nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne
    --  Nécessite : l'existence d'un fichier de sauvegarde à l'adresse chemin
    --  Entraîne : nb_lignes & nb_colonnes valent le nombre de lignes et le
    --             nombre de colonne de la grille sauvegardée au chemin.
    procedure charger_lg_grille (nb_lignes : out T_Nb_Ligne;
    nb_colonnes : out T_Nb_Colonne; chemin : T_Chaine);

    --  Action : titre_to_chemin
    --  E/ : titre : T_Chaine
    --  S/ : renvoie la T_Chaine qui est une concaténation de "sauvegarde/",
    --       avec titre et ".txt"
    function titre_to_chemin (titre : T_Chaine) return T_Chaine;

    --  Action : chemin_to_titre
    --  E/ : chemin : T_Chaine
    --  S/ : renvoie le titre du fichier de sauvegarde en type T_Chaine
    function chemin_to_titre (chemin : T_Chaine) return T_Chaine;

    --  Action : initialisation_environnement
    --  Entraîne : S'ils n'existent pas, crée un dossier sauvegarde/ et
    --             un dossier .repertoire/ et dans ce dernier les fichiers
    --             titres_sauvegardes.txt et sauvegarde_rapide.txt
    procedure initialisation_environnement;

    --  Action : enregistrer_liste_sauvegardes
    --  E/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Entraîne : écrit les titres de parties_sauvegardees dans le fichier
    --             titres_sauvegardes
    procedure enregistrer_liste_sauvegardes
    (parties_sauvegardees : T_Parties_Sauvegardees);

    --  Action : charger_liste_sauvegardes
    --  S/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Entraîne : parties_sauvegardees a la liste des titres sauvegardés
    procedure charger_liste_sauvegardes
    (parties_sauvegardees : out T_Parties_Sauvegardees);

    --  Action : supprimer_elem_liste_sauvegarde
    --  E/ : titre : T_Chaine
    --  E/S/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Entraîne : retire le titre des parties sauvegardees
    procedure supprimer_elem_liste_sauvegarde
    (parties_sauvegardees : in out T_Parties_Sauvegardees;
    titre : T_Chaine);

    --  Action : supprimer_sauvegarde
    --  E/ : titre : T_Chaine
    --  E/S/ : parties_sauvegardees : T_Parties_Sauvegardees
    --  Nécessite : l'existence d'un fichier de sauvegarde pour le titre
    --  Entraîne : supprime le fichier de sauvegarde correspondant au titre
    --            et supprime le titre de la liste des parties_sauvegardees
    procedure supprimer_sauvegarde (titre : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees);

    --  Action : "="
    --  E/ : chaine1 & chaine2 : T_Chaine
    --  S/ : vrai si les chaines sont de la même longueur et se valent
    function "=" (chaine1 : T_Chaine; chaine2 : T_Chaine) return Boolean;

    --  Action : Chaine_to_String
    --  E/ : chaine : T_Chaine
    --  S/ : retourne la chaine sous forme de String
    function Chaine_to_String (chaine : T_Chaine) return String;

end Pack_Demineur;