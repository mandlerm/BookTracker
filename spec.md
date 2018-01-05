# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [Category has_many Books ] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [book belongs_to category ] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [User has_many books, through book_records ] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [:date, :comments ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [book title,  ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [category & book_records ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [Devise ] Include signup (how e.g. Devise)
- [Devise ] Include login (how e.g. Devise)
- [Devise ] Include logout (how e.g. Devise)
- [Devise/OmniAuth ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [users/:id/books/:id ] Include nested resource show or index (URL e.g. users/2/recipes)
- [users/:id/book/new ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [yes ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
