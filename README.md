# RetroConsole

**Un emulatore didattico in C di una console 8‑bit, completo di CPU minimal, memoria, scheduler round‑robin e grafica 2D tramite SDL2.**

---

## 📖 Panoramica

RetroConsole è un progetto didattico che ti guida nella creazione di un emulatore di console 8‑bit da zero. Il cuore dell’emulatore è scritto in C, affiancato da un assembler Python per caricare giochi in formato binario. Include:

* **CPU minimal** a 16 bit con ciclo *fetch-decode-execute* e set di 16 istruzioni.
* **Memoria e bus** con stack pointer, flag register e spazio indirizzabile fino a 16 KB.
* **Scheduler round‑robin** per far girare più “processi” in user-space.
* **I/O grafico** e input da tastiera con SDL2 (framebuffer 320×240, sprite, tilemap).
* **Assembler Python** (`tools/assemble.py`) per tradurre file `.asm` in `.bin`.
* **Unit test** in C (CUnit o Criterion) e CI tramite GitHub Actions.
* **Documentazione tecnica** in `docs/`, inclusa la specifica ISA (`docs/ISA.md`).

---

## 🚀 Funzionalità principali

* Progettazione e implementazione di un set di istruzioni personalizzato.
* Emulazione del CPU con registri, flag e istruzioni aritmetiche/logiche.
* Gestione di memoria e stack per chiamate e interrupt futuri.
* Scheduling di processi semplici con algoritmo round‑robin.
* Rendering 2D in tempo reale con SDL2 e gestione input.
* Pipeline di build e test automatica via GitHub Actions.

---

## 🛠️ Prerequisiti

* GCC o Clang con supporto C99
* SDL2 (libreria di sviluppo)
* Python 3.x (per l’assembler)
* Git

---

## 🎬 Installazione

```bash
# Clona il repository
git clone https://github.com/<tuo-username>/retroconsole.git
cd retroconsole

# Inizializza submodule se usi SDL2 come submodule
# git submodule update --init --recursive

# Crea directory build e compila
mkdir build && cd build
cmake ..   # oppure 'cmake -G "Unix Makefiles" ..'
make
```

---

## ▶️ Esempio di utilizzo

```bash
# Assembla il gioco di esempio
en python3 ../tools/assemble.py ../game/asm/hello.asm ../game/bin/hello.bin

# Esegui la console con il gioco
./retroconsole ../game/bin/hello.bin
```

---

## 📂 Struttura del progetto

```
/retroconsole
├─ src/            # Codice sorgente C (cpu, membus, scheduler, I/O)
├─ game/           # Sorgenti assembly e binari di esempio
├─ tools/          # Assembler Python
├─ tests/          # Test unitari in C
├─ docs/           # Documentazione tecnica (ISA.md, ARCHITECTURE.md)
├─ .github/        # Workflow CI (GitHub Actions)
└─ README.md
```

---

## 🤝 Contribuire

1. Fai fork del progetto
2. Crea un branch per la tua feature (`git checkout -b feature/nome`)
3. Commit e push delle modifiche (`git commit -m "feat: descrivi il cambiamento"`)
4. Apri una Pull Request

Per problemi o suggerimenti, apri un issue!

---

## 📄 Licenza

Questo progetto è distribuito sotto licenza MIT. Vedi `LICENSE` per i dettagli.
