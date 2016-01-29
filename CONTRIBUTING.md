# How to contribute

Thank you for your interest in contributing to Trenja.  Contributions
from the open source community are welcome.  This document contains a
few guidelines for contributors to follow so that I can have a chance
of keeping on top of things.

## Getting Started

* Make sure you have a [GitHub account](https://github.com/signup/free)
* Create a Github issue describing your contribution, assuming one does not already exist.
  * Clearly describe the issue including steps to reproduce when it is a bug.
* Fork the repository on GitHub.

## Making Changes

* Create a branch from where you want to base your work.
  * This is usually the master branch.
  * To quickly create a topic branch based on master; `git checkout -b
    fix/master/my_contribution master`. Please avoid working directly on the
    `master` branch.
* Make commits of logical units.
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure you have added the necessary tests for your changes.
* Run _all_ the tests to assure nothing else was accidentally broken.

## Submitting Changes

* Push your changes to a branch in your fork of the repository.
* Submit a pull request to the repository under the conorliv Github account.
* Mention @conorliv in your pull request and provide a brief summary of changes.


A big thanks to puppetlab's [CONTRIBUTING.md](https://github.com/puppetlabs/puppet/blob/master/CONTRIBUTING.md)
file, which served as a model for me in writing these contribution guidelines.
