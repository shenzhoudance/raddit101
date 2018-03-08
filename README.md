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

## 1.3 构建 第四个 add_navigation 分支（https://emmet.io/）

app/views/layouts/application.html.erb

```
<% if user_signed_in? -%>
     <ul>
       <li><%= link_to 'Submit link', new_link_path %></li>
       <li><%= link_to 'Account', edit_user_registration_path %></li>
       <li><%= link_to 'Sign out', destroy_user_session_path, :method => :delete %></li>
     </ul>
   <% else -%>
     <ul>
       <li><%= link_to 'Sign up', new_user_registration_path %></li>
       <li><%= link_to 'Sign in', new_user_session_path %></li>
     </ul>
   <% end -%>

<%= yield %>

```
## 1.4 构建 第五个 add_relation 分支
app/models/user.rb
```
has_many :links
```
app/models/link.rb
```
belong_to :user
```

```
rails c
@link = link.first
@link.user
reload
@link = link.first
exit
---
git add .
git commit -m "Add navigation and relation"
git push origin add_user
```
