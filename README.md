<!-- <p align="center"> 
    <img src="https://storage.googleapis.com/komerce/core/new-brand.svg" align="center" height="150"></img>
</p>

<h1 align="center"> Mitra Komerce 🚀 </h1> 
<h3 align="center"> This repository for mitra expedition  and mitra warehouse Komerce. A clean commit and easy to write code<br /> Build with love ❤️ </h3>

<p align="center">
  <a href="https://www.npmjs.com/package/pnpm/v/6.35.1"><img alt="NPM" src="https://img.shields.io/badge/pnpm-7.13.4-yellow/v/:modName?style=plastic&logo=pnpm" /></a>
  <a href="https://vitejs.dev/guide/"><img alt="Made With Vite" src="https://img.shields.io/badge/made%20with-vite--ts-blue?style=plastic&logo=vite" /></a>
  <a href="https://mui.com/material-ui/"><img alt="MUI" src="https://img.shields.io/badge/component-MUI-blue?style=plastic&logo=mui" /></a>
  <a href="https://typicode.github.io/husky/#/"><img alt="pre-commit" src="https://img.shields.io/badge/clean-.husky-white?style=plastic" /></a>
</p>

# Project structure and description ✏️

- [x] `public/`           # Translation Files
   - [x] `id`             # Indonesian (id) translation files
   - [x] `en`             # English (en) translation files
- [x] `src/`               # Source Code Root
   - [x] `components/`      # Reusable components for global use
      - [x] `index.ts`       # Export all components
   - [x] `constants/`       # Constants and global variable configurations
  - [x] `features/`        # Features or page-specific components and logic
  - [x] `auth/`          # Authentication feature
  - [x] `home/`          # Home feature
     - [x] `komship/`     # Komship sub-feature
        - [ ] `menu1/`      # Menu 1 for Komship
           - [x] `index.jsx`  # Main component file
           - [x] `service.ts` # API service file
           - [ ] `components/` # Sub-components folder (if needed)
           - [ ] `style.ts` # styling menu (if needed)
     - [x] `kompack/`     # Kompack sub-feature
        - [ ] `menu1/`      # Menu 1 for Kompack
           - [x] `index.jsx`  # Main component file
           - [x] `service.ts` # API service file
           - [ ] `components/` # Sub-components folder (if needed)
           - [ ] `style.ts` # styling menu (if needed)

   - [x] `helper/`          # Helper functions and utilities for request data and API endpoints
   - [x] `hooks/`           # Custom React hooks
   - [x] `layout/`          # Layout components for consistent page structures
   - [x] `store/`           # State management using Zustand (initialized with the use... prefix)
   - [x] `theme/`           # Material-UI theme injection and override
  - [x] `types/`           # Data type definitions and TypeScript types
  - [x] `store/`         # Types related to state management
     - [ ] `auth/`  # Types for authentication store
     - [ ] `komship/` # Types for Komship sub-feature store
     - [ ] `kompack/` # Types for Kompack sub-feature store
     - [x] `component`      # Types related to components
     - [x] `general`        # General data types
   - [x] `utils/`           # Global utility functions

# Rules and Source Contribution Guidelines 📝

- **Documentation**: All project documentation is maintained in the [project's wiki](https://internal.komerce.id).
- **Language**: All code must be written in **[TypeScript](https://www.typescriptlang.org/)**.
- **Code Quality**: Ensure that the code is clean, well-organized, and easy to read.
- **Naming Conventions**: Follow these naming conventions:
   - Use `camelCase` for files.
   - Use `lowercase` for folder names.
- **Data Types**: Never use the `any` data type unless it's necessary, such as when you don't know the variable's data type or when the data type is dynamic.
- **Creating New Pages**:
   1. If you are creating a feature for `komship`, create a folder in `src/features/home/komship`. If it's for `kompack`, create a folder in `src/features/home/kompack`.
   2. Open the `routes.tsx` file and add a new route for your page. Here's an example:
      ```tsx
      {
        // komship
        { 
          path: "expedition", 
          element: <Komship />; 
        },
        
        // kompack
        { 
          path: "warehouse", 
          element: <Kompack />; 
        },
      }
      ```
      Add routing to the code above by adjusting it according to the features you created. If the feature has child routes, add them as needed (e.g., `path: 'expedition/:id'`).
   3. Don't forget to add data types to the `types` folder. The `general.tsx` file should contain data types that can be used throughout the project.

These guidelines are meant to maintain code quality, consistency, and documentation for the project.


# Teknologi 🛠️

- **React-Query**: A powerful library for managing and synchronizing server state in your React applications. It simplifies data fetching and caching.
   - [Learn more about React-Query](https://tanstack.com/query/v3/)

- **Material-UI**: A popular React UI framework that provides a set of pre-designed, customizable components for building user interfaces.
   - [Explore Material-UI](https://mui.com/material-ui/)

- **Vite**: A fast, minimalist build tool for modern web development. It's designed to be lightning-fast and highly efficient.
   - [Discover Vite](https://vitejs.dev/guide/)

- **Husky**: A tool that enables you to easily add and configure Git hooks in your project. It's useful for automating tasks like code linting and testing before committing.
   - [Learn about Husky](https://typicode.github.io/husky/#/)

These technologies are key components of our project, each serving a specific purpose in making our development process efficient and our application robust.
 -->

## Stack Front-End Quick Setup Script
This is a Bash script that simplifies the process of creating a front-end project with various framework, state management, and component library options. The script allows users to quickly and easily set up a front-end project with their preferred stack. You can download the script from GitHub using wget with the following URL: https://raw.githubusercontent.com/akhfasarrofi/create-fe-stack/main/setup.sh.

## How to Use the Script
1. Download the script using wget:
```bash
wget https://raw.githubusercontent.com/akhfasarrofi/create-fe-stack/main/setup.sh
```
2. Provide execute permission to the script:
```bash
chmod +x setup.sh
```
3. Run the script:
```bash
./setup.sh
```
Follow the on-screen instructions to create your front-end project according to your preferences.

## Quick Overview
 - Framework Selection: The script allows you to choose a front-end framework such as Next.js, Vite, or Vue.js.
 - State Management (Only for Next.js and Vue.js): If you choose Next.js or Vue.js, you can select state management options like Zustand, Redux, Jotai (for Next.js), or Vuex, Pinia, Mobx (for Vue.js).
 - Component Library (Only for Next.js and Vue.js): If you choose Next.js or Vue.js, you can select component libraries like Material-UI, Ant-Design, Chakra-UI, Next-UI (for Next.js), or Vuetify, Bootstrap Vue, Element Plus, Ant Design, Chakra UI (for Vue.js).
 - Project Structure: After selecting your preferences, the script will create a project directory with the name you specify and install all the required dependencies.
