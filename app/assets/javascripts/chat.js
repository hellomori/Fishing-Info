$(function(){
  function buildHTML(chat){
    let html =
     `<div class="chat__top">
        <div class="chat__top__name">
          ${chat.user_name}       
        </div>
        <div class="chat__top__date">
        ${chat.created_at}     
        </div>
      </div>
      <div class="chat__message">
        ${chat.message}
      </div>`
          return html;
  }
  $("#chat").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.chat').append(html);
      $('form')[0].reset();
      $('.chat').animate({ scrollTop: $('.chat')[0].scrollHeight});
      $('.chatform__submit').prop('disabled', false);
    })
  .fail(function() {
    alert("メッセージ送信に失敗しました");
  });
  });
});