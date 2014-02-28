$(function() {
  savePage();
});

$(window).bind('page:change', function() {
  savePage();
});

function savePage() {
  if ($("#new_topic").length > 0)
  {
    var $body = $("#topic_body");
    var $title = $("#topic_title");
  
    if($title.val() == "") 
    {
      $body.attr('disabled', true);
    }
  
    $title.keyup(function(){
    if($title.val() != "") 
    {
      CKEDITOR.instances['topic_body'].setReadOnly(false);
      $body.removeAttr('disabled');
    }
    else
    {
      CKEDITOR.instances['topic_body'].setReadOnly(true); 
      $body.attr('disabled', true);
    }
    });
    
    setTimeout(autoSaveTopic,5000);
  }
}

function autoSaveTopic() {

  if(CKEDITOR.instances['topic_body'].getData() != "")
  {
    for (instance in CKEDITOR.instances){
      CKEDITOR.instances[instance].updateElement();
    }
    $.ajax({
    type: "POST",
    url: "../topics",
    data: $("#new_topic").serialize(),
    dataType: "script",
    success: function(data) {
      console.log(data);
      }
    });
  }
  setTimeout(autoSaveTopic, 5000);
}