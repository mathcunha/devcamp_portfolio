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
});
