# nix-fleet

A modular, flake-based NixOS configuration focused on reproducibility, multi-host management, and a clean system architecture using a custom `mkHost` builder.

This repository manages multiple machines (laptop, server, and Raspberry Pi) from a single unified flake with consistent package handling, overlays, and system composition.

---

# Features

* Fully modular NixOS system architecture
* Custom `mkHost` abstraction for all hosts
* Multi-host support (x86_64 + aarch64/ARM64)
* Stable + optional unstable package integration via overlay
* Automatic module loading system
* Unified pkgs model (single universe per system)
* Wayland-first desktop (Niri)
* NVF-based Neovim configuration
* Zen Browser integration
* Flatpak support via nix-flatpak
* Clean separation between system, host, and modules
* Extensible overlay system
* Reproducible development environments via flake dev shells

---

# Repository Structure

```text
.
├── flake.nix              # Entry point (hosts + inputs + overlays)
├── lib/
│   ├── mkHost.nix        # Core system builder abstraction
│   └── load-modules.nix  # Automatic module loader
│
├── modules/
│   ├── shared/           # Shared system configuration
│   ├── laptop/           # Laptop-specific modules
│   ├── server/           # Server configuration
│   └── pi/               # ARM/Raspberry Pi configuration
│
├── overlays/             # System overlays (steam, qutebrowser, etc.)
│
├── nvf/                  # Neovim configuration (NVF-based)
│
├── devFlakes/            # Reproducible dev environments
│
└── other configs/
    ├── niri/
    ├── kanshi/
    ├── noctalia/
    ├── shell/
    └── wallpapers/
```

---

# Architecture Overview

This system is built around a strict separation of concerns:

## 1. flake.nix — composition layer

Defines:

* inputs (nixpkgs, unstable, nvf, etc.)
* overlays
* host declarations via `mkHost`

It does NOT directly configure the system.

---

## 2. mkHost — system builder

`mkHost` is the single entry point for building any machine.

It is responsible for:

* Creating the system `pkgs`
* Applying overlays
* Injecting shared modules
* Passing system-wide special arguments
* Ensuring consistency across architectures

All hosts (laptop, server, pi) go through this function.

---

## 3. modules — system behavior

Modules define actual system configuration:

* boot configuration
* networking
* desktop environment
* packages
* services
* hardware-specific tweaks

Modules are automatically loaded using:

```nix
loadModules ./modules/<host>
```

---

## 4. overlays — package modifications

Overlays are used for:

* custom package tweaks
* patched applications
* enabling unstable package namespace (`pkgs.unstable`)
* system-wide package adjustments

No separate unstable nixpkgs instance is used — unstable is exposed via overlay namespace.

---

# Host System

Each machine is defined declaratively via `mkHost`.

## Example: Laptop

```nix
lotus = mkHost {
  system = "x86_64-linux";

  overlays = [
    unstableOverlay
  ];

  modules = [
    ./modules/laptop
  ];
};
```

---

## Example: Server

```nix
sequoia = mkHost {
  system = "x86_64-linux";

  overlays = [
  ];

  modules = [
    ./modules/server
  ];
};
```

---

## Example: Raspberry Pi (ARM64)

```nix
pi = mkHost {
  system = "aarch64-linux";

  overlays = [
    unstableOverlay
  ];

  modules = [
    ./modules/pi
  ];
};
```

---

# Package Model

This system uses a **single pkgs universe per system architecture**.

Instead of separate nixpkgs instances:

* `pkgs` → stable base system
* `pkgs.unstable` → optional unstable channel (via overlay)

Example usage:

```nix
environment.systemPackages = with pkgs; [
  git
  curl

  unstable.neovim
  unstable.python3
];
```

---

# NVF (Neovim)

NVF is built as a system package derived from the active pkgs universe:

* No separate nixpkgs instance
* Inherits system architecture automatically
* Can optionally use `pkgs.unstable`

This ensures consistent plugin and dependency versions across the system.

---

# Desktop Environment

Laptop configuration is built around:

* **Niri** (Wayland compositor)
* **Alacritty** terminal
* **Zen Browser**
* **Qutebrowser**
* Kanshi for display management

The environment is optimized for a keyboard-driven workflow.

---

# Server Configuration

The server setup is minimal and service-oriented:

* AdGuard Home / DNS tooling
* Media / automation services
* SSH-first administration model
* No GUI dependencies unless explicitly required

---

# Raspberry Pi (ARM64)

The Pi is treated as a first-class host:

* Uses `aarch64-linux` system target
* Shares same module system as other hosts
* No special pkgs universe required
* Fully integrated into mkHost workflow

---

# Development Environments

Each environment is isolated in `devFlakes/`:

```bash
nix develop ./devFlakes/python
```

Environments are fully reproducible and version-pinned.

---

# Design Philosophy

## Single pkgs universe per system

Avoids duplication and inconsistent package trees.

## Overlays instead of multiple nixpkgs instances

Unstable packages are exposed as a namespace, not a separate world.

## mkHost is the only system entry point

All machines are constructed consistently.

## Modular first

Everything is split into:

* host modules
* shared modules
* overlays
* system builder

---

# Usage

## Build system

```bash
nh os switch
```

## Update inputs

```bash
nh os switch --update
```

## Enter dev environment

```bash
nix develop ./devFlakes/<name>
```

---

# Future Ideas

* Expand ARM support (Pi cluster experiments)
* Hjem integration for dotfile management
* Multi-disk / multi-machine orchestration tooling

