# README
## usersテーブル
|Column       |Type   |Options     |
|------------|--------|------------|
|nickname    |string  | |
|email       |string  | |
|password    |string  | |
|age         |string  |null: false |
|profession  |string  |null: false |
### association 
has_many :posts  
has_many :comments  
has_many :wakaru 

----------------------------------------------
## postsテーブル
|Column           |Type        |Options     |
|-----------------|------------|------------|
|user             |references  |foreign_key: true |
|comment          |text        |null: false |
|industry         |string      |null: false |
|category         |string      |null: false |
### association
belongs_to :user  
has_many :comment  
has_many :wakaru  

----------------------------------------------
## commentsテーブル
|Column           |Type    |Options     |
|-----------------|--------|------------|
|comment         |text  |null: false |
|user_id         |references  |foreign_key: true |
|post_id         |references  |foreign_key: true |
### association
belongs_to :user  
belongs_to :post  

----------------------------------------------
## wakaruテーブル
|Column          |Type    |Options     |
|----------------|--------|------------|
|user_id         |references  |foreign_key: true |
|post_id         |references  |foreign_key: true |
### association
belongs_to :user  
belongs_to :post  
