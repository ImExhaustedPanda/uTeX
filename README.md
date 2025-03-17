# uTeX
A customizable AutoHotkey v2.0 script for fast, intuitive LaTeX typing. Features short/long-press remapping, with Greek letters, math symbols, and more modifier-based shortcuts.

---

## Features

- **Toggleable LaTeX Mode** → `Shift + CapsLock` with tray icon indicator (LaTeX Mode Off: Standard keyboard functionality)
- **CapsLock Modifier** → `CapsLock` repurposed as a modifier (Original CapsLock toggle via double tap)
- **Press Duration Dependant Key Remapping** → Short press less than 300 ms, long press greater than 300ms
- **Row Numbers** → Short press: symbol | Long press: number
- **Brackets, Symbols, Misc** → Short press: default symbol | Long press: secondary symbol
- **Greek Letters** → `CapsLock + Character` (Short press: lowercase | Long press: uppercase)
- **Functions & Operators** → `Alt + CapsLock + Character` (Short press: primary function | Long press: secondary function)
- **Quick Math Symbols** → `Alt + Character`
- **Code Blocks** → Short press: `` ` `` | Long press: `` ``` `` | ``Shift + ` ``: `¬` 
- **Shift Modifier** Unless stated otherwise, combing any shortcut with `Shift` will treat an input as a long press.

---

## Quick Start

1. **Install [AutoHotkey v2.0](https://www.autohotkey.com/)**
2. Download and extract uTeX.zip
3. Run `uTeX.ahk` or add a shortcut to startup
   ```C:\Users\"USER"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup```

---

## Keybindings Cheat Sheet

### Number Row

| Character | Short Press | Long Press |
|-----------|-------------|------------|
| 1         | !           | 1          |
| 2         | "           | 2          |
| 3         | £           | 3          |
| 4         | $           | 4          |
| 5         | %           | 5          |
| 6         | ^           | 6          |
| 7         | &           | 7          |
| 8         | *           | 8          |
| 9         | (           | 9          |
| 0         | )           | 0          |

### Brackets, Symbols, Misc

| Character | Short Press | Long Press |
|-----------|-------------|------------|
| [         | {           | [          |
| ]         | }           | ]          |
| ;         | ;           | :          |
| '         | '           | @          |
| #         | #           | ~          |
| ,         | ,           | <          |
| .         | .           | >          |
| /         | /           | ?          |
| \         | \           | \|         |
| -         | -           | _          |
| =         | =           | +          |
| `         | `           | ```        |

> **Note:** Curly braces `{}` are prioritized over `[]` in short presses for LaTeX convenience.

---

## Greek Letters
`CapsLock + Character`
- *Short press* → lowercase Greek
- *Long press* → uppercase Greek

| Character | Short Press      | Long Press       |
|-----------|------------------|------------------|
| a         | \alpha           | \Alpha           |
| b         | \beta            | \Beta            |
| d         | \delta           | \Delta           |
| e         | \epsilon         | \Epsilon         |
| g         | \gamma           | \Gamma           |
| l         | \lambda          | \Lambda          |
| m         | \mu              | \Mu              |
| n         | \nu              | \Nu              |
| p         | \pi              | \Pi              |
| r         | \rho             | \Rho             |
| s         | \sigma           | \Sigma           |
| t         | \theta           | \Theta           |
| y         | \psi             | \Psi             |
| u         | \phi             | \Phi             |
| w         | \omega           | \Omega           |
| x         | \chi             | \Chi             |
| h         | \eta             | \Eta             |
| z         | \zeta            | \Zeta            |
| i         | \mathbf{\hat{i}} | \mathbf{\hat{i}} |
| j         | \mathbf{\hat{j}} | \mathbf{\hat{j}} |
| k         | \mathbf{\hat{k}} | \kappa           |

---

## Functions & Operators
`Alt + CapsLock + Character`

| Character | Short Press     | Long Press     |
|-----------|-----------------|----------------|
| s         | \sin            | \cos           |
| t         | \tan            | \sec           |
| a         | \arcsin         | \arccos        |
| r         | \arctan         | \csc           |
| v         | \vec{}          | \underline{}   |
| d         | \dot{}          | \ddot{}        |
| m         | \cdot           | \times         |
| c         | \frac{d}{dx}    | \int \\, dx    |
---

## Quick Math Symbols  
`Alt + Character`

| Character | Output       |
|-----------|--------------|
| ,         | \leq         |
| .         | \geq         |
| -         | \in          |
| /         | \frac{}{}    |
| =         | \implies     |
| 9         | \left(       |
| 0         | \right)      |
| [         | \left[       |
| ]         | \right]      |

---

## 📝 Customization

- The script is easy to modify and I encourage you to do so, for your own custom remaps.
- HoldThreshold (300ms default) sets minimum duration for long-press and CapsLock double tap sensitivity.
- LaTeX Mode On is the default initial setting
