#!/bin/bash

# Front-End Setup Script for Speed
# (c) Sept 2023, Akhfas zakaria_akhfas@outlook.co.id

# Fungsi untuk memeriksa apakah Node.js sudah terinstal
check_nodejs() {
  if command -v node >/dev/null 2>&1; then
    echo "Node.js is already installed."
  else
    echo "Node.js is not installed. Please install Node.js before running this script."
    exit 1
  fi
}

# Memanggil fungsi untuk memeriksa Node.js
check_nodejs


framework_choice=""
framework_chosen=false
state_management_choice=""
component_library_choice=""
install_state_management=false
install_component_library=false

# Fungsi untuk menangani sinyal SIGINT (Ctrl+C)
sigint_handler() {
  echo "Exiting..."
  exit 1
}

trap sigint_handler SIGINT

# Fungsi untuk memilih framework
choose_framework() {
  while true; do
    echo "Choose framework:"
    echo "1. Next Js"
    echo "2. Vite"
    echo "3. Vue"  # Menambahkan pilihas
    read -p "Enter option (1/2/3): " framework_choice

    case $framework_choice in
      1)
        # Menggunakan Next Js
        read -p "Enter project name: " project_name
        mkdir "$project_name"   # Buat direktori proyek
        cd "$project_name"     # Pindah ke direktori proyek yang baru dibuat
        npx create-next-app@latest .  # Menggunakan titik (.) untuk menginstall di direktori saat ini
        framework_chosen=true  # Menandakan bahwa framework telah dipilih
        npm install axios react-query
        break
        ;;
      2)
        # Menggunakan Vite
        read -p "Enter project name: " project_name
        mkdir "$project_name"   # Buat direktori proyek
        cd "$project_name"     # Pindah ke direktori proyek yang baru dibuat
        npm create vite@latest .   # Menggunakan titik (.) untuk menginstall di direktori saat ini
        framework_chosen=true  # Menandakan bahwa framework telah dipilih
        break
        ;;
      3)
        # Menggunakan Vue.js
        read -p "Enter project name: " project_name
        mkdir "$project_name"   # Buat direktori proyek
        cd "$project_name"     # Pindah ke direktori proyek yang baru dibuat
        npm create vue@latest .   # Menggunakan titik (.) untuk menginstall di direktori saat ini
        framework_chosen=true  # Menandakan bahwa framework telah dipilih
        npm install axios vue-query
        break
        ;;
      *)
        echo "Invalid selection ❌. Please choose 1/2/3"
        ;;
    esac
  done
}

# Fungsi untuk memilih state management hanya jika framework adalah Next Js
choose_state_management_nextjs() {
  if [ "$framework_choice" == "1" ]; then
    while true; do
      echo "Choose State Management for Next Js:"
      echo "1. Zustand"
      echo "2. Redux"
      echo "3. Jotai"
      echo "4. Recoil"
      read -p "Enter option (1/2/3/4): " state_management_choice

      case $state_management_choice in
        1)
          # Menggunakan Zustand
          install_state_management=true
          break
          ;;
        2)
          # Menggunakan Redux
          install_state_management=true
          break
          ;;
        3)
          # Menggunakan Jotai
          install_state_management=true
          break
          ;;
        4)
          # Menggunakan Recoil
          install_state_management=true
          break
          ;;
        *)
          echo "Invalid selection ❌. Please choose 1/2/3/4"
          ;;
      esac
    done
  else
    echo "No state management options available for this framework."
  fi
}

# Fungsi untuk memilih state management hanya jika framework adalah Vue.js
choose_state_management_vuejs() {
  if [ "$framework_choice" == "3" ]; then
    while true; do
      echo "Choose State Management for Vue.js:"
      echo "1. Vuex"
      echo "2. Pinia"
      echo "3. Mobx"
      read -p "Enter option (1/2/3): " state_management_choice

      case $state_management_choice in
        1)
          # Menggunakan Vuex
          install_state_management=true
          break
          ;;
        2)
          # Menggunakan Pinia
          install_state_management=true
          break
          ;;
        3)
          # Menggunakan Mobx
          install_state_management=true
          break
          ;;
        *)
          echo "Invalid selection ❌. Please choose 1/2/3"
          ;;
      esac
    done
  else
    echo "No state management options available for this framework."
  fi
}

