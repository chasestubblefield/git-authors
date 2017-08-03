[![Build Status](https://travis-ci.org/chasetopher/git-authors.svg?branch=master)](https://travis-ci.org/chasetopher/git-authors)

# git-authors

This git plugin allows you to create "profiles" with a name/email and easily switch between profiles.
It also has a concept of "organization profiles" which contain several names and a base email, allowing you to include any number of authors on a commit. (Useful for pairing!)

Configuration is easy and lives in the `gitconfig` of your choice.

## Install

```bash
gem install git-authors
```

## Usage

### Using personal profiles:

Let's create two profiles in our `~/.gitconfig`:

```
[git-authors "personal"]
  name = Bill Murray
  email = billmurray@gmail.com
[git-authors "example"]
  name = Bill Murray
  email = bill@example.org
```

Now we can switch between the profiles easily:

```bash
$ git authors personal
Bill Murray (set in ~/.gitconfig)
billmurray@gmail.com (set in ~/.gitconfig)
$ git authors example
Bill Murray (set in ~/.gitconfig)
bill@example.org (set in ~/.gitconfig)
```
