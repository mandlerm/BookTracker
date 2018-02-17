$(document).ready(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
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

            $(".book-list").append(`<tr><td><a href='http://localhost:3000/${url}/books/${book.id}'>${book.title}</a></td><td>${book.author}</td><td>${book.category_name}</td>`)
            console.log(book)
          })
          // $('#app-container').html('hello')

      })
    })
  }
