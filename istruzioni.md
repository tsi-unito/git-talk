# Esercizi Git del Workshop

Benvenuti al workshop su Git! Di seguito troverete una serie di esercizi per mettere in pratica i concetti appresi.

**Istruzioni Generali:**
Per ogni esercizio, vi indicherò una cartella specifica (es. `esercizio-commit-selettivo`) che si trova all'interno della directory principale preparata (`workshop-git-esercizi-preparati`).

---

## Esercizio 1: Revisione e Commit Selettivo

**Repository da Usare:** `esercizio-commit-selettivo`

**Contesto:**
Il repository `esercizio-commit-selettivo` contiene:
* Il file `main.c` che è stato modificato dopo l'ultimo commit.
* Un nuovo file `utils.h` (non tracciato da Git).
* Un nuovo file `notes.txt` (non tracciato da Git) che contiene appunti personali.

**Obiettivo:**
1.  Ispezionare lo stato del repository per capire quali file sono modificati, non tracciati, ecc.
2.  Visualizzare le modifiche specifiche apportate al file `main.c`.
3.  Aggiungere all'area di staging (`staging area`) solo le modifiche apportate a `main.c`.
4.  Effettuare un commit per le modifiche di `main.c` con un messaggio appropriato.
5.  Aggiungere il nuovo file `utils.h` all'area di staging ed effettuare un altro commit.
6.  Il file `notes.txt` non deve essere tracciato per ora. Potete decidere se aggiungerlo a un file `.gitignore` in un secondo momento.

**Passaggi Suggeriti:**
1.  `git status` (per vedere lo stato iniziale)
2.  `git diff main.c` (per vedere le modifiche a `main.c`)
3.  `git add main.c`
4.  `git status` (per vedere `main.c` nello staging)
5.  `git commit -m "Aggiornato main.c con nuove funzionalità e commenti"`
6.  `git status` (per vedere che `utils.h` e `notes.txt` sono ancora lì)
7.  `git add utils.h`
8.  `git commit -m "Aggiunto header utils.h per funzioni di utilità"`
9.  `git status` (ora solo `notes.txt` dovrebbe essere non tracciato)
10. `git log --oneline` (per vedere i commit effettuati)
11. **Opzionale:** Se volete ignorare `notes.txt` per il futuro:
    * Crea un file chiamato `.gitignore`
    * Aggiungi la riga `notes.txt` al file `.gitignore`
    * `git add .gitignore`
    * `git commit -m "Aggiunto notes.txt a .gitignore"`
    * `git status` (ora `notes.txt` non dovrebbe più apparire come "untracked file")

---

## Esercizio 2: Sviluppo Parallelo di Funzionalità

**Repository da Usare:** `esercizio-branching`

**Contesto:**
Il repository `esercizio-branching` ha un branch `main` con alcuni file iniziali (`README.md`, `app.c`).

**Obiettivo:**
1.  Creare un nuovo branch chiamato `feature/user-interface` per lavorare su una nuova interfaccia utente.
2.  Spostarsi (fare `checkout` o `switch`) sul nuovo branch `feature/user-interface`.
3.  Su questo branch, creare un nuovo file `ui_component.c` (potete metterci dentro un semplice commento come `// Componente UI principale`) e fare un commit di questo file.
4.  Tornare al branch `main`.
5.  Sul branch `main`, modificare il file `README.md` aggiungendo una nuova riga (es. "Prossima release: v1.1") e fare un commit di questa modifica.
6.  Visualizzare i branch e la cronologia per osservare come i due branch si sono diversificati.

