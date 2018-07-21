bashrc="${HOME}/.bashrc"
bashrc_fix="${PWD}/wsl-mount-fix-bashrc.sh"

install() {
  local installed=$(grep -E '# >>>>> wsl-mount-fix >>>>> #' "${bashrc}")
  
  if [ -z "${installed}" ]; then
    # Install fix in .bashrc
    echo -e "\033[32;49m−→\033[39;49m\033[1m Installing WSL mount fix to .bashrc...\033[0m"
    cat "${bashrc_fix}" >> "${bashrc}"
  else
    # Update fix in .bashrc
    echo -e "\033[32;49m−→\033[39;49m\033[1m Updating WSL mount fix to .bashrc...\033[0m"
    sed -i '/# >>>>> wsl-mount-fix >>>>> #/,/# <<<<< wsl-mount-fix <<<<< #/d' "${bashrc}"
    cat "${bashrc_fix}" >> "${bashrc}"
  fi

  echo -e "\033[32;49m−→\033[39;49m\033[1m Reloading bash...\033[0m"
  exec bash
}

uninstall() {
  local installed=$(grep -E '# >>>>> wsl-mount-fix >>>>> #' "${bashrc}")
  
  if [ -z "${installed}" ]; then
    # Not installed
    echo -e "\033[31;49m !\033[39;49m\033[1m WSL mount fix is not installed in .bashrc...\033[0m"
  else
    # Uninstall fix in .bashrc
    echo -e "\033[32;49m−→\033[39;49m\033[1m Uninstalling WSL mount fix from .bashrc...\033[0m"
    sed -i '/# >>>>> wsl-mount-fix >>>>> #/,/# <<<<< wsl-mount-fix <<<<< #/d' "${bashrc}"
    
    echo -e "\033[32;49m−→\033[39;49m\033[1m Reloading bash...\033[0m" 
    exec bash
  fi
}

while [ $# -gt 0 ]; do
  case "$1" in
    --install*)
      install
      ;;
    --uninstall*)
      uninstall
      ;;
    *)
      echo "Use --install or --uninstall flag."
      ;;
  esac
  shift
done