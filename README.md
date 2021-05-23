# Partie I : Conception de bases de données
## MCD (Modèle Conceptuel des données) | Entités / Associations
Interactions logiques entre les données
### Cardinalités
![mcd](https://user-images.githubusercontent.com/19282069/119234202-efbc9200-bb2c-11eb-8518-32212dbb9231.png)
## MLD (Modèle Logique des données) | Relationnel
#### Rappels 
![tuples-attribut-relation](https://user-images.githubusercontent.com/19282069/119253758-faba0580-bbb2-11eb-8deb-43753d213324.png)
### Cardinalités
`(?,n) - (1,1)` ou `(?,n) - (0,1)`: relation basique        
`(?,n) - (?,n)`: création d'une entité pour la relation
# Partie II : Dépendances fonctionnelles et normalisation de bases de données
## Dépendance fonctionnelle 
### **Dépendance fonctionnelle élémentaire**
![\begin{align*}X \rightarrow A\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+A%5Cend%7Balign%2A%7D%0A)
tel que: 
- ![\begin{align*}X \rightarrow A\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AA+%5Cend%7Balign%2A%7D%0A) est un attribut unique
- ![\begin{align*}A \notin X\en{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AA+%5Cnotin+X%5Cend%7Balign%2A%7D%0A)
### **Axiomes d'Armstrong**
[//]: # (thks to https://tex-image-link-generator.herokuapp.com)
- Propriétés des dépendances fonctionnelles
    1. Réflexivité: ![\begin{align*}X \subseteq Y \Rightarrow X\rightarrow Y\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Csubseteq+Y+%5CRightarrow+X+%5Crightarrow+Y%0A%5Cend%7Balign%2A%7D%0A)
    2. Augmentation: ![\begin{align*}X \rightarrow Y \Rightarrow X,Z\rightarrow Y,Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y+%5CRightarrow+X%2CZ+%5Crightarrow+Y%2CZ%0A%5Cend%7Balign%2A%7D%0A)
    3. Transitivité: ![\begin{align*}X \rightarrow Y, Y \rightarrow Z \Rightarrow X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+Y+%5Crightarrow+Z+%5CRightarrow+X+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
- Conséquences
    1. Union: ![\begin{align*}X \rightarrow Y, X \rightarrow Z \Rightarrow X \rightarrow Y,Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+X+%5Crightarrow+Z+%5CRightarrow+X+%5Crightarrow+Y%2CZ%0A%5Cend%7Balign%2A%7D%0A)
    2. Pseudo-transitivité: ![\begin{align*}X \rightarrow Y, WY \rightarrow Z \Rightarrow W,X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+WY+%5Crightarrow+Z+%5CRightarrow+W%2CX+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
    3. Décomposition: ![\begin{align*}X \rightarrow Y, Z \subseteq Y \Rightarrow X \rightarrow Z\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%2C+Z+%5Csubseteq+Y+%5CRightarrow+X+%5Crightarrow+Z%0A%5Cend%7Balign%2A%7D%0A)
### **Application** 
- `R1(A1, ..., AN)` schéma relationnel
- `X` & `Y` sous-ensembles de `{A1, ..., AN}`
- On dit que:   
`X` détermine `Y` ![\begin{align*}X \rightarrow Y\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AX+%5Crightarrow+Y%5Cend%7Balign%2A%7D%0A)   
SSI pour l'instance R, on a tuples T1, T2:      
`T1 [X] = T2 [X] => T1 [Y] = T2 [Y]`
### **Exemple**
![exemple-table](https://user-images.githubusercontent.com/19282069/119253909-9ea3b100-bbb3-11eb-95f0-4d6205fec4e5.png)
* NumPropriétaire -> Nom
* NumPropriétaire -> Ville
* NumVéhicule -> Marque
* NumPropriétaire, NumVéhicule -> Date

*Remarque: Une DF s'applique sur toutes les instances possibles*
### **Couverture minimale**
Plus petit ensemble de DF permettant d'obtenir la succession d'axiomes d'inférence
![exemple-couverture-min](https://user-images.githubusercontent.com/19282069/119254049-7072a100-bbb4-11eb-8d9b-9ebbb0272593.png)
## Formes Normales
### **1FN**
Attributs atomiques (non-composés et mono-valués)
`PERSONNE (NOM, PRENOM, ADRESSE)`   
*Mise en 1FN :*  
`PERSONNE (NOM, PRENOM, N°RUE, RUE, CODEPOSTAL, VILLE)`
### **2FN**
Requis:
- Être en 1FN
- tout attribut non-primaire dépend de la totalité de la clé
- Exemple: ![\begin{align*}R(\underline{A,B},C,D)\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AR%28%5Cunderline%7BA%2CB%7D%2CC%2CD%29%0A%5Cend%7Balign%2A%7D%0A) en 1FN.         
![\begin{align*}A \rightarrow C \Rightarrow R\end{align*}](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0AA+%5Crightarrow+C+%5CRightarrow+R%0A%5Cend%7Balign%2A%7D%0A) n'est pas en 2FN, on devrait avoir `C` dépend de `A,B`
- Solution: on décompose une relation en sous-relations ![exemple-2FN-sol](https://user-images.githubusercontent.com/19282069/119254380-399d8a80-bbb6-11eb-8f80-f7149422037c.png)
### **3FN**
Requis:
- Être en 2FN
- un attribut non-clé ne dépend pas d'un attribut non-clé
- Exemple: ![exemple-3FN](https://user-images.githubusercontent.com/19282069/119254446-a87ae380-bbb6-11eb-8016-277c04dde157.png)
# Partie III : Concepts avancés de BDD 
## Vues

# Partie IV : Interopérabilité des BDD et apps

