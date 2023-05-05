<a name="readme-top"></a>

<div align="center">

  <h1><b>🤖 CatalogueMe 🤖</b></h1>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 CATALOGUEME <a name="about-project"></a>

In this group project, we create a console app that helps to keep a record of different types of things. <br>
Our things are books, music albums, movies, and games. <br> 
They are inherint from the Item class. <br>
The Item class has an association one to many with Genre, Author, Label, and Source. <br>
Everything is based on a UML class diagram below. <br>
In this project, all the data is stored in JSON files. <br>
We will also prepare a database with tables structure analogical to the program's class structure. <br>
For each method, we create a related unit test to it using Rspec.

![catalog_of_my_things](https://user-images.githubusercontent.com/10439283/236437047-0f1ff120-20cd-4019-9828-24ab5f92e3b4.png)

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/">Ruby</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>Testing Framework</summary>
  <ul>
    <li><a href="https://rspec.info/">RSpec</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Book, Music Album, Movie, and Game inherit Item class**
- **Ability to add a book**
- **Ability to list all books**
- **Ability to add a music album**
- **Ability to list all music albums**
- **Ability to add a game**
- **Ability to list all games**
- **Ability to set author to Item**
- **Ability to set genre to Item**
- **Ability to set label to Item**
- **Ability to list all authors (e.g. 'Stephen King')**
- **Ability to list all genres (e.g 'Comedy', 'Thriller')**
- **Ability to list all labels (e.g. 'Gift', 'New')**
- **Ability to write on JSON file**
- **Ability to read from JSON file**
- **Have a schema.sql to create database analogical to the program's structure**
- **Have unit test for each method**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps:

### Prerequisites

In order to run this project you need:

  - Terminal to run the _irb_ console

### Setup

Clone this repository to your desired folder:

Example commands:

```sh
  cd my-folder
  git clone git@github.com:Marcraphael12/Catalog-of-my-things.git
  ```

### Install

Install this project with:

Example command:

```sh
  cd Catalog-of-my-things
  bundle install
  ```
  
### Usage

  Example command:

```sh
  ruby main.rb
  ```
### Run tests
  Example command:

```sh
  rspec spec
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

🦄 **Clarielle Larissa**

- GitHub: [@rica213](https://github.com/rica213)
- Twitter: [@alc3and](https://twitter.com/alc3and)
- LinkedIn: [Larissa Clarielle](https://linkedin.com/in/larissa-clarielle)

😶‍🌫️ **Marc Raphael**

- GitHub: [@Marcraphael12](https://github.com/Marcraphael12)
- Twitter: [@Marcraphael20](https://twitter.com/MarcRaphael20)
- LinkedIn: [Marc raphael](http://www.linkedin.com/in/marc-raphael-326039204)

🤠 **Christian Hakizimana**

- GitHub: [@hakichris](https://github.com/hakichris)
- Twitter: [@hakichris2](https://twitter.com/hakichris2)
- LinkedIn: [Christian Hakizimana](https://linkedin.com/in/hakichris)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Add a movie]**
- [ ] **[List all movies]**
- [ ] **[Set sources to Item]**
- [ ] **[List all sources (e.g. 'From a friend', 'Online shop')]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project kindly give it a ⭐️ *STAR* ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank: 
  - Microverse
  - Code Reviewers

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
