# Démarrage rapide du projet CEP

1. Connectez vous sur https://eval.ensimag.fr/cep/
2. Récupérez le dépôt avec la commande indiquée du type :

```bash
git clone depots.ensimag.fr:/depots/2018/cep/cep_login1_login2
```
  3. Si ce n'est pas déjà dans votre fichier `~\.bashrc` ajoutez à la fin
```bash
source /Xilinx/env-14.7.sh
```
Ou lancez cette commande à la main dans le terminal où vous ferez votre projet.

4. Vérifiez que tout compile
```
make run_simu TOP=MMIPS_simple PROG=test_lui
```
5. A présent implémentez votre première instruction en suivant la méthode de conception (voir chapitre 4 - méthode de conception de CEP_cdc.pdf)

6. Si tout est validé, "commitez" vos modifications sur votre dépôt:
```bash
git add fichiers_à_enregistrer_dans_le_dépôt
git commit -m "Texte decrivant les modifications faites"
git push
```
7. Rendez vous sur https://eval.ensimag.fr/cep/ pour faire votre première validation
8. et recommencez pour l'instruction suivante (`ori`), en utilisant en plus de la simulation et du test sur carte l'autotest (voir Annexe D.5 de CEP_cdc.pdf)
9. et faire toutes les autres instructions.
