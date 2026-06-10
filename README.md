# Tetris from Scratch (x86 Assembly)

This project is a deep-dive exploration into computer architecture and low-level programming. My goal is to remake the classic game **Tetris** entirely in **x86 Assembly**, targeting the DOS environment.

This project is written using **NASM (Netwide Assembler)**. This means I am interacting directly with:
- **CPU Registers** (AX, BX, CX, DX, etc.)
- **Direct Memory Access** (Writing directly to the VGA video memory at `0xA0000`)
- **BIOS Interrupts** (Handling keyboard input and video mode switching via `int 10h` and `int 16h`)
- **Manual Memory Management** (Handling coordinates and game state as raw bytes/words in RAM)

## Technical Stack
- **Language:** x86 Assembly
- **Assembler:** NASM
- **Platform:** DOS (Emulated via DOSBox)
- **Graphics Mode:** VGA Mode 13h (320x200 resolution, 256 colors)

## Roadmap
- [x] **Milestone 1:** Hello World (Basic DOS output)
- [x] **Milestone 2:** Direct Pixel Manipulation (VGA Mode 13h)
- [x] **Milestone 3:** Real-time Keyboard Polling & Movement
- [x] **Milestone 4:** Gravity System & Boundary Collision
- [ ] **Milestone 5:** Tetromino Definitions & Shape Rendering
- [ ] **Milestone 6:** Rotation Logic & Collision Detection
- [ ] **Milestone 7:** Line Clearing & Scoring System

## 🕹️ How to Run
To run this project, you will need `NASM` and `DOSBox`.

1. **Assemble the code:**
   ```bash
   nasm tetris.asm -f bin -o tetris.com
