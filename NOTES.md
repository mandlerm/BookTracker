ERRORS  
DONE  registration -- will not go to show page
DONE  log in  -- will not go to show page.
DONE   redirect error.  infinite loop?

Book partials: edit and form.  
can I render part of a partial in another partial?

Checklist

[ x]  only logged in users can view certain pages
[ ] new book form -- on screen validation for integer value
[ ]date validation for book_record. must not be in future
[ ] books/show sort records before displaying
[ ] book record -- require comments when creating NEW record, but not when creating new book

start with predefined categories
FIXED ITSELF how to handle datalist issue on edit

[ ]  create table view on user/show

[ ] category show page. table view

[ ] category show page. how to handle blank author or rating??

[ ] conditional routing??  if I came from categories/show, return to category show

[ ] if new book fails, why aren't error messages showing?
  1. not title.  title error shows
  2. enter title.  book saves.  title error still shows.  
  3. category is not being required?
  4. does category validation to in Book model or category model?

Category controller.  show action.  ONLY books association to current user ***

When I sign in with OmniAuth, the url looks funny:  http://localhost:3000/users#_=_


BooksController  line 38.  Render did not work.  redirect did.
[ ] if update is not valid, why aren't error messages showing?
