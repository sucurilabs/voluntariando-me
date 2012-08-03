// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require jquery.ui.datepicker
//= require twitter/bootstrap/bootstrap-inputmask
//= require twitter/bootstrap/bootstrap-modal

$(document).ready(function(){
  
  $(".date").datepicker({
      dateFormat: 'dd/mm/yy',
      dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
      dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
      dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
      monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
      monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
      nextText: 'Próximo',
      prevText: 'Anterior'
  });

  $(".masked").inputmask();

  FB.init({appId: $('#facebook_app_id').attr('content'), status: true, cookie: true});
  
  $(".modal_ajax_button").click(function(){
    getModalInfo($(this).data('url'))
  })

  $(".modal_button").click(showModal);

});

function showModal(){
  $("#modal").modal();
}

function getModalInfo(url){
  $.ajax(url, {
    success: function(data){
      setModalInfo(data);
      showModal();
    }
  });
};

function setModalInfo(data) {
  $("#modal_header").html(data.modal_header);
  $("#modal_body").html(data.modal_body);
}
function postToFeed() {
    // calling the API ...
    var obj = {
      method: 'feed',
      link: $('#facebook_url').attr('content'),
      picture: $('#facebook_image').attr('content'),
      name: $('#facebook_title').attr('content'),
      caption: 'Voluntariando.Me',
      description: $('#facebook_description').attr('content')
    };

    function callback(response) {
      //document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
    }

    FB.ui(obj, callback);
  }