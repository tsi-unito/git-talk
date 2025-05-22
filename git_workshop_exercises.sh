#!/bin/bash

# Script per preparare i repository per il workshop Git.
# Eseguire questo script in una cartella vuota.
# Creerà una sottocartella 'workshop-git-esercizi-preparati'.

set -e # Esce immediatamente se un comando fallisce

MAIN_EXERCISE_DIR="workshop-git-esercizi-preparati"

# Verifica se siamo su macOS o Linux per il comando sed (se necessario)
# Per questo script, cercheremo di evitare sed o usare alternative semplici.

# --- Funzione di utilità per scrivere contenuto in un file ---
write_to_file() {
  # $1: percorso del file
  # $2: contenuto
  echo "$2" > "$1"
}

append_to_file() {
  # $1: percorso del file
  # $2: contenuto da appendere
  echo "$2" >> "$1"
}


# --- Inizio Setup ---
echo "Inizio preparazione esercizi Git..."
rm -rf "$MAIN_EXERCISE_DIR" # Rimuove la cartella se esiste già per una preparazione pulita
mkdir "$MAIN_EXERCISE_DIR"
cd "$MAIN_EXERCISE_DIR" || exit 1 # Entra nella cartella principale degli esercizi o esce

BASE_DIR=$(pwd) # Salva il percorso base

# --- Esercizio 1: Revisione e Commit Selettivo ---
echo ""
echo ">>> Preparazione Esercizio 1: Revisione e Commit Selettivo..."
DIR_EX1="1-esercizio-commit-selettivo"
rm -rf "$DIR_EX1"
mkdir "$DIR_EX1"
cd "$DIR_EX1" || exit 1

git init -b main > /dev/null
echo "Repository inizializzato per $DIR_EX1"

# File main.c base
write_to_file "main.c" "// File principale del programma
#include <stdio.h>
#include \"utils.h\" // Aggiungiamo l'include per coerenza futura

