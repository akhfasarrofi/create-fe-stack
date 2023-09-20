#!/bin/bash

# Function untuk menampilkan teks dengan warna
color_text() {
  local text="$1"
  local color_code="$2"
  echo "\033[${color_code}m${text}\033[0m"
}

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
    echo "1. $(color_text 'Next Js' '32')"
    echo "2. $(color_text 'Vite' '34')"
    echo "3. $(color_text 'Vue' '36')"  # Menambahkan pilihan Vue.js
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
      echo "1. $(color_text 'Zustand' '34')"
      echo "2. $(color_text 'Redux' '31')"
      echo "3. $(color_text 'Jotai' '32')"
      echo "4. $(color_text 'Recoil' '33')"
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
      echo "1. $(color_text 'Vuex' '34')"
      echo "2. $(color_text 'Pinia' '31')"
      echo "3. $(color_text 'Mobx' '32')"
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
      echo "1. $(color_text 'Material UI' '31')"
      echo "2. $(color_text 'Ant Design' '32')"
      echo "3. $(color_text 'Chakra UI' '33')"
      echo "4. $(color_text 'Next UI' '34')"
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
      echo "1. $(color_text 'Vuetify' '34')"
      echo "2. $(color_text 'Bootstrap Vue' '31')"
      echo "3. $(color_text 'Element Plus' '32')"
      echo "4. $(color_text 'Ant Design' '33')"
      echo "5. $(color_text 'Chakra UI' '35')"
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
