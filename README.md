Projet Demineur
------------------------------------------------------------
Ce projet est la propriété de Maïa DJOROUKHIAN et Jean FARGE.
------------------------------------------------------------
Dans le cadre de notre fomrmation nous devons modéliser un
jeu de démineur.


------------------------------------------------------------

Note sur la modélisation du jeu :

Deux grilles sont utilisées pour modéliser le jeu : une grille vue par le joueur
et une grille solution, cachée qui contient les bombes. Ces deux grilles sont de
même dimension. Les array utilisés ont deux lignes et deux colonnes de plus que
le nombre de lignes et de colonnes de la grille. Cela permet de garder une
couronne autour de la grille, ce qui est utile dans le calcul du nombre de
bombes et dans l'ouverture des cases lorsque la case est vide. En effet, cela
permet de se soustraire à une multitude de disjonctions de cas sur l'indice des
lignes et des colonnes.

Ainsi, Pour modéliser la grille :
             1 □ 1         1 □      |
       1 1 1 1 □ 1         1 1      |
 1 1   1 □ 1 1 1 1                  |
 □ 1   1 1 1                        |       '□' représente une case cachée
 1 1               1 1 1 1 1 1      |       '1' représente le nombre de
         1 1 1     2 ► □ □ ► □      |           bombes autour de la case
         1 □ 1     2 ► 2 1 1 1      |       '►' représente un drapeau
         1 1 1     1 1 1            |
             1 1 1                  |
         1 1 2 □ 1 1 1 1            |
         1 □ □ □ □ □ □ 1            |
         1 □ □ □ □ 1 1 1            |
       1 1 □ □ □ □ 1                |
 1 1 1 1 □ □ □ □ □ 1       1 1      |
 □ □ □ □ □ □ □ □ □ 1       1 □      |

On utilise une grille :
 ► ► ► ► ► ► ► ► ► ► ► ► ► ► ► ► ►
 ►             1 □ 1         1 □ ►
 ►       1 1 1 1 □ 1         1 1 ►
 ► 1 1   1 □ 1 1 1 1             ►
 ► □ 1   1 1 1                   ►
 ► 1 1               1 1 1 1 1 1 ►
 ►         1 1 1     2 ► □ □ ► □ ►
 ►         1 □ 1     2 ► 2 1 1 1 ►
 ►         1 1 1     1 1 1       ►
 ►             1 1 1             ►
 ►         1 1 2 □ 1 1 1 1       ►
 ►         1 □ □ □ □ □ □ 1       ►
 ►         1 □ □ □ □ 1 1 1       ►
 ►       1 1 □ □ □ □ 1           ►
 ► 1 1 1 1 □ □ □ □ □ 1       1 1 ►
 ► □ □ □ □ □ □ □ □ □ 1       1 □ ►
 ► ► ► ► ► ► ► ► ► ► ► ► ► ► ► ► ►

Cette grille est deux lignes et deux colonnes plus
grande que la grille utile (des cases sont donc "inutiles").
Cependant ce choix de modélisation se justifie par la simplification de certaines conditions dans le corps du code. De plus une telle modélisation permet de facilement représenter une grille qui ne serait pas rectangulaire (non traité dans ce projet).
De même, la grille solution qui ne contient que des cases vides et des bombes a une dimension de deux lignes et deux colonnes par rapport à la grille "utile".
Ainsi, pour référer à la case (i,j) de la partie utile de la grille, on appelle la case (i+1,j+1) de la grille réelle.