int main() {
    printf(\"Versione iniziale del programma.\n\");
    return 0;
}"
git add main.c
git commit -m "Versione base di main.c" > /dev/null

# Modifiche a main.c (che gli studenti troveranno)
append_to_file "main.c" "// Nuova funzione importante aggiunta qui sotto
void important_feature() {
    printf(\"Questa e' una feature molto importante!\n\");
}

// Chiamata alla nuova funzione in main
// main() {
//    printf(\"Versione iniziale del programma.\n\");
//    important_feature(); // <- Decommentare e testare
//    return 0;
// }"
# Nota: La modifica sopra è un commento per guidare lo studente,
# ma per git è una modifica testuale. Lo studente vedrà che main.c è modificato.

# Nuovo file utils.h (untracked)
write_to_file "utils.h" "// Header per le funzioni di utilita'
#ifndef UTILS_H
#define UTILS_H

void utility_function(); // Dichiarazione di una funzione di utilita'

#endif // UTILS_H"

# Nuovo file notes.txt (untracked)
write_to_file "notes.txt" "Appunti personali sul progetto:
- Ricordarsi di testare la nuova feature.
- Controllare la documentazione per la funzione X."

echo "Contenuto di $DIR_EX1 pronto."
cd "$BASE_DIR" || exit 1
echo ">>> Esercizio 1 pronto."

# --- Esercizio 2: Sviluppo Parallelo di Funzionalità ---
echo ""
echo ">>> Preparazione Esercizio 2: Sviluppo Parallelo di Funzionalità..."
DIR_EX2="2-esercizio-branching"
rm -rf "$DIR_EX2"
mkdir "$DIR_EX2"
cd "$DIR_EX2" || exit 1

git init -b main > /dev/null
echo "Repository inizializzato per $DIR_EX2"

write_to_file "README.md" "# Progetto K
Questo progetto implementa funzionalita' di base."
git add README.md
git commit -m "README iniziale" > /dev/null

write_to_file "app.c" "// File principale dell'applicazione K
#include <stdio.h>

int main() {
    printf(\"Applicazione K avviata.\n\");
    return 0;
}"
git add app.c
git commit -m "Aggiunta struttura base app.c" > /dev/null

echo "Contenuto di $DIR_EX2 pronto."
cd "$BASE_DIR" || exit 1
echo ">>> Esercizio 2 pronto."

# --- Esercizio 3: Integrazione con Risoluzione di Conflitti ---
echo ""
echo ">>> Preparazione Esercizio 3: Integrazione con Risoluzione di Conflitti..."
DIR_EX3="3-esercizio-conflitti"
rm -rf "$DIR_EX3"
mkdir "$DIR_EX3"
cd "$DIR_EX3" || exit 1

git init -b main > /dev/null
echo "Repository inizializzato per $DIR_EX3"

# geometry.c su main (versione che causerà conflitto)
write_to_file "geometry.c" "// Libreria di calcoli geometrici
#include <stdio.h>

// Versione pi su main
double pi = 3.14; // Valore standard di Pi per calcoli veloci

void print_version() {
    printf(\"Geometry lib v1.0n\n\");
}"
git add geometry.c
git commit -m "Aggiunta geometry.c con Pi base e print_version" > /dev/null

# Creazione e switch al branch feature
git branch feature/calculate-area > /dev/null
git switch feature/calculate-area > /dev/null

# geometry.c su feature/calculate-area (versione che causerà conflitto + nuova funzione)
write_to_file "geometry.c" "// Libreria di calcoli geometrici
#include <stdio.h>

// Versione pi su feature
double pi = 3.14159265359; // Pi con maggiore precisione per calcoli accurati

double circle_area(double radius) {
    return pi * radius * radius;
}"
git add geometry.c
git commit -m "Migliorata precisione Pi e aggiunta circle_area" > /dev/null

# Torniamo su main per lasciare il repo in questo stato per lo studente
git switch main > /dev/null

write_to_file "geometry.c" "// Libreria di calcoli geometrici
#include <stdio.h>

// Versione pi su main (scelta diversa rispetto al branch feature)
double pi = 3.0; // Pi semplificato per prototipi veloci

double circumference(double radius) {
    return 2 * pi * radius;
}

void print_version() {
    printf(\"Geometry lib v1.1\\n\");
}"
git add geometry.c
git commit -m "Ridotta precisione di Pi e aggiunta circumference" > /dev/null


echo "Contenuto di $DIR_EX3 pronto. Il branch 'main' e 'feature/calculate-area' hanno modifiche conflittuali su geometry.c."
cd "$BASE_DIR" || exit 1
echo ">>> Esercizio 3 pronto."

# --- Esercizio 4: Mantenere la Storia Lineare con Rebase ---
echo ""
echo ">>> Preparazione Esercizio 4: Mantenere la Storia Lineare con Rebase..."
DIR_EX4="4-esercizio-rebase"
rm -rf "$DIR_EX4"
mkdir "$DIR_EX4"
cd "$DIR_EX4" || exit 1

git init -b main > /dev/null
echo "Repository inizializzato per $DIR_EX4"

# C1 su main
write_to_file "config.txt" "VERSION=1.0"
git add config.txt
git commit -m "C1: Aggiunta config.txt iniziale" > /dev/null

# C2 su main
append_to_file "config.txt" "MAX_USERS=10"
git add config.txt
git commit -m "C2: Aggiunto MAX_USERS a config" > /dev/null
COMMIT_C2_HASH=$(git rev-parse HEAD)

# Creazione del branch feature da C2 (ma non facciamo switch subito)
git branch feature/logging "$COMMIT_C2_HASH" > /dev/null

# C4 su main (C3 sarà su feature)
append_to_file "config.txt" "TIMEOUT=30"
git add config.txt
git commit -m "C4: Aggiunto TIMEOUT a config (su main)" > /dev/null

# C3 su feature/logging
git switch feature/logging > /dev/null
write_to_file "logger.c" "// Funzioni di logging
#include <stdio.h>

void log_message(char* level, char* msg) {
    printf(\"[%s]: %s\n\", level, msg);
    // Implementazione futura: scrittura su file, invio a server, etc.
}"
git add logger.c
git commit -m "C3: Aggiunto scheletro logger.c (su feature)" > /dev/null

# Lasciamo lo studente sul branch feature/logging per l'esercizio
echo "Contenuto di $DIR_EX4 pronto. Il branch e' 'feature/logging'."
cd "$BASE_DIR" || exit 1
echo ">>> Esercizio 4 pronto."


# --- Esercizio 5: Annullare Modifiche ---
echo ""
echo ">>> Preparazione Esercizio 5: Annullare Modifiche..."
DIR_EX5="5-esercizio-undo"
rm -rf "$DIR_EX5"
mkdir "$DIR_EX5"
cd "$DIR_EX5" || exit 1

git init -b main > /dev/null
echo "Repository inizializzato per $DIR_EX5"

# Setup per Revert su main
write_to_file "report.md" "# Report Settimanale\n\nVersione 1 del report."
git add report.md
git commit -m "Aggiunto report.md v1" > /dev/null

append_to_file "report.md" "## Sezione Corretta
Questa sezione e' stata revisionata ed e' corretta."
git add report.md
git commit -m "Aggiornato report a v2 - revisione completata" > /dev/null

# Il commit "cattivo"
append_to_file "report.md" "

ATTENZIONE: QUESTA RIGA CONTIENE DATI SENSIBILI E NON DOVEVA ESSERE COMMITTATA!"
git add report.md
git commit -m "ERRORE CRITICO: Aggiunti dati sensibili per sbaglio al report" > /dev/null
BAD_COMMIT_ON_MAIN_HASH=$(git rev-parse HEAD)

# Setup per Reset su un altro branch
git branch temp-experiment > /dev/null
git switch temp-experiment > /dev/null
write_to_file "experiment_file.txt" "Dati iniziali per l'esperimento."
git add experiment_file.txt
git commit -m "Commit 1 (base) su temp-experiment" > /dev/null
FIRST_COMMIT_TEMP_EXPERIMENT_HASH=$(git rev-parse HEAD)

append_to_file "experiment_file.txt" "\nModifica #1 all'esperimento - forse non necessaria."
git add experiment_file.txt
git commit -m "Commit 2 (da valutare) su temp-experiment" > /dev/null

append_to_file "experiment_file.txt" "\nModifica #2 all'esperimento - decisamente da rimuovere."
git add experiment_file.txt
git commit -m "Commit 3 (errato) su temp-experiment" > /dev/null

# Setup per Checkout file (torniamo su main)
git switch main > /dev/null
write_to_file "stable_config.conf" "TIMEOUT=60
MAX_CONNECTIONS=100
FEATURE_FLAG_X=true"
git add stable_config.conf
git commit -m "Aggiunto stable_config.conf con configurazione stabile" > /dev/null

# Ora modifichiamo stable_config.conf nel working directory (non staged)
append_to_file "stable_config.conf" "
# MODIFICA ACCIDENTALE CHE NON VOGLIO SALVARE
DEBUG_MODE=true
USER_LIMIT=5"

echo "Contenuto di $DIR_EX5 pronto."
echo "  - Su 'main', l'ultimo commit ('$BAD_COMMIT_ON_MAIN_HASH') e' l'errore da revertire."
echo "  - Su 'main', il file 'stable_config.conf' ha modifiche non staged."
echo "  - Il branch 'temp-experiment' ha 3 commit; gli ultimi due sono candidati per il reset."
echo "  - Lo studente inizierà su 'main'."
cd "$BASE_DIR" || exit 1
echo ">>> Esercizio 5 pronto."


# --- Fine Setup ---
echo ""
echo "*********************************************************************"
echo "Tutti gli esercizi sono stati preparati nella cartella: $MAIN_EXERCISE_DIR"
echo "Percorso assoluto: $(pwd)"
echo "*********************************************************************"

exit 0
