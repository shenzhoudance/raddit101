# README


## 1.1 构架第一个 全新的 raddit 专案
```
rails new raddit
cd raddit
git init
git add .
git commit -m "fitst commit"
git push origin master
```
## 1.2 构建 第二个 link_scaffold 分支
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

## 1.4 构建 第四个 add_navigation 分支（https://emmet.io/）

git checkout -b add_navigation

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
添加用户关系

app/models/user.rb
```
has_many :links
```
app/models/link.rb
```
belongs_to :user
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
git push origin add_navigation
```

## 1.5 构建 第五个 add_user_relation_links 分支
http://dmy-blog.logdown.com/archives
https://stackoverflow.com/questions/23319155/what-does-this-code-do-i-do-not-understand-the-syntax
為你自己學 Ruby on Rails(電子書)
https://books.google.com.hk/books?id=AVE6DwAAQBAJ&pg=PA280&lpg=PA280&dq=User+must+exist&source=bl&ots=g3NVCXCcEW&sig=uc8KSC0bko-rphhpGl5NRFKwvLs&hl=zh-CN&sa=X&ved=0ahUKEwjV2-GJgd3ZAhUB5LwKHUQECgYQ6AEIVzAF#v=onepage&q=User%20must%20exist&f=false
```
rails g migration add_user_id_to_links user_id integer:index
rake db:migrate
---
rails c
link
link.connection
link
---
git add .
git commit -m "Add assoctation between link and user"
git push origin add_user_relation_links

```
app/controllers/links_controller.rb
```
before_action :authenticate_user!, except: [:index, :show]

def new
  @link = current_user.links.build
end

def create
  @link = current_user.links.build(link_params)
---
rails c
@link = link.first
@user = User.first
exit
---
rails c
@link = link.last
@link = user
@link = user.email
exit

```
app/views/links/index.html.erb
```
<tr>
  <td><%= link.title %></td>
  <td><%= link.url %></td>
  <td><%= link_to 'Show', link %></td>
  <% if link.user == current_user %>
  <td><%= link_to 'Edit', edit_link_path(link) %></td>
  <td><%= link_to 'Destroy', link, method: :delete, data: { confirm: 'Are you sure?' } %></td>
  <% end %>
</tr>
---
rails c
@link= link.last
@link.user
@link.user.email
@user = User.first
@link =link.first
@link
@link = link.find(2)
@link.user = user.first
@link.save
@link= link.first
@link.user = User.first
@link.save
---
删除 app/views/links/index.html.erb

<br>

 <%= link_to 'New Link', new_link_path %>
---
git add .
git commit -m "Authenticate on link"
git push origin add_user_relation_links

```
## 1.6 构建 第六个 add_bootstrap 分支
```
git checkout -b add_bootstrap
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
bundle install
```
---
app/assets/stylesheets/application.css
改为
app/assets/stylesheets/application.scss
---
app/assets/stylesheets/application.scss
添加
@import "bootstrap-sprockets";
@import "bootstrap";
---
app/assets/javascripts/application.js
+ //= require bootstrap-sprockets
//= require_tree .
---
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
```
修改为：
```
<header class="navbar navbar-default" role="navigation">
  <div class="navbar-inner">
    <div class="container">
      <div id="logo" class="navbar-brand"><%= link_to "Raddit", root_path %></div>
      <nav class="collapse navbar-collapse navbar-ex1-collapse">
        <% if user_signed_in? -%>
          <ul class="nav navbar-nav navbar-right">
            <li><%= link_to 'Submit link', new_link_path %></li>
            <li><%= link_to 'Account', edit_user_registration_path %></li>
            <li><%= link_to 'Sign out', destroy_user_session_path, :method => :delete %></li>
          </ul>
        <% else -%>
          <ul class="nav navbar-nav pull-right">
            <li><%= link_to 'Sign up', new_user_registration_path %></li>
            <li><%= link_to 'Sign in', new_user_session_path %></li>
          </ul>
        <% end -%>
      </nav>
    </div>
  </div>
