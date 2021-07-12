<br />
<p align="center">
  <h3 align="center">Marvel Service</h3>
</p>

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [Built With](#built-with)
  - [Style guide used for the code](#style-guide-used-for-the-code)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Run tests](#run-tests)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Contact and authors](#contact-and-authors)

## About The Project

Soon

### Built With

_This section should list **any major frameworks** that you built your project using. Here are a few examples._

- [Elixir](https://elixir-lang.org/) **1.10.2**
- [Erlang/OTP](https://www.erlang.org/) **22.2**
- [Phoenix](https://www.phoenixframework.org/) **1.5**
- [Ecto](https://hexdocs.pm/ecto/getting-started.html) **3.4**
- [Postgresql](https://www.postgresql.org/) **11.6**

### Style guide used for the code

- [mix format](https://hexdocs.pm/mix/master/Mix.Tasks.Format.html)
- [Credo](https://github.com/rrrene/credo)

## Getting Started

### Prerequisites

- [Elixir](https://elixir-lang.org/) **1.10.2**
- [Erlang/OTP](https://www.erlang.org/) **22.2**
- [Postgresql](https://www.postgresql.org/) **11.6**

### Installation

1. Clone the repo

```sh
git@github.com:gestionix/gx-boa-ms-business-management.git
```

2. Install phoenix packages

```sh
mix deps.get
```

3. Fill .envars
```sh 
cp .env.sample .env && vim .env
```

4. Load envvars

```sh
source .env
```

4. Setup db and migrations with

```sh
mix ecto.setup
```

5. Run project with

```sh
mix phx.server
```

## Run tests

```sh
mix test
```

## Roadmap

See the [open issues](https://gestionixpm.atlassian.net/jira) for a list of proposed features (and known issues).

## Contributing

Please read [our guide](https://github.com/gestionix/gx-docs/blob/master/standars/git_flow_and_git_guidelines.md).

## Contact and authors

- Yocelin Garcia


