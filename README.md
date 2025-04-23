# Strapi Project Setup

## Task Overview
This project demonstrates the setup of a Strapi application using the recommended approach. The goal is to set up Strapi locally, explore its folder structure, create a sample content type, and push the setup to GitHub.

## Steps Taken

### 1. Setup Strapi Project Locally
To quickly get a Strapi project running, I used the following command to create and start the project:


npx create-strapi-app my-strapi-app --quickstart


This command:
- Creates a new Strapi project named `my-strapi-app`.
- Installs the necessary dependencies.
- Starts the Strapi application in development mode with the admin panel running on `http://localhost:1337`.

### 2. Explore Folder Structure
After the project was created, I explored the folder structure to understand the components of the application:

- `api/`: Contains the models and controllers for content types.
- `config/`: Contains configuration files for the application.
- `node_modules/`: Standard node modules directory where dependencies are installed.
- `public/`: The public directory for serving static files.
- `package.json`: Contains the metadata and dependencies for the Strapi application.

### 3. Create a Sample Content Type
I used the Strapi admin panel to create a sample content type. The steps were as follows:
1. Opened the admin panel at `http://localhost:1337/admin`.
2. Logged in using the provided credentials.
3. Created a new content type named "Article" with the following fields:
   - Title (Text)
   - Content (Rich Text)

This content type is now available to be managed via the Strapi admin panel.

### 4. Push to GitHub
Once the setup was completed and tested locally, I initialized a Git repository, added all files, and pushed the setup to GitHub.


git init
git add .
git commit -m "Initial commit: Strapi project setup"
git remote add origin <https://github.com/PearlThoughts-DevOps-Internship/strapi--Monitor-hub.git>
git push -u origin master


### 7. Documenting the Process
I have documented the steps I followed in this README file for reference.

## Conclusion
This task involved setting up Strapi locally, exploring its structure, creating a sample content type, and pushing the setup to GitHub. The process was simple using the `npx create-strapi-app` command and the Strapi admin panel.
