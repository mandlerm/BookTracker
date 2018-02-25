$(document).ready(() => {
  $('.bookShow').on('click')
  bindBookShowPage()
  bindBookCreate()
  bindIndexPage()
})

const bindIndexPage = () => {
  $('.allBooks').on('click', (e) => {
    history.replaceState(null, null, "users")
    e.preventDefault(e)
    const url = e.currentTarget.attributes[1].value

    fetch(`${url}.json`, {
      credentials: 'include'
    })
        .then(res => res.json())
        .then(data => {

          let uniqueBooks = UniqueBookList(data)

            $(".app-container").html('').append(`<h1>Your Books</h1><table><tbody class='book-list'><tr>
                    <th class="table"> Title </th>
                    <th class="table"> Author </th>
                    <th class="table"> Category </th>
                    </tbody></table>`)

          uniqueBooks.forEach(book => {
            book.user_id = data.id
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
  this.user_id = book.user_id
}

Book.prototype.formatIndex = function() {
  let bookHTML = `<tr>
    <td><a class="bookShow" href="/users/${this.user_id}/books/${this.id}">${this.title}</a></td>
    <td>${this.author}</td>
    <td>${this.category}</td>
    </tr>
  `
  $('.bookShow').on('click', bindBookShowPage())
  return bookHTML
}


  const bindBookShowPage = () => {
    bookShowHandler()
  }

  function bookShowHandler() {
    $('.bookShow').on('click', (e) => {
      e.preventDefault()
      e.stopPropagation()

      history.replaceState(null, null, e.target)
console.log('out')
      const url = e.currentTarget.attributes[1].value

      fetch(`${url}.json`, {
        credentials: 'include'
      })
          .then(res => res.json())
          .then(data => {
            let bookHTML = `
              <h1>Title: ${data.title}</h1><p>Author: ${data.author}</p>
              </br>Comments:</br>
            `
             $(".app-container").html('').append(bookHTML)

            data.book_records.forEach(comment => {
              let newComment = new Comment(comment)
              let commentHtml = newComment.formatIndex()

              $(".app-container").append(commentHtml)
            })
            const userId = data.book_records["0"].user_id
            const bookId = data.book_records["0"].book_id

            const deleteLink = `<p><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/users/${userId}/books/${bookId}">Delete Record</a></p>`

            const editLink = `<p><a href="/users/${userId}/books/${bookId}/edit">Edit Book</a></p>`

            $(".app-container").append(deleteLink)
            $(".app-container").append(editLink)
          })
      })
    }

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

//issues here.
  function bindBookCreate() {
    $('#submit-book').on('submit', function(e) {
      e.preventDefault(e)
      const url = e.target.action
      const data = $(this).serializeArray()
      $.ajax( {
        type: "POST",
        url: url,
        data: data,
        success: function(book) {
          const bookId = book.book_records["0"].book_id
          const userId = book.book_records["0"].user_id
          const bookHTML = `
            <h1>Title: ${book.title}</h1><h3>Author: ${book.author}</h3>`
          const deleteLink = `<p><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/users/${userId}/books/${bookId}">Delete Record</a></p>`

          const editLink = `<p><a href="/users/${userId}/books/${bookId}/edit">Edit Book</a></p>`
           $(".app-container").html('').append(bookHTML)
           $(".app-container").append(editLink)
           $(".app-container").html('').append(deleteLink)

        },
        error: function(e) {
          //don't like how this is working. how can i just add flash message
          $(".errors").html(e.responseText)

        }
      })
//       $.post(url, data, function(data) {
// debugger
//         $(".app-container").append()
//     })
  })}
