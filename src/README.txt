Ce projet est la propriété de Maïa DJOROUKHIAN et Jean FARGE.
Ce projet a pour but de modéliser un jeu de démineur.
------------------------------------------------------------

------------------------------------------------------------



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