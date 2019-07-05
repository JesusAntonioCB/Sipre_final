const $ = require('jquery');
import 'bootstrap';
import './registerUser.js';
import './examen.js';
// or you can include specific pieces
// require('bootstrap/js/dist/tooltip');
// require('bootstrap/js/dist/popover');

$(document).ready(function() {
    $('body').on('click','.btnParticular',function() {
      var herf= window.location.pathname;
      if (herf==="/") {
        herf="";
      }
      $.ajax({//inicio de funciones de AJAX
          url: herf+'ModalCodeExam',
          type: 'POST',
          beforeSend: function() {//funciones antes de cargar
            // $('.loading').removeClass('hide');
          },//final de beforeSend()
          success: function send(data) {//Funciones si hay éxito en el envio
            $('body').append(data);
            $('#ModalCodeExam').modal();
          },//final de success()
          complete: function() {//funciones una vez completada la petición
          },//final de complete
        });//final de AJAX
        // $('body').on('click','.btnSuccesCodeExam',function() {
        //   var codeExam= $('.lblCodeExam').val();
        //   window.location.href = window.location.href+"examen="+codeExam;
        // });

    });

});
