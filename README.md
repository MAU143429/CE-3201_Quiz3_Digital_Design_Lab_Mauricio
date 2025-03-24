# 🔢 FSM Design: Detecting Bit Pattern — CE3201

## 🧠 Overview

This repository contains the solution to **Quiz 3 of CE3201 - Digital Circuits Design**. The assignment consists of designing a system using a finite state machine (FSM) to verify whether the last 4 bits entered contain at least two '1's.

The input is provided using two buttons (representing 0 and 1), and a third button is used to confirm the end of input. The system then activates a LED to indicate whether the condition is met.

---

## 💡 Project Summary

- Implemented in **SystemVerilog** using **Quartus Prime**
- FSM diagram created and verified using Quartus tools
- Modular hardware design following best practices
- Includes testbench and simulation files
- Synthesizable for the **DE1-SoC FPGA**


---

## ⚙️ How It Works

1. User inputs a binary number bit by bit using two buttons.
2. A third button signals when the number is complete.
3. The FSM checks the **last 4 bits** for **at least two '1's**.
4. A LED is turned on if the condition is satisfied.

---

## 📌 Note

This project focuses on **FSM design, modular decomposition**, and **practical implementation** on FPGA using Quartus Prime.
