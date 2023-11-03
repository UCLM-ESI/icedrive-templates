# IceDrive templates repository

This repository contains the project template for the 3 services proposed as laboratory work for the students
of Distributed Systems in the course 2023-2024.

Please, remember to follow the instructions above in order to get a working copy of the needed template.
Don't hesitate to ask in the forums in Campus Virtual if you find any trouble.

# Instructions

## Common instructions

1. Go to https://github.com/new to create a new repository in GitHub. Remember that it needs to be **private**
   in order to avoid disallowed copies of your work.

1. Pick the following options:
   - Repository template: No template
   - Owner: choose your user (if you are part of an organization, it's ok to use that one too).
   - Repository name: your choice.
   - Select **Private**.
   - Add a README file: **unchecked**
   - Add .gitignore: None

1. Clone the repository in your computer (remember to use the proper URL for your repository):

   ```bash
   git clone git@github.com:USERNAME/REPOSITORY.git
   ```

1. Change the directory to your repository one with `cd REPOSITORY`.
1. Add the repository that you are reading right now as a new remote and update its references:

   ```bash
   git remote add templates git@github.com:UCLM-ESI/icedrive-templates.git && git fetch templates
   ```

## Authentication service

1. Checkout the `authentication` branch with `git checkout authentication`.
1. Push the branch content to your `main` branch with `git push origin authentication:main`
1. Checkout the `main` branch from your remote repository:

   ```bash
   git checkout --track origin/main
   ```

1. Remove the `authentication` branch: `git branch -d authentication`
1. Remove the `templates` remote: `git remote rm templates`

## Directory service

1. Checkout the `directory` branch with `git checkout directory`.
1. Push the branch content to your `main` branch with `git push origin directory:main`
1. Checkout the `main` branch from your remote repository:

   ```bash
   git checkout --track origin/main
   ```

1. Remove the `directory` branch: `git branch -d directory`
1. Remove the `templates` remote: `git remote rm templates`

## Blog service

1. Checkout the `blob` branch with `git checkout blob`.
1. Push the branch content to your `main` branch with `git push origin blob:main`
1. Checkout the `main` branch from your remote repository:

   ```bash
   git checkout --track origin/main
   ```

1. Remove the `blob` branch: `git branch -d blob`
1. Remove the `templates` remote: `git remote rm templates`
