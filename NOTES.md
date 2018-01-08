SCOPE METHOD HELP!

DRY code?
??category controller == should that be a model method?  and if so, how do I access it???
start with predefined categories
[ ]date validation for book_record. must not be in future  -- book_record controller.
[ ] if new book fails, why aren't error messages showing?
  1. not title.  title error shows
  2. enter title.  book saves.  title error still shows.  
[ ] books/show sort records before displaying



Issues Fixed
[ fixed] book record -- require comments when creating NEW record, but not when creating new book
DONE  registration -- will not go to show page
DONE  log in  -- will not go to show page.
DONE   redirect error.  infinite loop?
[ x]  only logged in users can view certain pages
FIXED ITSELF how to handle datalist issue on edit
[ done]  create table view on user/show
[ done] category show page. table view
[ use table. leave blank] category show page. how to handle blank author or rating??
FIXED - Category controller.  show action.  ONLY books association to current user ***

Nice to have features
[ ] new book form -- on screen validation for integer value
[ ] conditional routing??  if I came from categories/show, return to category show


Questions:
BooksController  line 38.  Render did not work.  redirect did.
flash[:alert] vs. notice on render line. difference?  books_controller, line 47
Messages - flash vs. 'built in'?




FEATURE TO ADD:
Sort books by name on display
See all comments method: show all comments in date order, newest first
