with Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Directories;
use Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Directories;

package body ES_Fichier is

    procedure CreerFichier (fic : in out File_Type; chemin : String) is
    begin
        Create (fic, Append_File, chemin);
    end CreerFichier;

    procedure SupprimerFicher (fic : in out File_Type) is
    begin
        Delete (fic);
    end SupprimerFicher;

    procedure OuvrirFichier (fic : in out File_Type; chemin : String) is
    begin
        Open (fic, Append_File, chemin);
    end OuvrirFichier;

    procedure FermerFichier (fic : in out File_Type) is
    begin
        Close (fic);
    end FermerFichier;

    procedure OuvrirFichierLect (fic : in out File_Type; chemin : String) is
    begin
        Open (fic, In_File, chemin);
    end OuvrirFichierLect;

    procedure AjouterAuFichier (fic : File_Type; texte : String) is
    begin
        Put (fic, texte);
    end AjouterAuFichier;

    procedure AjouterAuFichier (fic : File_Type; valeur : Float) is
    begin
        Put (fic, valeur, Exp => 0);
    end AjouterAuFichier;

    procedure AjouterAuFichier (fic : File_Type; valeur : Integer) is
    begin
        Put (fic, valeur, 0);
    end AjouterAuFichier;

    procedure NouvelleLigne (fic : File_Type) is
    begin
        New_Line (fic);
    end NouvelleLigne;

    procedure Lecture (fic : File_Type; valeur : out Integer) is
    begin
        Get (fic, valeur);
    end Lecture;

    procedure Lecture (fic : File_Type; valeur : out Float) is
    begin
        Get (fic, valeur);
    end Lecture;

    procedure Lecture (fic : File_Type; valeur : out Character) is
    begin
        Get (fic, valeur);
    end Lecture;

    function FinLigne (fic : File_Type) return Boolean is
    begin
        return End_Of_Line (fic);
    end FinLigne;

    function FinFichier (fic : File_Type) return Boolean is
    begin
        return End_Of_File (fic);
    end FinFichier;

    procedure CreerDossier (nom : String) is
    begin
        Create_Directory (nom);
    end CreerDossier;

    procedure DesignerDossierPrincipal (nom : String) is
    begin
        Set_Directory (nom);
    end DesignerDossierPrincipal;

    function Existence (chemin : String) return Boolean is
    begin
        return Exists (chemin);
    end Existence;

    procedure ReinitialisationFichier (fic : in out File_Type) is
    begin
        Reset (fic);
    end ReinitialisationFichier;
end ES_Fichier;
