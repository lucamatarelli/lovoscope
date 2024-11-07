# Lovoscope

Ce mini-projet Perl permet de consulter la compatibilité amoureuse quotidienne basée sur votre signe astrologique. Ce script interroge une page web de prédictions astrologiques et affiche un "lovoscope" personnalisé, selon le statut amoureux (célibataire ou en couple). Conçu pour des utilisateurs francophones, le programme fonctionne via une interface en ligne de commande et inclut des instructions interactives.

### Compétences Engrangées

- **Gestion des entrées utilisateur et validation d'erreurs** : création d'une fonction récursive de vérification qui assure la validité des entrées utilisateur. En cas d'erreur, des messages d'alerte s'affichent pour inviter l'utilisateur à entrer une information correcte.

- **Webscraping** : parcours de la structure HTML d'une page web et extraction des données spécifiques.

- **Conception d'une interface utilisateur en ligne de commande** : création d'une interface textuelle conviviale et interactive, guidant l'utilisateur tout au long de l'exécution. Des instructions étape par étape permettent de sélectionner le signe astrologique, de définir le statut relationnel, et d'afficher le résultat de compatibilité en couleur pour améliorer la lisibilité.

- **Sortie propre du programme** : implémentation d'une fonction de sortie en douceur, qui permet à l'utilisateur de lire son résultat avant de quitter, avec une attente de validation par l'appui de la touche Entrée.

## Prérequis

- **Perl** : le script nécessite l'interpréteur Perl.
- **Modules Perl** : assurez-vous que les modules suivants sont installés :
  - `Term::ANSIColor`
  - `Term::ReadKey`
  - `HTML::TreeBuilder`

## Utilisation

1. **Exécutez le script** : lancez le script en ligne de commande avec `perl lovoscope.pl`.
2. **Interaction** : csuivez les instructions du programme pour découvrir votre compatibilité du jour.

**Note** : Le script récupère les informations de compatibilité sur un site externe. Assurez-vous d'être connecté à Internet pour que cela fonctionne.

## Limites et Améliorations Futures

- **Fiabilité des données** : le script dépend de la structure HTML du site interrogé. Si cette structure change, le script pourrait nécessiter une mise à jour.
- **Support multilingue** : actuellement, le script est prévu pour un public francophone. Une extension future pourrait inclure une internationalisation de l'interface.
- **Gestion d'erreurs améliorée** : une meilleure gestion des erreurs pourrait être implémentée pour les cas où la connexion échoue ou les éléments HTML ne sont pas trouvés.

## Contribuer

Les contributions sont les bienvenues ! Pour proposer des améliorations, veuillez cloner le dépôt, créer une branche pour vos modifications et soumettre une pull request.