**Passaggi Suggeriti:**
1.  `git branch` (per vedere i branch esistenti)
2.  `git branch feature/user-interface`
3.  `git switch feature/user-interface` (oppure `git checkout feature/user-interface`)
4.  Crea il file `ui_component.c` con un editor. Esempio: `echo "// Componente UI principale" > ui_component.c`
5.  `git add ui_component.c`
6.  `git commit -m "Aggiunto scheletro per ui_component.c su feature branch"`
7.  `git switch main`
8.  Modifica `README.md` con un editor. Esempio: `echo "Prossima release: v1.1" >> README.md`
9.  `git add README.md`
10. `git commit -m "Aggiornato README con info sulla prossima release"`
11. `git branch -v` (per vedere i branch e l'ultimo commit su ciascuno)
12. `git log --all --graph --oneline --decorate` (per visualizzare la storia di tutti i branch)

---

## Esercizio 3: Integrazione con Risoluzione di Conflitti

**Repository da Usare:** `esercizio-conflitti`

**Contesto:**
Il repository `esercizio-conflitti` ha due branch:
* `main`: contiene il file `geometry.c`.
* `feature/calculate-area`: è stato creato da `main` e ha anch'esso modifiche a `geometry.c`.
Le modifiche apportate a `geometry.c` sui due branch sono in conflitto (riguardano la stessa riga per la definizione della costante `pi`).

**Obiettivo:**
1.  Assicurarsi di essere sul branch `main`.
2.  Tentare di fare il merge del branch `feature/calculate-area` in `main`.
3.  Osservare il messaggio di conflitto.
4.  Aprire `geometry.c`, identificare i marcatori di conflitto (`<<<<<<<`, `=======`, `>>>>>>>`) e risolvere il conflitto manualmente.
    * **Decisione da prendere per la risoluzione:** Mantenere la versione di `pi` più precisa dal branch `feature/calculate-area` e mantenere anche la funzione `print_version()` da `main` e la funzione `circle_area()` da `feature/calculate-area`.
5.  Dopo aver risolto il conflitto nel file, aggiungere il file modificato all'area di staging.
6.  Completare il merge effettuando un commit (Git proporrà un messaggio di merge predefinito che di solito va bene).

**Passaggi Suggeriti:**
1.  `git status` (per controllare il branch corrente, dovrebbe essere `main`)
2.  `git switch main` (se non si è già su `main`)
3.  `git merge feature/calculate-area`
    * Git segnalerà un CONFLITTO in `geometry.c`.
    * `git log --oneline --graph` Mostrerà che i due branch divergono
4.  `git status` (mostrerà `geometry.c` come `unmerged`)
5.  Apri `geometry.c` con un editor di testo. Vedrai qualcosa come:
    ```c
    // Libreria di calcoli geometrici
    #include <stdio.h>

    <<<<<<< HEAD
    // Versione pi su main
    double pi = 3.14; // Valore standard di Pi per calcoli veloci

    void print_version() {
        printf("Geometry lib v1.0\n");
    }
    =======
    // Versione pi su feature
    double pi = 3.14159265359; // Pi con maggiore precisione per calcoli accurati

    double circle_area(double radius) {
        return pi * radius * radius;
    }
    >>>>>>> feature/calculate-area
    ```
6.  Modifica `geometry.c` per risolverlo. L'obiettivo è:
    ```c
    // Libreria di calcoli geometrici
    #include <stdio.h>

    // Versione pi scelta (dal feature branch)
    double pi = 3.14159265359; // Pi con maggiore precisione per calcoli accurati

    // Funzione da main
    void print_version() {
        printf("Geometry lib v1.0\n");
    }

    // Funzione da feature branch
    double circle_area(double radius) {
        return pi * radius * radius;
    }
    ```
7.  `git add geometry.c`
8.  `git status` (dovrebbe mostrare `geometry.c` come `Changes to be committed`)
9.  `git commit` (Si aprirà un editor per il messaggio di commit. Il messaggio predefinito di merge di solito è adeguato. Salva e chiudi.)
10. `git log --graph --oneline` (per vedere il merge commit)

---

## Esercizio 4: Mantenere la Storia Lineare con Rebase

**Repository da Usare:** `esercizio-rebase`

**Contesto:**
Il repository `esercizio-rebase` ha un branch `main` e un branch `feature/logging`.
* `main` ha due commit iniziali (C1, C2), e poi un altro commit (C4) fatto successivamente.
* `feature/logging` è stato creato da C2 (il secondo commit di `main`) e ha un suo commit (C3).
La storia attuale è divergente. L'obiettivo è aggiornare `feature/logging` con le ultime modifiche di `main` (C4) mantenendo una storia lineare, facendo apparire C3 *dopo* C4.

**Obiettivo:**
1.  Assicurarsi di essere sul branch `feature/logging`.
2.  Eseguire un `rebase` del branch `feature/logging` sul branch `main`.
3.  Osservare la nuova cronologia dei commit, che dovrebbe essere lineare (C1 -> C2 -> C4 -> C3').

**Passaggi Suggeriti:**
1.  `git log --all --graph --oneline --decorate` (per vedere lo stato iniziale dei branch e la loro divergenza)
2.  `git switch feature/logging` (se non si è già su questo branch, il setup dovrebbe averti lasciato qui)
3.  `git rebase main`
    * In questo specifico setup, il rebase dovrebbe avvenire senza conflitti. Se ci fossero conflitti in un altro scenario, Git si fermerebbe e ti chiederebbe di risolverli, poi `git add <file_risolto>` e `git rebase --continue`.
4.  `git log --all --graph --oneline --decorate` (per vedere la nuova storia. Il commit di `feature/logging` dovrebbe ora essere in cima alla storia di `main`).

---

## Esercizio 5: Annullare Modifiche

**Repository da Usare:** `esercizio-undo`

**Contesto:**
Il repository `esercizio-undo` è configurato per esplorare diversi modi di annullare le modifiche:
* Sul branch `main`:
    * L'ultimo commit ha introdotto un "ERRORE CRITICO" nel file `report.md`.
    * Il file `stable_config.conf` è stato modificato nel working directory, ma queste modifiche non sono state aggiunte allo staging e non le vuoi.
* Esiste un branch `temp-experiment` con tre commit. Gli ultimi due sono considerati errori e si vogliono rimuovere dalla storia di *questo branch*.

**Obiettivo e Passaggi Suggeriti:**

**Parte 1: Annullare un commit pubblicato (con `git revert`)**
   * **Scenario:** Sul branch `main`, l'ultimo commit ("ERRORE CRITICO...") deve essere annullato in modo sicuro, creando un nuovo commit che ne inverta gli effetti.
   1.  `git switch main` (se non ci sei già)
   2.  `git log --oneline` (identifica l'hash o nota che è `HEAD`)
   3.  `git revert HEAD` (si aprirà un editor per il messaggio del commit di revert; solitamente va bene quello di default. Salva e chiudi)
   4.  `git log --oneline` (osserva il nuovo commit di revert)
   5.  Controlla `report.md` (es. `cat report.md` o aprilo in un editor) per vedere che la riga "ERRORE CRITICO" è sparita.

**Parte 2: Scartare modifiche nel Working Directory (con `git checkout -- <file>`)**
   * **Scenario:** Sul branch `main`, il file `stable_config.conf` ha modifiche locali non volute e non ancora "staged".
   1.  `git status` (dovresti vedere `stable_config.conf` come modificato)
   2.  `cat stable_config.conf` (per vedere le modifiche accidentali)
   3.  `git checkout -- stable_config.conf` (Attenzione: questo comando è distruttivo per le modifiche non salvate!)
   4.  `git status` (ora `stable_config.conf` non dovrebbe più essere listato come modificato)
   5.  `cat stable_config.conf` (per verificare che sia tornato allo stato dell'ultimo commit)

**Parte 3: Rimuovere commit da un branch locale (con `git reset`)**
   * **Scenario:** Sul branch `temp-experiment`, gli ultimi due commit ("Commit 2 (da valutare)" e "Commit 3 (errato)") sono stati un errore e vuoi riportare il branch allo stato del "Commit 1 (base)". **Attenzione:** `git reset --hard` è distruttivo e va usato con cautela, specialmente se i commit sono già stati condivisi (in questo caso, assumiamo che `temp-experiment` sia un branch locale privato).
   1.  `git switch temp-experiment`
   2.  `git log --oneline` (identifica l'hash del "Commit 1 (base)" oppure nota che vuoi tornare indietro di 2 commit da `HEAD`)
   3.  `git reset --hard HEAD~2` (oppure `git reset --hard <hash_del_commit_1>`)
   4.  `git log --oneline` (ora dovresti vedere solo "Commit 1 (base)" su questo branch)
   5.  Controlla `experiment_file.txt`.

---

Buon divertimento con gli esercizi! Non esitare a chiedere aiuto all'istruttore.
