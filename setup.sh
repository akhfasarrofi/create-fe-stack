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
          npm install zustand
          break
          ;;
        2)
          # Menggunakan Redux
          npm install redux react-redux
          break
          ;;
        3)
          # Menggunakan Jotai
          npm install jotai
          break
          ;;
        4)
          # Menggunakan Recoil
          npm install recoil
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
          npm install vuex
          break
          ;;
        2)
          # Menggunakan Pinia
          npm install pinia
          break
          ;;
        3)
          # Menggunakan Mobx
          npm install mobx
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
          npm install vuetify
          break
          ;;
        2)
          # Menggunakan Bootstrap Vue
          npm install bootstrap-vue
          break
          ;;
        3)
          # Menggunakan Element Plus
          npm install element-plus
          break
          ;;
        4)
          # Menggunakan Ant Design
          npm install ant-design-vue
          break
          ;;
        5)
          # Menggunakan Chakra UI
          npm install @chakra-ui/react @emotion/react @emotion/styled framer-motion
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

# Fungsi untuk memilih component library hanya jika framework adalah Next Js
choose_component_library_nextjs() {
  if [ "$framework_choice" == "1" ]; then
    while true; do
      echo "Choose Component Library for Next Js:"
      echo "1. $(color_text 'Material-UI' '34')"
      echo "2. $(color_text 'Ant-Design' '31')"
      echo "3. $(color_text 'Chakra-UI' '32')"
      echo "4. $(color_text 'Next-UI' '33')"
      read -p "Enter option (1/2/3/4): " component_library_choice

      case $component_library_choice in
        1)
          # Menggunakan Material-UI
          npm install @mui/material @mui/icons-material
          break
          ;;
        2)
          # Menggunakan Ant-Design
          npm install ant-design
          break
          ;;
        3)
          # Menggunakan Chakra-UI
          npm install @chakra-ui/react @emotion/react @emotion/styled framer-motion
          break
          ;;
        4)
          # Menggunakan Next-UI
          npm install next-ui
          break
          ;;
        *)
          echo "Invalid selection ❌. Please choose 1/2/3/4"
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

# Memilih komponen library
if [ "$framework_choice" == "1" ] || [ "$framework_choice" == "3" ]; then
  choose_component_library_vuejs
elif [ "$framework_choice" == "2" ]; then
  echo "No state management or component library options available for Vite."
fi
