$(document).ready(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.allBooks').on('click', (e) => {
    e.preventDefault()
    console.log("Did it")
  })
}
