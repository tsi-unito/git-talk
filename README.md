# Laboratorio “Git & GitHub”
**Dipartimento di Informatica – AA 2024/25**  
_Data evento: **22/05/2025**, ore 16:00-18:00 (2 h)_  
Luogo: **Laboratorio Turing, Dipartimento di Informatica, Via Pessinetto 12, Torino**

> Il TSI e i rappresentanti di Universi.TO organizzano un workshop pratico per imparare a utilizzare Git e GitHub, strumenti fondamentali per chi lavora (o lavorerà!) nel mondo dell’informatica.

Per partecipare è necessario **portare il proprio computer portatile** e seguire le istruzioni di preparazione qui sotto. Ci aspettiamo che tutti i partecipanti abbiano un computer portatile funzionante e che siano in grado di connettersi a Internet.

Il workshop è aperto a tutti gli studenti del Dipartimento di Informatica, ma è consigliato per chi ha già una conoscenza di base di programmazione e utilizzo della riga di comando.
Il workshop è tenuto dal **Dott. Stefano Vittorio Porta**, postgraduate student presso il Dipartimento di Informatica dell’Università di Torino.

# 👉️ Prenotazione 👈️

Il workshop è gratuito e non richiede alcun pagamento. Tuttavia, è necessario registrarsi in anticipo per garantire un posto in presenza e per assicurarci che riceviate le comunicazioni eventuali. Per registrarsi, è sufficiente compilare il modulo di registrazione disponibile al seguente link: [**Prenotazione**](https://app.hi.events/event/826/workshop-git-e-github).

Se i posti in presenza sono esauriti, è possibile partecipare al workshop in modalità remota accedendo a questa [riunione Cisco Webex](https://unito-edu.webex.com/unito-edu/j.php?MTID=m741625a3a850f1600c8771ceb57fcda6). ATTENZIONE! Dovrete accedere col vostro account di Ateneo. 

## Obiettivi del workshop
* Comprendere il funzionamento di Git e GitHub
* Imparare a utilizzare Git per il versionamento del codice
* Imparare a utilizzare GitHub per la collaborazione e la condivisione del codice

# Preparazione

Per sfruttare al massimo le due ore insieme, vi chiediamo di **preparare in anticipo** l’ambiente di lavoro seguendo i passaggi qui sotto.  
> **Durata stimata setup**: ~20 min se avete una connessione veloce.

---

## 1 · Requisiti hardware

| Cosa | Dettaglio |
|------|-----------|
| 💻 Portatile | Almeno 4 GB RAM, < 5 anni di vita consigliati |
| 🔌 Alimentazione | Caricabatterie (ci sono poche prese!) |
| 🌐 Rete | Accesso al Wi‑Fi di Ateneo funzionante |

---

## 2 · Installazione di Git (≥ 2.49)

1. **Windows**  
   * Scaricate **Git for Windows 2.49.0** dal sito ufficiale (link “Download for Windows”).  
   * Durante l’installazione **accettate Git Bash** come terminale predefinito.  
   * Alla fine aprite **Git Bash** e digitate:
     ```bash
     git --version
     ```
     Dovreste vedere `git version 2.49.0` (o superiore).

2. **macOS**  
   * Se usate [Homebrew](https://brew.sh/):  
     ```bash
     brew install git
     ```  
   * In alternativa installate Xcode Command Line Tools:  
     ```bash
     xcode-select --install
     ```
   * Verificate con `git --version`.

3. **Linux**  
   * Debian/Ubuntu: `sudo apt update && sudo apt install git`  
   * Fedora: `sudo dnf install git`  
   * Arch: `sudo pacman -S git`  

ℹ️ Se avete già Git, assicuratevi che sia **≥ 2.40**; aggiornate se necessario.

---

## 3 · Creare (o recuperare) l’account GitHub

* Andate su <https://github.com> e registratevi con la mail d’Ateneo.
    * Se avete già un account GitHub, verificate che sia **attivo** e **funzionante**.
* Confermate l’indirizzo cliccando il link che GitHub vi invia.  
* Aggiungete un avatar: rende più facile riconoscersi!

## 4 · Configurare Git la prima volta

Aprite il terminale/PowerShell/Git Bash e inserite:

```bash
git config --global user.name  "Nome Cognome"
git config --global user.email "mario.rossi@studio.univ.it"
```

> Sostituite con il vostro nome e la mail corrispondente a quella utilizzata per l'account GitHub.

## 5 · Creare una chiave SSH

1. Generate la chiave:  
    ```bash
    ssh-keygen -t ed25519 -C "mario.rossi@studio.univ.it"
    ```
2. Premete Invio tre volte (la passphrase è facoltativa, dovrete inserirla ogni volta se la impostate).

3. Copiate il contenuto di ~/.ssh/id_ed25519.pub (o percorso equivalente su Windows).

4. Su GitHub → **Settings** → **SSH and GPG keys** → **New SSH key** → incollate → **Save**.

5. Testate la connessione:
    ```bash
    ssh -T git@github.com
    ```

Se tutto va bene vedrete un messaggio di benvenuto.

## 6 · Checklist finale ✨

- [ ] Git ≥ 2.40 installato (git --version)
- [ ] Account GitHub attivo e mail verificata
- [ ] git config --global con nome & mail corretti
- [ ] Chiave SSH aggiunta a GitHub
- [ ] Portatile + caricabatterie + Wi‑Fi ok

---

💡 Domande o problemi? Sentitevi liberi di aprire un nuovo topic nella [sezione discussioni](https://github.com/tsi-unito/git-talk/discussions).

Ci vediamo il 22! Buon setup! 🚀
