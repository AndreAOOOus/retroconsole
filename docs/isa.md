## Specifica dell'ISA per RetroConsole

Questo documento definisce il set di istruzioni e il relativo encoding a 16 bit per l'emulatore RetroConsole.

---

### Formati delle istruzioni

Abbiamo tre formati principali:

1. **Formato R (Register)** - operazioni tra registri

   ```text
   +--------+--------+--------+--------+
   | opcode |   Rd   |   Rs   |   Rt   |
   | 4 bit  | 4 bit  | 4 bit  | 4 bit  |
   +--------+--------+--------+--------+
   ```

   * `opcode` : codice operativo (4 bit)
   * `Rd`     : registro destinazione (R0–R15)
   * `Rs`     : primo operando (R0–R15)
   * `Rt`     : secondo operando (R0–R15)

2. **Formato I (Immediate)** - operazioni con immediato a 8 bit

   ```text
   +--------+--------+--------------+
   | opcode |   Rd   |   Immediate  |
   | 4 bit  | 4 bit  |    8 bit     |
   +--------+--------+--------------+
   ```

   * `Immediate`: valore costante a 8 bit (2's complement)

3. **Formato J (Jump/Call)** - indirizzi a 12 bit

   ```text
   +--------+-----------------------+
   | opcode |     Address (imm12)   |
   | 4 bit  |       12 bit          |
   +--------+-----------------------+
   ```

   * `Address`: indirizzo di memoria a 12 bit (word addressable)

---

### Set di istruzioni

| Nome | Opcode (hex) | Formato | Descrizione                        |      |
| :--- | :----------: | :------ | :--------------------------------- | ---- |
| NOP  |      0x0     | R       | No operation                       |      |
| MOVR |      0x1     | R       | `Rd = Rs`                          |      |
| MOVI |      0x2     | I       | `Rd = Immediate`                   |      |
| ADD  |      0x3     | R       | `Rd = Rs + Rt`                     |      |
| SUB  |      0x4     | R       | `Rd = Rs - Rt`                     |      |
| AND  |      0x5     | R       | `Rd = Rs & Rt`                     |      |
| OR   |      0x6     | R       | \`Rd = Rs                          | Rt\` |
| XOR  |      0x7     | R       | `Rd = Rs \u2295 Rt` (bitwise XOR)  |      |
| SHL  |      0x8     | R       | `Rd = Rs << (Rt & 0xF)`            |      |
| SHR  |      0x9     | R       | `Rd = Rs >> (Rt & 0xF)` (logical)  |      |
| CMP  |      0xA     | R       | `Flags = Rs - Rt` (set Z, N flags) |      |
| JMP  |      0xB     | J       | `PC = Address`                     |      |
| JEQ  |      0xC     | J       | `if Z flag == 1 then PC = Address` |      |
| JNE  |      0xD     | J       | `if Z flag == 0 then PC = Address` |      |
| CALL |      0xE     | J       | Push PC+1 su stack; `PC = Address` |      |
| RET  |      0xF     | R       | Pop PC dallo stack                 |      |

---

### Registri

* **R0–R15**: 16 registri generali a 16 bit.
* **PC**: Program Counter, 16 bit, word-aligned.
* **SP**: Stack Pointer, 16 bit.
* **Flag Register**: 3 bit significativi:

  * **Z** (Zero)
  * **N** (Negative)
  * **C** (Carry) *(opzionale future)*

---

### Note

* Lo stack cresce verso indirizzi decrescenti in memoria.
* L'address space è di 4 K parole (16 KB), indirizzate da PC a 12 bit.
* Tutte le istruzioni occupano 1 word (16 bit).

---

Questo set minimale copre le funzionalità necessarie per un piccolo gioco 2D (movimento, branching, chiamate di routine) e offre basi per estensioni future (LOAD/STORE, operazioni sulla memoria, interrupt).
