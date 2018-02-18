$(document).ready(() => {
  bindIndexPage()
  bindBookShowPage()
})

const bindIndexPage = () => {
  $('.allBooks').on('click', (e) => {
    e.preventDefault(e)
    const url = e.currentTarget.attributes[1].value

    fetch(`${url}.json`, {
      credentials: 'include'
    })
        .then(res => res.json())
        .then(data => {
            $(".app-container").html('').append(`<h1>Your Books</h1><table><tbody class='book-list'><tr>
                    <th class="table"> Title </th>
                    <th class="table"> Author </th>
                    <th class="table"> Category </th>
                    </tbody></table>`)

          data.books.forEach(book => {
            let newBook = new Book(book)
            let bookHtml = newBook.formatIndex()
            $(".book-list").append(bookHtml)
          })
      })
    })}

function Book(book) {
  this.title = book.title
  this.author = book.author
  this.category = book.category_name
  this.id = book.id
  console.log(this)
}

Book.prototype.formatIndex = function() {
  let bookHTML = `<tr>
    <td>${this.title}</td>
    <td>${this.author}</td>
    <td>${this.category}</td>
  `
  return bookHTML
}


  const bindBookShowPage = () => {
    $('.bookShow').on('click', (e) => {
      e.preventDefault(e)
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