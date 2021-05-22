# Database

## Partie I : Conception de bases de données
### MCD (Modèle Conceptuel des données) | Entités / Associations
Interactions logiques entre les données
#### Cardinalités
![mcd](https://user-images.githubusercontent.com/19282069/119234202-efbc9200-bb2c-11eb-8518-32212dbb9231.png)
### MLD (Modèle Logique des données) | Relationnel
#### Cardinalités
`(?,n) - (1,1)` ou `(?,n) - (0,1)`: relation basique        
`(?,n) - (?,n)`: création d'une entité pour la relation
## Partie II : Dépendances fonctionnelles et normalisation de bases de données
### Dépendance fonctionnelle 
#### Dépendance fonctionnelle élémentaire
![\begin{align*}X \rightarrow A\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+A%5Cend%7Balign%2A%7D%0A)
tel que: 
- ![\begin{align*}X \rightarrow A\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AA+%5Cend%7Balign%2A%7D%0A) est un attribut unique
- ![\begin{align*}A \notin X\en{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AA+%5Cnotin+X%5Cend%7Balign%2A%7D%0A)
#### Axiomes d'Armstrong
[//]: # (thks to https://tex-image-link-generator.herokuapp.com)
- Propriétés des dépendances fonctionnelles
    1. Réflexivité: ![\begin{align*}X \subseteq Y \Rightarrow X\rightarrow Y\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Csubseteq+Y+%5CRightarrow+X+%5Crightarrow+Y%0A%5Cend%7Balign%2A%7D%0A)
    2. Augmentation: ![\begin{align*}X \rightarrow Y \Rightarrow X,Z\rightarrow Y,Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y+%5CRightarrow+X%2CZ+%5Crightarrow+Y%2CZ%0A%5Cend%7Balign%2A%7D%0A)
    3. Transitivité: ![\begin{align*}X \rightarrow Y, Y \rightarrow Z \Rightarrow X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+Y+%5Crightarrow+Z+%5CRightarrow+X+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
- Conséquences
    1. Union: ![\begin{align*}X \rightarrow Y, X \rightarrow Z \Rightarrow X \rightarrow Y,Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+X+%5Crightarrow+Z+%5CRightarrow+X+%5Crightarrow+Y%2CZ%0A%5Cend%7Balign%2A%7D%0A)
    2. Pseudo-transitivité: ![\begin{align*}X \rightarrow Y, WY \rightarrow Z \Rightarrow W,X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+WY+%5Crightarrow+Z+%5CRightarrow+W%2CX+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
    3. Décomposition: ![\begin{align*}X \rightarrow Y, Z \subseteq Y \Rightarrow X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+Z+%5Csubseteq+Y+%5CRightarrow+X+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
...
### Formes Normales
#### 1FN
Attributs atomiques (non-composés et mono-valués)
```
PERSONNE (NOM, PRENOM, ADRESSE)
Mise en 1FN : PERSONNE2 (NOM, PRENOM, N°RUE, RUE, CODEPOSTAL, VILLE)
```
#### 2FN

## Partie III : Concepts avancés de BDD 

## Partie IV : Interopérabilité des BDD et apps

