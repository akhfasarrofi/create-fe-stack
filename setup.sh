#!/bin/bash

# Front-End Setup Script for Speed
# (c) Sept 2023, Akhfas zakaria_akhfas@outlook.co.id

check_nodejs() {
  if command -v node >/dev/null 2>&1; then
    echo "Node.js is already installed."
  else
    echo "Node.js is not installed. Please install Node.js before running this script."
    exit 1
  fi
}

framework_chosen=false
install_state_management=false
install_component_library=false

sigint_handler() {
  echo "Exiting..."
  exit 1
}

trap sigint_handler SIGINT

choose_framework() {
  while true; do
    echo "Choose framework:"
    echo "1. Vite"
    echo "2. Gatsby"
    echo "3. Remix"
    echo "4. Next"
    echo "5. Vue"
    echo "6. Nuxt"
    read -p "Enter option (1/2/3/4/5/6): " framework_choice

    case $framework_choice in
      1) framework_name="vite";;
      2) framework_name="gatsby";;
      3) framework_name="remix";;
      4) framework_name="next";;
      5) framework_name="vue";;
      6) framework_name="nuxt";;
      *) echo "Invalid selection ❌. Please choose 1/2/3/4/5/6"; continue;;
    esac

    read -p "Enter project name: " project_name
    mkdir "$project_name"
    cd "$project_name"
    npx create "$framework_name@latest" .

    framework_chosen=true
    npm install axios

    if [ "$framework_name" == "vue" ] || [ "$framework_name" == "nuxt" ]; then
      npm install vue-query
    else
      npm install react-query
    fi

    break
  done
}

choose_state_management() {
  if [ "$framework_chosen" = true ]; then
    if [ "$framework_name" == "vue" ] || [ "$framework_name" == "nuxt" ]; then
      echo "Choose State Management for Vue.js:"
      echo "1. Vuex"
      echo "2. Pinia"
      echo "3. Mobx"
    else
      echo "Choose State Management:"
      echo "1. Zustand"
      echo "2. Redux"
      echo "3. Jotai"
      echo "4. Recoil"
    fi

    read -p "Enter option (1/2/3/4): " state_management_choice

    case $state_management_choice in
      1|2|3|4) install_state_management=true;;
      *) echo "Invalid selection ❌. Please choose 1/2/3/4";;
    esac
  else
    echo "No state management options available for this framework."
  fi
}

choose_component_library() {
  if [ "$framework_chosen" = true ]; then
    if [ "$framework_name" == "vue" ] || [ "$framework_name" == "nuxt" ]; then
      echo "Choose Component Library for Vue.js:"
      echo "1. Vuetify"
      echo "2. Bootstrap Vue"
      echo "3. Element Plus"
      echo "4. Ant Design"
      echo "5. Chakra UI"
    else
      echo "Choose Component Library:"
      echo "1. Material UI"
      echo "2. Ant Design"
      echo "3. Chakra UI"
      echo "4. Next UI"
    fi

    read -p "Enter option (1/2/3/4/5): " component_library_choice

    case $component_library_choice in
      1|2|3|4|5) install_component_library=true;;
      *) echo "Invalid selection ❌. Please choose 1/2/3/4/5";;
    esac
  else
    echo "No component library options available for this framework."
  fi
}

install_dependencies() {
  if [ "$install_state_management" = true ]; then
    echo "Installing selected state management..."
    case $state_management_choice in
      1) npm install zustand;;
      2) npm install redux;;
      3) npm install jotai;;
      4) npm install recoil;;
    esac
  fi

  if [ "$install_component_library" = true ]; then
    echo "Installing selected component library..."
    case $component_library_choice in
      1) npm install vuetify;;
      2) npm install bootstrap-vue;;
      3) npm install element-plus;;
      4) npm install ant-design-vue;;
      5) npm install chakra-ui-vue;;
    esac
  fi
}

choose_framework
choose_state_management
choose_component_library

if [ "$install_state_management" = true ] || [ "$install_component_library" = true ]; then
  read -p "Do you want to install selected state management and component library? (y/n): " install_confirmation
  if [ "$install_confirmation" = "y" ]; then
    install_dependencies
    echo "Installation completed."
  else
    echo "Installation aborted."
  fi
fi
