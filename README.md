# README


## 1.1 构架全新的 raddit 专案
```
rails new raddit
cd raddit
git init
git add .
git commit -m "fitst commit"
git push origin master
```
## 1.2 构建 第一个 link_scaffold 分支
```
git checkout -b link_scaffold
rails g scaffold link title:string url:string
rake db:migrate
git add .
git commit -m "Generate link Scaffold"
git push origin link_scaffold
```
## 1.3 构建 第三个 add_user 分支
```
git checkout -b add_user
gem 'devise', '~> 4.4', '>= 4.4.1'
bundle install
rails g devise:install
rails g devise:views
rails g devise User
rake db:migrate
---
rails c
User.count
@user = User.first
exit
---
git add .
git commit -m "Add devise and user model"
git push origin add_user
```
