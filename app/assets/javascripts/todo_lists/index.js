function createList(data) {
return $.ajax({
          url: "http://localhost:3000/todo_lists",
          method: "POST",
          data: data
        });
}

function renderNewList(response) {
  $(".lists").prepend(
    `<p>Title: ${response.title} | Status: ${response.status}</p>`
  );
}

$(document).ready(function(){
  $(".new-list-form").on("submit", function(event) {
    event.preventDefault();

    createList($(this).serialize())

      .done(function(resp) {
        $(".new-list-submit").prop("disabled", false);
        renderNewList(resp);
      });
  })
});