# Fungsi untuk memilih component library hanya jika framework adalah Next.js
choose_component_library_nextjs() {
  if [ "$framework_choice" == "1" ]; then
    while true; do
      echo "Choose Component Library for Next.js:"
      echo "1. Material UI"
      echo "2. Ant Design"
      echo "3. Chakra UI"
      echo "4. Next UI"
      read -p "Enter option (1/2): " component_library_choice

      case $component_library_choice in
        1)
          # Menggunakan Material UI
          install_component_library=true
          break
          ;;
        2)
          # Menggunakan Antd
          install_component_library=true
          break
          ;;
        3)
          # Menggunakan Chakra UI
          install_component_library=true
          break
          ;;
        4)
          # Menggunakan Next UI
          install_component_library=true
          break
          ;;
        *)
          echo "Invalid selection ❌. Please choose 1/2"
          ;;
      esac
    done
  else
    echo "No component library options available for this framework."
  fi
}

# Fungsi untuk memilih component library hanya jika framework adalah Vue.js
choose_component_library_vuejs() {
  if [ "$framework_choice" == "3" ]; then
    while true; do
      echo "Choose Component Library for Vue.js:"
      echo "1. Vuetify"
      echo "2. Bootstrap Vue"
      echo "3. Element Plus"
      echo "4. Ant Design"
      echo "5. Chakra UI"
      read -p "Enter option (1/2/3/4/5): " component_library_choice

      case $component_library_choice in
        1)
          # Menggunakan Vuetify
          install_component_library=true
          break
          ;;
        2)
          # Menggunakan Bootstrap Vue
          install_component_library=true
          break
          ;;
        3)
          # Menggunakan Element Plus
          install_component_library=true
          break
          ;;
        4)
          # Menggunakan Ant Design
          install_component_library=true
          break
          ;;
        5)
          # Menggunakan Chakra UI
          install_component_library=true
          break
          ;;
        *)
          echo "Invalid selection ❌. Please choose 1/2/3/4/5"
          ;;
      esac
    done
  else
    echo "No component library options available for this framework."
  fi
}

# Memilih framework
choose_framework

# Memilih state management (jika diperlukan)
if [ "$framework_choice" == "1" ]; then
  choose_state_management_nextjs
elif [ "$framework_choice" == "3" ]; then
  choose_state_management_vuejs
fi

# Memilih komponen library (jika diperlukan)
if [ "$framework_choice" == "1" ]; then
  choose_component_library_nextjs
elif [ "$framework_choice" == "3" ]; then
  choose_component_library_vuejs
fi

# Meminta konfirmasi pengguna untuk instalasi
if [ "$install_state_management" == "true" ] || [ "$install_component_library" == "true" ]; then
  read -p "Do you want to install selected state management and component library? (y/n): " install_confirmation
  if [ "$install_confirmation" == "y" ]; then
    if [ "$install_state_management" == "true" ]; then
      # Install state management
      echo "Installing selected state management..."
      if [ "$framework_choice" == "1" ]; then
        # Install state management untuk Next Js (contoh: install Zustand)
        npm install zustand
      elif [ "$framework_choice" == "3" ]; then
        # Install state management untuk Vue.js (contoh: install Vuex)
        npm install vuex
      fi
    fi

    if [ "$install_component_library" == "true" ]; then
      # Install component library
      echo "Installing selected component library..."
      if [ "$framework_choice" == "1" ]; then
        # Install component library untuk Vue.js
        case $component_library_choice in
          1)
            npm install @mui/material @mui/icons-material
            ;;
          2)
            npm install ant-design
            ;;
          3)
            npm install @chakra-ui/react @emotion/react @emotion/styled framer-motion
            ;;
          4)
            npm install @nextui-org/react framer-motion
            ;;
        esac
      elif [ "$framework_choice" == "3" ]; then
        # Install component library untuk Next.js
        case $component_library_choice in
          1)
            npm install vuetify
            ;;
          2)
            npm install bootstrap-vue
            ;;
          3)
            npm install element-plus
            ;;
          4)
            npm install ant-design-vue
            ;;
          5)
            npm install chakra-ui-vue
            ;;
        esac
      fi
    fi

    echo "Installation completed."
  else
    echo "Installation aborted."
  fi
fi
