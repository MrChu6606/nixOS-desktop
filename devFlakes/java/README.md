# Java 21 Nix Development Environment
This directory contains a Nix Flake designed to provide a consistent Java 21 development environment on NixOS, specifically configured to work seamlessly with the Language Support for Java by Red Hat extension in VS Code.

## 🛠 Setup Instructions
### 1. Project Initialization
Ensure you have direnv and nix-direnv installed on your system.

Place the flake.nix in your project root.

Create or update an .envrc file in the same directory with the following line:

Bash

use flake
Run direnv allow in your terminal. This will trigger the shellHook, creating a stable .jdk symlink in your project folder.

### 2. VS Code Configuration
To prevent "Missing Type" errors (e.g., String cannot be resolved) and ensure the IDE uses the correct Java version, update your .vscode/settings.json:

#### JSON

> {
    "java.jdt.ls.java.home": "${workspaceFolder}/.jdk",
    "java.configuration.runtimes": [
        {
            "name": "JavaSE-21",
            "path": "${workspaceFolder}/.jdk",
            "default": true
        }
    ]
}
### 3. Troubleshooting
If VS Code reports compilation errors after a Nix update:

Press Ctrl+Shift+P.

Run Java: Clean Java Language Server Workspace.

Select Restart and delete.

## 🚀 Environment Features
Included Packages
OpenJDK 21: The primary Java Development Kit.

Checkstyle: For code linting and style enforcement.

JDT Language Server: Provides Java IDE features to VS Code.

JaCoCo: For test coverage reporting.

Helper Commands
The shell environment provides several aliases to simplify your workflow:

jbuild: Compiles all .java files in the $SRC directory into the $OUT directory.

jtest: Builds the project and runs JUnit 5 tests.

jcover: Runs tests and generates a JaCoCo coverage execution file.

jreport: Generates an HTML coverage report from the execution file.

jclean: Removes build artifacts (bin/) and coverage reports.

## 📁 File Structure
.jdk/: A symlink to the Nix Store JDK home (automatically created by shellHook). Do not commit this folder.

hws/: Default source directory ($SRC).

bin/: Default output directory ($OUT).
