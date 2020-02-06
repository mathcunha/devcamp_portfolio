$(function() {
  $('[data-toggle="tooltip"]').tooltip();
});
$(function() {
  $('[data-toggle="popover"]').popover();
});

$(document).ready(function() {
  $(".sortable").sortable();
  $(".sortable").on("sortupdate", function(event, ui) {
    pusharray = new Array();
    pos = 0;
    $(".ui-sortable-handle").each(function(index) {
      pusharray.push({
        data: { id: $(this).attr("data-id"), position: ++pos }
      });
    });
    //console.log(pusharray);
    $.ajax({
      type: "PUT",
      url: "/portfolios/sort",
      data: JSON.stringify({ order: pusharray }),
      contentType: "application/json; charset=utf-8"
    }).fail(function(jqXHR, textStatus, errorThrown) {
      $(".modal-body").text(jqXHR.responseText);
      $("#exampleModal").modal("show");
    });
  });

  $("#post-comment").click(function() {
    formData = {
      blog_id: $("#comment_blog_id").val(),
      content: $("#comment_content").val()
    };

    $.ajax({
      type: "POST",
      url: "/comments",
      data: JSON.stringify({ comment: formData }),
      contentType: "application/json; charset=utf-8"
    }).fail(function(jqXHR, textStatus, errorThrown) {
      $(".modal-body").text(jqXHR.responseText);
      $("#exampleModal").modal("show");
    });
  });
});
