with Ada.Text_IO; use Ada.Text_IO;

package ES_Fichier is

    --  Création ou ecrasement d'un fichier
    procedure CreerFichier (fic : in out File_Type; chemin : String);
    --  Suppression d'un fichier
    procedure SupprimerFicher (fic : in out File_Type);
    --  Ouverture d'un fichier en mode ''Ajout'
    procedure OuvrirFichier (fic : in out File_Type; chemin : String);
    --  Ouverture d'u fichier en mode lecture
    procedure OuvrirFichierLect (fic : in out File_Type; chemin : String);
    --  Fermeture d'un fichier
    procedure FermerFichier (fic : in out File_Type);
    --  Ajout d'information
    procedure AjouterAuFichier (fic : File_Type; texte : String);
    procedure AjouterAuFichier (fic : File_Type; valeur : Float);
    procedure AjouterAuFichier (fic : File_Type; valeur : Integer);
    --  Provoque un retour à la ligne dans le fichier
    procedure NouvelleLigne (fic : File_Type);
    --  Lecture d'informations
    procedure Lecture (fic : File_Type; valeur : out Integer);
    procedure Lecture (fic : File_Type; valeur : out Float);
    procedure Lecture (fic : File_Type; valeur : out Character);
    --  Fin de la ligne ??
    function FinLigne (fic : File_Type) return Boolean;
    --  Fin du fichier ??
    function FinFichier (fic : File_Type) return Boolean;

    procedure CreerDossier (nom : String);

    procedure DesignerDossierPrincipal (nom : String);

    function Existence (chemin : String) return Boolean;

    procedure ReinitialisationFichier (fic : in out File_Type);
end ES_Fichier;