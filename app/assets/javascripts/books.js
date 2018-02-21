$(document).ready(() => {
  bindIndexPage()
  bindBookShowPage()
  bindBookCreate()
})

const bindIndexPage = () => {
  $('.allBooks').on('click', (e) => {
    e.preventDefault(e)
    history.pushState(null, null, "books")
    const url = e.currentTarget.attributes[1].value

    fetch(`${url}.json`, {
      credentials: 'include'
    })
        .then(res => res.json())
        .then(data => {

          //trying to get flattened array - only return 1 of each title
          let uniqueBooks = UniqueBookList(data)

            $(".app-container").html('').append(`<h1>Your Books</h1><table><tbody class='book-list'><tr>
                    <th class="table"> Title </th>
                    <th class="table"> Author </th>
                    <th class="table"> Category </th>
                    </tbody></table>`)

          uniqueBooks.forEach(book => {
            let newBook = new Book(book)
            let bookHtml = newBook.formatIndex()
            $(".book-list").append(bookHtml)
          })
      })
    })}

function UniqueBookList(list) {
  let uniqueBooks = []
  let tempBookArray = []
  let dupArray = []

console.log(list)
  list.books.forEach(function(item) {
    if (!tempBookArray.includes(item.title)) {
      tempBookArray.push(item.title)
      uniqueBooks.push(item)
    }
  })
  return uniqueBooks
}

function Book(book) {
  this.title = book.title
  this.author = book.author
  this.category = book.category_name
  this.id = book.id
  console.log(this)
}

Book.prototype.formatIndex = function() {
  let bookHTML = `<tr>
    <a href="/users/:user_id/books/${this.id}"><td>${this.title}</td></a>
    <td>${this.author}</td>
    <td>${this.category}</td>
    </tr>
  `
  return bookHTML
}


  const bindBookShowPage = () => {
    $('.bookShow').on('click', (e) => {
      e.preventDefault(e)
      history.pushState(null, null, "book/show")
      const url = e.currentTarget.attributes[1].value
      console.log(url)

      fetch(`${url}.json`, {
        credentials: 'include'
      })
          .then(res => res.json())
          .then(data => {
            console.log(data)
            let bookHTML = `
              <h1>Title: ${data.title}</h1><p>Author: ${data.author}</p>
              </br>Comments:</br>
            `
             $(".app-container").html('').append(bookHTML)
            console.log(data.book_records)
            data.book_records.forEach(comment => {
              let newComment = new Comment(comment)
              let commentHtml = newComment.formatIndex()
              console.log(commentHtml)
              $(".app-container").append(commentHtml)
            })
          })
  })}

  function Comment(comment) {
    this.date = comment.date
    this.comment = comment.comments
  }

  Comment.prototype.formatIndex = function() {
    let commentHTML = `
      <p>${this.date} - ${this.comment}</p>
    `
    return commentHTML
  }

  function bindBookCreate() {
    $('#submit-book').on('submit', function(e) {
      e.preventDefault(e)
//date is not getting serialized properly.  category and book attributes not coming through
      const url = e.target.action
      const params = $(this).serializeArray()
      $.post(url, params).done(function(data) {

      })
  })}
