# WSL Workarounds
Various tricks and workarounds for WSL (Windows Subsystem for Linux).

## Table of content
1. [WSL says it's not installed on first launch](#WSL-says-it-is-not-installed-on-first-launch)
1. [Issues with npm install](#Issues-with-npm-install)

## Workarounds

### WSL says it is not installed on first launch
This is an issue related to the window service called lxssmanager and is resolved by restarting it. 

Run ```lxssmanager-restart.bat``` as administrator.

**Tips:** Create a shortcut to lxssmanager-restart.bat
1. Right-click lxssmanager-restart.bat > Send to > Desktop (move it anywhere you like later).
1. Right-click lxssmanager-restart shortcut (Desktop) > Properties.
1. Click **Advanced...** button.
1. Check **Run as administrator**.
1. Click **OK**.
1. Select the **Shortcut key** field. _(optional)_
1. Assign the desired shortcut. _(optional)_
1. Click **OK**.

[Back to top](#table-of-content)

---

### Issues with npm install
This is usually a issue related to the mounting of Windows C:\ drive to /mnt/c path. This can be resolved by appending a script to .bashrc (ran on every bash session) to re-mount the C:\ drive when needed.

#### Install
1. Open Bash on Windows.
1. Run:
    ```bash 
    cd /path/to/wsl-workarounds
    ```
1. Run: 
    ```bash 
    bash wsl-mount-fix.sh --install
    ```

#### Uninstall
1. Run: 
    ```bash 
    bash wsl-mount-fix.sh --uninstall
    ```

[Back to top](#table-of-content)

---