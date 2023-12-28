package Aleatoire is
    --  On définit un type float entre 0 et 1 qui sera renvoyé par la
    --  fonction random
    subtype T_Valeur_Reelle_Aleatoire is Float range 0.0 .. 1.0;
    --  procedure qui permet de définir l'intervalle des valeurs réelles
    --  données par la fonction random
    procedure Initialise (Minimum : Integer := 1; Maximum : Integer := 10);
    --  definition d'une fonction random
    function Random return T_Valeur_Reelle_Aleatoire;
    function Random return Integer;
end Aleatoire;