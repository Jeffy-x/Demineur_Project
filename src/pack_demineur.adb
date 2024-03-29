with Ada.Text_IO, Pack_Demineur, Aleatoire, ES_Fichier;
use Ada.Text_IO, Pack_Demineur, Aleatoire, ES_Fichier;

package body Pack_Demineur is

    --  La procedure d'affichage donne un caractère à afficher à chaque
    --  élément de case et affiche les lignes et les colonnes
    procedure afficher_grille (grille : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne) is
    begin
        --  affichage du numéro des lignes
        New_Line;
        Put ("    ");
        for J in 1 .. nb_colonnes loop
            if J / 10 = 0 then
                Put ("  ");
            else
                Put (T_Nb_Colonne'Image (J / 10));
            end if;
        end loop;
        New_Line;
        Put ("    ");
        for J in 1 .. nb_colonnes loop
            Put (T_Nb_Colonne'Image (J - 10 * (J / 10)));
        end loop;
        New_Line;
        Put ("   +");
        for J in 1 .. nb_colonnes loop
            Put ("--");
        end loop;
        Put ("-+");
        New_Line;
        --  Affichage des éléments de la grille
        for I in 1 .. nb_lignes loop
            if I < 10 then
                Put (" ");
                Put (T_Nb_Ligne'Image (I));
            else
                Put (T_Nb_Ligne'Image (I));
            end if;
            Put ("|");
            Put (" ");
            for J in 1 .. nb_colonnes loop
                if grille (I + 1, J + 1) = vide then
                    Put (" ");
                    Put (" ");
                elsif grille (I + 1, J + 1) = cache then
                    Put ("");
                    Put ("□ ");
                elsif grille (I + 1, J + 1) = bombe then
                    Put ("●");
                    Put (" ");
                elsif grille (I + 1, J + 1) = drapeau then
                    Put ("► ");
                    Put ("");
                elsif grille (I + 1, J + 1) = '1' then
                    Put ("1");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '2' then
                    Put ("2");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '3' then
                    Put ("3");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '4' then
                    Put ("4");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '5' then
                    Put ("5");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '6' then
                    Put ("6");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '7' then
                    Put ("7");
                    Put (" ");
                elsif grille (I + 1, J + 1) = '8' then
                    Put ("8");
                    Put (" ");
                end if;
            end loop;
            Put ("|");
            New_Line;
        end loop;
        Put ("   +");
        for J in 1 .. nb_colonnes loop
            Put ("--");
        end loop;
        Put ("-+");
    end afficher_grille;

    procedure initialisation_bombe (grille_solution : in out T_Grille;
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; nb_bombes : T_Nb_Bombe) is
        ligne_random : Integer;
        colonne_random : Integer;
        ligne : T_Nb_Ligne;
        colonne : T_Nb_Colonne;
        nb_bombes_a_poser : T_Nb_Bombe := nb_bombes;

    begin
        --  initialisation de la grille_solution
        grille_solution := (others => (others => vide));
        loop
            Initialise (1, Integer (nb_lignes));
            ligne_random := Random;
            Initialise (1, Integer (nb_colonnes));
            colonne_random := Random;
            ligne := T_Nb_Ligne (ligne_random);
            colonne := T_Nb_Colonne (colonne_random);
            --  on pose une bombe en (ligne, colonne), si il n'y en a pas
            if grille_solution (ligne + 1, colonne + 1) /= bombe then
                grille_solution (ligne + 1, colonne + 1) := bombe;
                nb_bombes_a_poser := nb_bombes_a_poser - 1;
            end if;
            exit when nb_bombes_a_poser = 0;

        end loop;
    end initialisation_bombe;

    function compter_bombe (grille_solution : T_Grille; ligne : T_Nb_Ligne;
    colonne : T_Nb_Colonne) return T_Nb_Bombe is
        nb_bombes : T_Nb_Bombe := 0;
    begin
        --  on regarde dans les cases autour de la position (ligne, colonne)
        for i in 0 .. T_Nb_Ligne (2) loop
            for j in 0 .. T_Nb_Colonne (2) loop
                if grille_solution (ligne + i,
                colonne + j) = bombe
                then
                    nb_bombes := nb_bombes + 1;
                end if;
            end loop;
        end loop;
        return nb_bombes;
    end compter_bombe;

    procedure poser_drapeau (grille : in out T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne) is
    begin
        --  on pose un drapeau si la case est cachée
        if grille (ligne + 1, colonne + 1) = cache then
            grille (ligne + 1, colonne + 1) := drapeau;
        --  on enlève le drapeau si la case en a un
        elsif grille (ligne + 1, colonne + 1) = drapeau then
            grille (ligne + 1, colonne + 1) := cache;
        else
            Put_Line ("Il n'est pas possible de poser un drapeau ici...");
        end if;
    end poser_drapeau;

    procedure initialisation_grille (grille : in out T_Grille;
    nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne) is
    begin
        --  on initialise la grille en cachant toutes les cases
        grille := (others => (others => cache));
        --  on crée une couronne de drapeau dans la partie invisible
        --  de la grille
        for i in 1 .. nb_lignes + 2 loop
            grille (i, 1) := drapeau;
            grille (i, nb_colonnes + 2) := drapeau;
        end loop;
        for j in 2 .. nb_colonnes + 1 loop
            grille (1, j) := drapeau;
            grille (nb_lignes + 2, j) := drapeau;
        end loop;
    end initialisation_grille;

    procedure ouvrir_case (grille : in out T_Grille;
    grille_solution : T_Grille;
    ligne : T_Nb_Ligne; colonne : T_Nb_Colonne;
    etat_partie : out T_Etat_Partie) is
        nb_bombe : T_Nb_Bombe;
    begin
        etat_partie := en_cours;
        if grille (ligne + 1, colonne + 1) = cache then
            --  on compte le nombre de bombes autour de (ligne, colonne)
            nb_bombe := compter_bombe (grille_solution, ligne, colonne);
            --  on affiche l'élément de la case
            if grille_solution (ligne + 1, colonne + 1) = bombe then
                grille (ligne + 1, colonne + 1) := bombe;
                etat_partie := perdu;
            elsif nb_bombe = 8 then
                grille (ligne + 1, colonne + 1) := '8';
            elsif nb_bombe = 7 then
                grille (ligne + 1, colonne + 1) := '7';
            elsif nb_bombe = 6 then
                grille (ligne + 1, colonne + 1) := '6';
            elsif nb_bombe = 5 then
                grille (ligne + 1, colonne + 1) := '5';
            elsif nb_bombe = 4 then
                grille (ligne + 1, colonne + 1) := '4';
            elsif nb_bombe = 3 then
                grille (ligne + 1, colonne + 1) := '3';
            elsif nb_bombe = 2 then
                grille (ligne + 1, colonne + 1) := '2';
            elsif nb_bombe = 1 then
                grille (ligne + 1, colonne + 1) := '1';
            elsif nb_bombe = 0 then
                grille (ligne + 1, colonne + 1) := vide;
                --  si la case est vide, on ouvrer les 8 cases autour
                --  par récursivité
                for i in 0 .. T_Nb_Ligne (2) loop
                    for j in 0 .. T_Nb_Colonne (2) loop
                        ouvrir_case (grille, grille_solution,
                        ligne - 1 + i, colonne - 1 + j,
                        etat_partie);
                    end loop;
                end loop;
            end if;
        end if;
    end ouvrir_case;

    function compter_case_a_ouvrir (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne) return T_Nb_Case_A_Ouvrir is
        nb_case_a_ouvrir : T_Nb_Case_A_Ouvrir := 0;
    begin
        --  on regarde dans l'intégralité du tableau
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                --  si la case est cachée ou a un drapeau et qu'il n'y a
                --  pas de bombe, on ajoute une case à ouvrir
                if (grille (I + 1, J + 1) = cache
                or grille (I + 1, J + 1) = drapeau)
                and grille_solution (I + 1, J + 1) /= bombe
                then
                    nb_case_a_ouvrir := nb_case_a_ouvrir + 1;
                end if;
            end loop;
        end loop;
        return nb_case_a_ouvrir;
    end compter_case_a_ouvrir;

    procedure ajouter_sauvegarde (titre : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees) is
    begin
        --  on vérifie qu'il y a encore de la place
        --  dans la liste de sauvegarde
        if parties_sauvegardees.nb_titres_sauvegardes =
        T_Indice_Liste_Sauvegarde'Last
        then
            Put_Line ("Vous avez trop de parties sauvegardees");
        else
            parties_sauvegardees.nb_titres_sauvegardes :=
            parties_sauvegardees.nb_titres_sauvegardes + 1;
            parties_sauvegardees.titres
            (parties_sauvegardees.nb_titres_sauvegardes) := titre;
        end if;
    end ajouter_sauvegarde;

    procedure sauvegarder_partie (grille : T_Grille;
    grille_solution : T_Grille; nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne; chemin : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees) is
        Fichier : File_Type;
        chemin_string : String (1 .. Natural (T_Indice_Chaine'Last));
        chemin_longueur : Natural;
    begin
        --  on caste la longueur de la chaine et la chaine
        --  en Natural et en String pour pouvoir
        --  utililiser le package ES_Fichier
        chemin_longueur := Natural (chemin.longueur_chaine);
        chemin_string (1 .. chemin_longueur) :=
        String (chemin.lettres) (1 .. chemin_longueur);
        CreerFichier (Fichier, chemin_string (1 .. chemin_longueur));
        AjouterAuFichier (Fichier, Integer (nb_lignes));
        NouvelleLigne (Fichier);
        AjouterAuFichier (Fichier, Integer (nb_colonnes));
        NouvelleLigne (Fichier);
        --  on ajoute au fichier toutes les cases de la grille
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                AjouterAuFichier (Fichier,
                elem_case_to_string (grille (I + 1, J + 1)));
            end loop;
            NouvelleLigne (Fichier);
        end loop;
        NouvelleLigne (Fichier);
        --  on ajoute au fichier toutes les cases de la grille_solution
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                AjouterAuFichier (Fichier,
                elem_case_to_string (grille_solution (I + 1, J + 1)));
            end loop;
            NouvelleLigne (Fichier);
        end loop;
        --  lorsque la sauvegarde est une sauvegarde rapide, on sauvegarde dans
        --  .repertoire/sauvegarde_rapide.txt, sinon on crée le fichier
        --  correspondant dans le fichier sauvegarde/
        if chemin.lettres (1 .. 33) /= ".repertoire/sauvegarde_rapide.txt" then
            ajouter_sauvegarde
            (chemin_to_titre (chemin), parties_sauvegardees);
        end if;
        FermerFichier (Fichier);
    end sauvegarder_partie;

    procedure Put (chaine : T_Chaine) is
    begin
        for J in 1 .. chaine.longueur_chaine loop
            Put (chaine.lettres (J));
        end loop;
    end Put;

    procedure Get_Line (lettres : out T_Lettres;
    longueur_chaine : out T_Indice_Chaine) is
        chaine_string : String (1 .. Natural (T_Indice_Chaine'Last));
        chaine_longueur : Natural;
    begin
        --  on initialise une String
        chaine_string (1) := 'a';
        --  on récupère une string et un natural avec Get_Line
        Get_Line (chaine_string, chaine_longueur);
        --  on cast le natural et la string
        --  pour former un élément de type T_Chaine
        longueur_chaine := T_Indice_Chaine (chaine_longueur);
        lettres (1 .. longueur_chaine) :=
        T_Lettres (chaine_string) (1 .. longueur_chaine);
    end Get_Line;

    function elem_case_to_string (elem : T_Element_Case) return String is
    begin
        --  en fonction de l'élément entré, on retourne une chaine de
        --  caractères qui est utilisable dans l'écriture de fichier
        case elem is
            when cache =>
                return "C";
            when vide =>
                return "V";
            when bombe =>
                return "B";
            when drapeau =>
                return "D";
            when '1' =>
                return "1";
            when '2' =>
                return "2";
            when '3' =>
                return "3";
            when '4' =>
                return "4";
            when '5' =>
                return "5";
            when '6' =>
                return "6";
            when '7' =>
                return "7";
            when '8' =>
                return "8";
        end case;
    end elem_case_to_string;

    function character_to_elem_case (char : Character) return T_Element_Case is
    begin
        --  en fonction de l'élément entré, on retourne un élément de
        --  case. C'est utile dans la lecture de fichier
        case char is
            when 'C' =>
                return cache;
            when 'V' =>
                return vide;
            when 'B' =>
                return bombe;
            when 'D' =>
                return drapeau;
            when '1' =>
                return '1';
            when '2' =>
                return '2';
            when '3' =>
                return '3';
            when '4' =>
                return '4';
            when '5' =>
                return '5';
            when '6' =>
                return '6';
            when '7' =>
                return '7';
            when '8' =>
                return '8';
            when others =>
                return vide;
        end case;
    end character_to_elem_case;

    procedure afficher_sauvegardes (parties_sauvegardees :
    T_Parties_Sauvegardees) is
    begin
        --  on affiche le nombre de parties sauvegardées
        Put ("Parties sauvegardees : " & T_Indice_Liste_Sauvegarde'Image
        (parties_sauvegardees.nb_titres_sauvegardes));
        --  on affiche les parties sauvegardées
        for J in 1 .. parties_sauvegardees.nb_titres_sauvegardes loop
            New_Line;
            Put (parties_sauvegardees.titres (J));
        end loop;
    end afficher_sauvegardes;

    procedure charger_sauvegarde (grille : out T_Grille;
    grille_solution : out T_Grille;
    nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne; chemin : T_Chaine) is
        Fichier : File_Type;
        chemin_string : String (1 .. Natural (T_Indice_Chaine'Last));
        chemin_longueur : Natural;
        val_ent : Integer;
        char : Character;
    begin
        --  on initialise les grilles pour pouvoir les utiliser
        initialisation_grille (grille, nb_lignes, nb_colonnes);
        grille_solution := (others => (others => vide));

        chemin_longueur := Natural (chemin.longueur_chaine);
        chemin_string (1 .. chemin_longueur) :=
        String (chemin.lettres) (1 .. chemin_longueur);
        --  On lit le nombre de lignes et de colonnes de la sauvegarde
        OuvrirFichierLect
    (Fichier, chemin_string (1 .. chemin_longueur));
        Lecture (Fichier, val_ent);
        if nb_lignes /= T_Nb_Ligne (val_ent) then
            Put_Line ("Erreur de lecture nb_lignes pour contraindre");
        end if;
        Lecture (Fichier, val_ent);
        if nb_colonnes /= T_Nb_Colonne (val_ent) then
            Put_Line ("Erreur de lecture nb_colonnes pour contraindre");
        end if;
        --  on charge la grille
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                Lecture (Fichier, char);
                grille (I + 1, J + 1) :=
                character_to_elem_case (char);
            end loop;
        end loop;
        --  on charge la grille solution
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                Lecture (Fichier, char);
                grille_solution (I + 1, J + 1) :=
                character_to_elem_case (char);
            end loop;
        end loop;
        FermerFichier (Fichier);
    end charger_sauvegarde;

    procedure charger_lg_grille (nb_lignes : out T_Nb_Ligne;
    nb_colonnes : out T_Nb_Colonne; chemin : T_Chaine) is
        Fichier : File_Type;
        chemin_string : String (1 .. Natural (T_Indice_Chaine'Last));
        chemin_longueur : Natural;
        val_ent : Integer;
    begin
        chemin_longueur := Natural (chemin.longueur_chaine);
        chemin_string (1 .. chemin_longueur) :=
        String (chemin.lettres) (1 .. chemin_longueur);
        OuvrirFichierLect
    (Fichier, chemin_string (1 .. chemin_longueur));
        --  on lit le nombre de lignes et de colonnes de la sauvegarde
        Lecture (Fichier, val_ent);
        nb_lignes := T_Nb_Ligne (val_ent);
        Lecture (Fichier, val_ent);
        nb_colonnes := T_Nb_Colonne (val_ent);
        FermerFichier (Fichier);
    end charger_lg_grille;

    function titre_to_chemin (titre : T_Chaine) return T_Chaine is
        chemin_initial : T_Chaine;
        chemin_global : T_Chaine;
        txt : T_Chaine;
    begin
        chemin_initial.longueur_chaine := 11;
        chemin_initial.lettres
    (1 .. chemin_initial.longueur_chaine) := "sauvegarde/";
        txt.longueur_chaine := 4;
        txt.lettres (1 .. 4) := ".txt";

        --  on concatène les chaines et on aditionne les longueurs
        chemin_global.longueur_chaine :=
        chemin_initial.longueur_chaine + titre.longueur_chaine
        + txt.longueur_chaine;
        chemin_global.lettres (1 .. chemin_global.longueur_chaine) :=
        chemin_initial.lettres (1 .. chemin_initial.longueur_chaine)
        & titre.lettres (1 .. titre.longueur_chaine) & txt.lettres
        (1 .. txt.longueur_chaine);
        return chemin_global;
    end titre_to_chemin;

    function chemin_to_titre (chemin : T_Chaine) return T_Chaine is
        titre : T_Chaine;
    begin
        --  on récupère la partie de titre dans le
        --  chemin de sauvegarde
        titre.longueur_chaine := chemin.longueur_chaine - 15;
        titre.lettres (1 .. titre.longueur_chaine) :=
        chemin.lettres (12 .. (chemin.longueur_chaine - 4));
        return titre;
    end chemin_to_titre;

    procedure initialisation_environnement is
        fic : File_Type;
    begin
        if not Existence ("sauvegarde/") then
            CreerDossier ("sauvegarde/");
        end if;
        if not Existence (".repertoire/") then
            CreerDossier (".repertoire/");
        end if;
        if not Existence (".repertoire/titres_sauvegardes.txt") then
            CreerFichier (fic, ".repertoire/titres_sauvegardes.txt");
            FermerFichier (fic);
        end if;
        if not Existence (".repertoire/sauvegarde_rapide.txt") then
            CreerFichier (fic, ".repertoire/sauvegarde_rapide.txt");
            FermerFichier (fic);
        end if;
    end initialisation_environnement;

    procedure enregistrer_liste_sauvegardes
    (parties_sauvegardees : T_Parties_Sauvegardees) is
        fic : File_Type;
    begin
        --  on réinitialise le fichier avec les titres sauvegardés
        OuvrirFichier (fic, ".repertoire/titres_sauvegardes.txt");
        ReinitialisationFichier (fic);
        FermerFichier (fic);
        --  on écrit les titres sauvegardés dans le fichier (qui
        --  peuvent être plus nombreux que ceux écrits initialement
        --  dans fichier)
        OuvrirFichier (fic, ".repertoire/titres_sauvegardes.txt");
        for J in 1 .. parties_sauvegardees.nb_titres_sauvegardes loop
            AjouterAuFichier (fic, String (parties_sauvegardees.titres
            (J).lettres (1 .. parties_sauvegardees.titres
            (J).longueur_chaine)));
            NouvelleLigne (fic);
        end loop;
        FermerFichier (fic);
    end enregistrer_liste_sauvegardes;

    procedure charger_liste_sauvegardes
    (parties_sauvegardees : out T_Parties_Sauvegardees) is
        Fichier : File_Type;
        titre : T_Chaine;
        titre_string : String (1 .. Natural (T_Indice_Chaine'Last));
        titre_lg : Natural := 0;
        char : Character;
    begin
        OuvrirFichierLect (Fichier, ".repertoire/titres_sauvegardes.txt");
        --  tant que le fichier n'est pas fini, on lit les
        --  éléments du fichier
        while not FinFichier (Fichier) loop
            Lecture (Fichier, char);
            if not FinLigne (Fichier) then
                titre_lg := titre_lg + 1;
                titre_string (titre_lg) := char;
            else
                titre_lg := titre_lg + 1;
                titre_string (titre_lg) := char;
                titre.longueur_chaine := T_Indice_Chaine (titre_lg);
                titre.lettres (1 .. titre.longueur_chaine) :=
                T_Lettres (titre_string) (1 .. titre.longueur_chaine);
                titre_lg := 0;
                ajouter_sauvegarde (titre, parties_sauvegardees);
            end if;
        end loop;
        FermerFichier (Fichier);
    end charger_liste_sauvegardes;

    procedure supprimer_elem_liste_sauvegarde
    (parties_sauvegardees : in out T_Parties_Sauvegardees; titre : T_Chaine) is
    begin
        --  on parcours la liste des titres sauvegardés
        for J in 1 .. parties_sauvegardees.nb_titres_sauvegardes loop
            if parties_sauvegardees.titres (J) = titre then
                parties_sauvegardees.titres
                (J .. parties_sauvegardees.nb_titres_sauvegardes) :=
                parties_sauvegardees.titres
                (J + 1 .. parties_sauvegardees.nb_titres_sauvegardes + 1);
                parties_sauvegardees.nb_titres_sauvegardes :=
                parties_sauvegardees.nb_titres_sauvegardes - 1;
            end if;
        end loop;
    end supprimer_elem_liste_sauvegarde;

    procedure supprimer_sauvegarde (titre : T_Chaine;
    parties_sauvegardees : in out T_Parties_Sauvegardees) is
        fic : File_Type;
    begin
        supprimer_elem_liste_sauvegarde (parties_sauvegardees, titre);
        OuvrirFichier (fic, Chaine_to_String (titre_to_chemin (titre)));
        SupprimerFicher (fic);
    end supprimer_sauvegarde;

    function "=" (chaine1 : T_Chaine; chaine2 : T_Chaine) return Boolean is
    begin
        return chaine1.lettres (1 .. chaine1.longueur_chaine) =
        chaine2.lettres (1 .. chaine2.longueur_chaine)
        and chaine1.longueur_chaine = chaine2.longueur_chaine;
    end "=";

    function Chaine_to_String (chaine : T_Chaine) return String is
    begin
        return String (chaine.lettres) (1 .. Natural (chaine.longueur_chaine));
    end Chaine_to_String;

    procedure mettre_solution (grille : in out T_Grille;
    grille_solution : T_Grille;
    nb_lignes : T_Nb_Ligne; nb_colonnes : T_Nb_Colonne) is
    begin
        --  on met dans la grille toutes les bombes de la grille_solution
        for I in 1 .. nb_lignes loop
            for J in 1 .. nb_colonnes loop
                if grille_solution (I, J) = bombe then
                    grille (I, J) := bombe;
                end if;
            end loop;
        end loop;
    end mettre_solution;
end Pack_Demineur;