</header>

<div id="content" class="col-md-9 center-block">
   <%= yield %>
 </div>
```

app/assets/stylesheets/application.scss
```
#logo {
 font-size: 26px;
 font-weight: 700;
 text-transform: uppercase;
 letter-spacing: -1px;
 padding: 15px 0;
 a {
   color: #2F363E;
 }
}

#main_content {
 #content {
   float: none;
 }
 padding-bottom: 100px;
 .link {
   padding: 2em 1em;
   border-bottom: 1px solid #e9e9e9;
   .title {

     a {
       color: #FF4500;
     }
   }
 }
 .comments_title {
   margin-top: 2em;
 }
 #comments {
   .comment {
     padding: 1em 0;
     border-top: 1px solid #E9E9E9;
     .lead {
       margin-bottom: 0;
     }
   }
 }
}
```

app/views/links/index.html.erb
```
<p id="notice"><%= notice %></p>

<h1>Listing links</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Url</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @links.each do |link| %>
    <tr>
      <td><%= link.title %></td>
      <td><%= link.url %></td>
      <td><%= link_to 'Show', link %></td>
      <% if link.user == current_user %>
      <td><%= link_to 'Edit', edit_link_path(link) %></td>
      <td><%= link_to 'Destroy', link, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      <% end %>
    </tr>
    <% end %>
  </tbody>
</table>

```
改为
```
<% @links.each do |link| %>
  <div class="link row clearfix">
    <h2>
      <%= link_to link.title, link %><br>
      <small class="author">Submitted <%= time_ago_in_words(link.created_at) %> by <%= link.user.email %></small>
    </h2>
  </div>
  <% end %>
```
app/views/links/show.html.erb
```
<p id="notice"><%= notice %></p>

<p>
  <strong>Title:</strong>
  <%= @link.title %>
</p>

<p>
  <strong>Url:</strong>
  <%= @link.url %>
</p>

<%= link_to 'Edit', edit_link_path(@link) %> |
<%= link_to 'Back', links_path %>
```
改为：
```
<div class="page-header">
  <h1><a href="<%= @link.url %>"><%= @link.title %></a><br> <small>Submitted by <%= @link.user.name %></small></h1>
</div>

<div class="btn-group">
	<%= link_to 'Visit URL', @link.url, class: "btn btn-primary" %>
</div>

<% if @link.user == current_user -%>
	<div class="btn-group">
		<%= link_to 'Edit', edit_link_path(@link), class: "btn btn-default" %>
		<%= link_to 'Destroy', @link, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-default" %>
	</div>
<% end %>
```
app/views/links/form.html.erb
```

<%= form_with(model: link, local: true) do |form| %>

···

<div class="field">
  <%= form.label :title %>
  <%= form.text_field :title, id: :link_title %>
</div>

<div class="field">
  <%= form.label :url %>
  <%= form.text_field :url, id: :link_url %>
</div>

<div class="actions">
  <%= form.submit %>
</div>
```
改为：
```
<%= form_for(@link) do |f| %>
···
<div class="form-group">
  <%= f.label :title %><br>
  <%= f.text_field :title, class: "form-control" %>
</div>
<div class="form-group">
  <%= f.label :url %><br>
  <%= f.text_field :url, class: "form-control" %>
</div>
<br>
<div class="form-group">
  <%= f.submit "Submit", class: "btn btn-lg btn-primary" %>
</div>

<% end %>
```
app/views/devise/registrations/edit.html.erb
app/views/devise/registrations/new.html.erb
app/views/devise/sessions/new.html.erb
```
  修改样式
  <div class="form-group">
  修改表单：
  class:"form-control"
  修改按钮：
  class: "btn btn-primary"
  ---
  git add .
  git commit -m "add structure and basic styling"
  git push origin add_bootstrap
  ---
```
