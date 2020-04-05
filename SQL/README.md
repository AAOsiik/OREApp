## Database Model
#### Database Name
oreapp
#### Users
|PK(id)| username | email | password | firstname |lastname|address|complete
|--|--|--|--|--|--|--|--|--|
1|g0pN1k69|h4ck3r@government.ru|**Hashed(psw1234)**|-|-|-|0
| 2|new_user|new@newer.com|**Hashed(abc)**|-|-|-|0|
#### Recipes

|PK(id)| FK(userid) | title | pictures | description |FK(category)|difficulty|time|tags
|--|--|--|--|--|--|--|--|--|

#### Categories
|PK(id)| name |
|--|--|--|--|--|--|--|--|--|

#### Comments
|PK(id)| FK(recipeid) | comment
|--|--|--|--|--|--|--|--|--|
