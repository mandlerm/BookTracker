SCOPE METHOD HELP!

books_controller...if i have no logic in an action, do I need the action?
Controller logic.
start with predefined categories
When I sign in with OmniAuth, the url looks funny:  http://localhost:3000/users#_=_
category controller == should that be a model method?  and if so, how do I access it?
[ ]date validation for book_record. must not be in future  -- book_record controller.
[ ] if new book fails, why aren't error messages showing?
  1. not title.  title error shows
  2. enter title.  book saves.  title error still shows.  
  3. category is not being required?
  4. does category validation to in Book model or category model?
[ ] books/show sort records before displaying
[ ] book record -- require comments when creating NEW record, but not when creating new book


BooksController  line 38.  Render did not work.  redirect did.
flash[:alert] vs. notice on render line. difference?  books_controller, line 47
Messages - flash vs. 'built in'?


books_controller new  
  better to build in controller or in form?

  
ERRORS  
DONE  registration -- will not go to show page
DONE  log in  -- will not go to show page.
DONE   redirect error.  infinite loop?



Checklist

[ x]  only logged in users can view certain pages
[ ] new book form -- on screen validation for integer value




FIXED ITSELF how to handle datalist issue on edit

[ done]  create table view on user/show

[ done] category show page. table view

[ use table. leave blank] category show page. how to handle blank author or rating??

[ ] conditional routing??  if I came from categories/show, return to category show


FIXED - Category controller.  show action.  ONLY books association to current user ***
