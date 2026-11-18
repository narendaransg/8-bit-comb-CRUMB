
# 8-Bit Microcomputer in CRUMB 🛠️

Collaborative VLSI design and breadboard routing for our 8-bit microcomputer project using the CRUMB Circuit Simulator.

## 📂 Repository Structure

- **`circuits/`** - The main `.cru` / `.crumb` save files.
- **`docs/`** - Datasheets, architecture block diagrams, and pinout references.
- **`scripts/`** - Automation scripts for syncing files between Git and the simulator.
- **`shared/`** - Reference images, UI layouts, and logic tables.
- **`uploads/`** - Exported logic analyzer waveforms or external screenshots.

---

## 🚀 Phase 1: One-Time Setup for New Collaborators

Follow these exact steps to set up this repository on your laptop from scratch.

### Step 1: Handle GitHub SSH Keys (No more password prompts)

GitHub requires an SSH key to upload files from the terminal.

1. Open your terminal and check if you already have a key by running:

   ```bash
   ls ~/.ssh/*.pub
   ```

2. **If it says "No such file":** Generate a new one by running this command (press Enter through all the prompts to leave everything default and empty):

   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

3. **Copy your key:** Run this command to display your key on the screen:

   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

   Select and copy the entire output (it starts with `ssh-ed25519...`).

4. **Add to GitHub:** Go to GitHub.com, click your profile picture (top right) > **Settings** > **SSH and GPG keys** > **New SSH key**. Give it a title (like "My Laptop") and paste the key into the Key box. Click Add.

### Step 2: Clone the Repository

Now that GitHub trusts your laptop, download the repository using the SSH link:

```bash
git clone git@github.com:narendaransg/8-bit-comb-CRUMB.git

cd 8-bit-comb-CRUMB
```

### Step 3: Configure the Sync Script

Because everyone installs the game in different places, our script needs to know where your specific `saves` folder is located.

Run the pull command for the first time:

```bash
./scripts/sync.sh pull
```

The script will pause and ask for your absolute game path.

- *Example (Portable offline version):* `/mnt/d/CRUMB.Circuit.Simulator.v1.3.5/saves`
- *Example (Standard Steam version):* `/mnt/c/Users/YourName/AppData/LocalLow/Mike Bushell/CRUMB/Saves`

Paste your specific path and hit Enter. The script will remember this forever in a hidden `.sync_config` file on your laptop.

### Step 4: Auto-Instructions Terminal Setup (Recommended)

To automatically display the workflow commands whenever you open this project folder in the terminal, add this block to the bottom of your `~/.zshrc` (or `~/.bashrc` for standard bash users):

```bash
# CRUMB Project Auto-Instructions
function chpwd() {
    # NOTE: If using bash, replace 'function chpwd()' with 'cd()'
    # and add 'builtin cd "$@"' as the very first line inside the bracket.
    if [[ "$PWD" == *"/8-bit-comb-CRUMB" ]]; then
        echo -e "\n=============================================="
        echo " 🛠️  CRUMB VLSI COLLABORATION WORKFLOW 🛠️"
        echo "=============================================="
        echo " 1. Sync first : ./scripts/sync.sh pull"
        echo " 2. Open CRUMB : Do your wiring and Save"
        echo " 3. Upload     : ./scripts/sync.sh push \"what I changed\""
        echo -e "==============================================\n"
    fi
}
```

Run `source ~/.zshrc` (or `source ~/.bashrc`) to apply it immediately.

---

## 🔄 Phase 2: The Daily Collaboration Workflow

**Crucial Rule:** Never edit, copy, or move the `.cru` Git files manually. Always use the sync script below. Coordinate on Discord so two people aren't editing the exact same circuit file at the exact same time.

### 1. Start your session

Always pull the latest changes before you open the simulator so you don't overwrite your partner's work. Run this in the repo folder:

```bash
./scripts/sync.sh pull
```

*This fetches the latest files from GitHub and overwrites your local game saves with them.*

### 2. Build in CRUMB

1. Open CRUMB and go to **Load Game**.
2. Select the circuit.
3. Make your wiring or logic changes.
4. Hit **Save** in the game menu.

### 3. Share your work

Once you have saved the circuit inside the game, push your updates back to GitHub.

```bash
./scripts/sync.sh push "Wired up the ALU adder module"
```

*This grabs the fresh save from your game folder, copies it to Git, and pushes it to the cloud for your partner to download.*
