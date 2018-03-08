# README


## 1.1构架全新的raddit专案
```
rails new raddit
cd raddit
git init
git add .
git commit -m "fitst commit"
git push origin master
```
## 1.2构建第一个分支
```
git checkout -b link_scaffold
rails g scaffold link title:string url:string
rake db:migrate
git add .
git commit -m "Generate link Scaffold"
git push origin link_scaffold
```
