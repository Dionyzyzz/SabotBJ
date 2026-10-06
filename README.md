# Le Sabot Blackjack

Table de blackjack multijoueur en temps réel : jusqu'à cinq joueurs contre la banque, sur un tapis bordeaux.

![Rendu mobile](docs/mobile.png)

## Jouer

- **Multijoueur** : la table partagée tourne comme artifact Claude (la page publiée sur claude.ai). Pour inviter des joueurs, partager l'artifact avec l'accès **Contributeur**. Avec un accès Lecteur, on regarde la partie sans s'asseoir.
- **Solo** : `index.html` s'ouvre dans n'importe quel navigateur (ou sur GitHub Pages) et lance une partie seul contre la banque. L'état partagé n'existe que dans la version artifact.

## Règles

- Sabot de 6 jeux, remélangé quand il reste moins d'un quart des cartes.
- Mise de 25 à 5 000. Chaque joueur commence avec 5 000 jetons, recave de 5 000 possible.
- La banque tire à 16 et reste sur tous les 17. Le blackjack est payé 3 pour 2.
- Doubler sur les deux premières cartes, y compris après une séparation.
- Séparer jusqu'à 4 mains. As séparés : une seule carte chacun.
- Pas d'assurance ni d'abandon.

## Fonctionnalités

- **Synchronisation en direct** de la table entre tous les joueurs, avec un verrou court pour qu'une seule action s'applique à la fois.
- **Conseiller** : tableau de stratégie de base (mains dures, souples, paires), explication du coup, probabilités calculées sur les cartes encore non vues (risque de sauter, banque qui saute, gain moyen de chaque choix) et compte Hi-Lo avant la donne.
- **Bulle « meilleur coup »** à chaque tour, calée au-dessus des boutons et pointée vers le coup conseillé.
- **Absents** : 30 s pour jouer son tour (sinon la main s'arrête et la place se libère après la donne), retrait de la table après 2 min sans action, bouton « Je reste ».
- **Mobile** : grands boutons en 2×2, conseiller en panneau coulissant, barre d'état fixe.
- Journal de la table et classement des gains.

Raccourcis clavier pendant votre tour : **T** tirer, **R** rester, **D** doubler, **S** séparer. **C** ouvre les conseils, **Entrée** valide la mise.

## Fichiers

| Fichier | Rôle |
| --- | --- |
| `sabot-blackjack.html` | Source de l'artifact Claude (sans `<html>`/`<head>`, ajoutés par la visionneuse). |
| `index.html` | Page autonome, générée par `./build.sh`. Ne pas modifier à la main. |
| `build.sh` | Régénère `index.html` à partir du source. |

Après une modification de `sabot-blackjack.html` :

```sh
./build.sh
```
