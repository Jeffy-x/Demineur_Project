with Ada.Text_IO, Pack_Demineur;
use Ada.Text_IO, Pack_Demineur;

procedure test_charger_lg_grille is
    nb_lignes : T_Nb_Ligne;
    nb_colonnes : T_Nb_Colonne;
    titre : T_Chaine;
    package T_Nb_Ligne_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Ligne);
    use T_Nb_Ligne_IO;
    package T_Nb_Colonne_IO is new
    Ada.Text_IO.Integer_IO (T_Nb_Colonne);
    use T_Nb_Colonne_IO;
begin
    Put_Line ("Donnez le titre de la partie dont vous"
    & " voulez charger la longueur : ");
    Get_Line (titre.lettres, titre.longueur_chaine);
    charger_lg_grille
      (nb_lignes   => nb_lignes,
       nb_colonnes => nb_colonnes,
       titre       => titre);
    Put ("La partie que vous avez charge a un nb de lignes : ");
    Put (nb_lignes);
    New_Line;
    Put ("et un nb de colonnes : ");
    Put (nb_colonnes);
end test_charger_lg_grille;