$(function() {
  initPage();
});

$(window).bind('page:change', function() {
  initPage();
});

function initPage() {
  if ($("#new_post").length > 0) {
    setTimeout(autoSavePost, 5000); 
  }
  if ($(".edit_post").length > 0) {
    setTimeout(autoSaveEditPost, 5000); 
  }      
}

function autoSavePost() {
	for (instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
    }
  $.ajax({
  type: "POST",
  url: "../posts",
  data: $("#new_post").serialize(),
  dataType: "script",
  success: function(data) {
    console.log(data);
  }
  });
  setTimeout(autoSavePost, 5000);
}

function autoSaveEditPost() {
  for (instance in CKEDITOR.instances){
    CKEDITOR.instances[instance].updateElement();
  }
  var id = $("#post_id").val()
  $.ajax({
    type: "PATCH",
    url: "../" + id,
    data: $(".edit_post").serialize(),
    dataType: "script",
    success: function(data) {
      console.log(data);
    }
  });
  setTimeout(autoSaveEditPost, 5000);
}