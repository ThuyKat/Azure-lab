# Azure-lab

1. Question and answer lab
![alt text](qna.png)

#  submodules command
- add a submodule:
```bash
git submodule add <url> name_of_sub_module
```
- clone a submodule:
```bash
git clone --recurse-submodules
```
- turn a submodule to a normal files so its content showup on git
```bash
rm -rf .gitmodules
rm -rf .git/config
rm -rf module-name/.git
```
then add, commit, push like normal