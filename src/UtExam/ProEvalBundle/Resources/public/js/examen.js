$(document).ready(function() {
  var totalTime= "";
  if ($('.examenInterfaz').length) {
    var minutesLabel = document.getElementById("ExamTimerMinutos");
    var secondsLabel = document.getElementById("ExamTimerSegundos");
    var totalSeconds = 0;

    setInterval(setTime, 1000);

    function setTime() {
      ++totalSeconds;
      totalTime=pad(parseInt(totalSeconds / 60))+":"+pad(totalSeconds % 60);
      secondsLabel.innerHTML = pad(totalSeconds % 60);
      minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
    }

    function pad(val) {
      var valString = val + "";
      if (valString.length < 2) {
        return "0" + valString;
      } else {
        return valString;
      }
    }
    $('body').on('click', '.btnExam',function() {
      var checbox=$(this).attr('data-check');
      var noques= $(this).attr('data-question');
      var nogrup= $(this).attr('data-grup');
      $(this).addClass("click");
      $('#'+checbox).prop('checked', true);
      var otherq=$('#grup'+nogrup).find('#pregunta'+noques).find('.respuestas').find('.respuesta').find('.click');
      for (var i = 0; i < otherq.length; i++) {
        var otherChek=$(otherq[i]).attr('data-check');
        if (otherChek != checbox) {
          $(otherq[i]).removeClass('click');
        }
      }
      var $box = $('#'+checbox);
      if ($box.is(":checked")) {
        // the name of the box is retrieved using the .attr() method
        // as it is assumed and expected to be immutable
        var group = "input:checkbox[name='" + $box.attr("name") + "']";
        // the checked state of the group/box on the other hand will change
        // and the current value is retrieved using .prop() method
        $(group).prop("checked", false);
        $box.prop("checked", true);
      } else {
        $box.prop("checked", false);
      }
    });

    $('input:checkbox').on('click',function() {
      var $box = $(this);
      if ($box.is(":checked")) {
        // the name of the box is retrieved using the .attr() method
        // as it is assumed and expected to be immutable
        var group = "input:checkbox[name='" + $box.attr("name") + "']";
        // the checked state of the group/box on the other hand will change
        // and the current value is retrieved using .prop() method
        $(group).prop("checked", false);
        $box.prop("checked", true);
      }else {
        $box.prop("checked", false);
      }
    });
    $('body').on('click','.btnFinish', function(){
      var respuestas=[];
      var question= $(".totalQuestion").attr("data-quetion");
      $("input:checkbox[class=checkbox]:checked").each(function(){
          respuestas.push($(this).val().split('=;'));
      });
      if (Number(question)===respuestas.length) {
        var datos={
          respuestas:respuestas,
          time:totalTime,
          dquestion:question
        }
        $.ajax({//inicio de funciones de AJAX
          type: 'POST',
          data: datos,
          url: 'get-Results',
          beforeSend: function() {//funciones antes de cargar
          },//final de beforeSend()
          success: function send(data) {//Funciones si hay éxito en el envio
            if (data > 95) {
              $('body').append('\
              <div class="alert alert-success alert-dismissible fade show" role="alert">\
                <strong>Increible!!! </strong>Eres un Orgullo para los de tu Especie, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data>=90) {
              $('body').append('\
              <div class="alert alert-success alert-dismissible fade show" role="alert">\
                <strong>Asombroso! </strong>Asombroso! Eres uno de los elegidos, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data>=81) {
              $('body').append('\
              <div class="alert alert-info alert-dismissible fade show" role="alert">\
                <strong>Genial! </strong>tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data>=80) {
              $('body').append('\
              <div class="alert alert-info alert-dismissible fade show" role="alert">\
                <strong>Huuui! </strong>Por poco y no la cuentas, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data>=60) {
              $('body').append('\
              <div class="alert alert-warning alert-dismissible fade show" role="alert">\
                <strong>Pues...! </strong>Al Menos puedes decir que aprendiste algo, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data>=40) {
              $('body').append('\
              <div class="alert alert-danger alert-dismissible fade show" role="alert">\
                <strong>Lo siento! </strong>Mejor suerte para la proxima, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            else if (data<40) {
              $('body').append('\
              <div class="alert alert-danger alert-dismissible fade show" role="alert">\
                <strong>Por Bill Gates! </strong>Que Verguenza compañero deverias estudiar mas, tu calificacion es: '+data+'\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                  <span aria-hidden="true">&times;</span>\
                </button>\
              </div>\
              ');
              $('.alert').alert();
            }
            $('body').on("click", ".close", function(){
              location.reload();
            });
          },//final de success()
          complete: function() {//funciones una vez completada la petición
          },//final de complete
        });//final de AJAX
      }else {
        var resta=Number(question)-respuestas.length;
        var texto="preguntas"
        if (resta===1) {
          var texto="pregunta"
        }
        if (!$('.questions').length) {
          $('body').append('\
          <div class="alert alert-success alert-danger fade show questionsComplete" role="alert">\
            <strong>No seas impaciente! </strong>aun te quedan '+resta+' '+texto+' por contestar\
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
              <span aria-hidden="true">&times;</span>\
            </button>\
          </div>\
          ');
        }
        $('.alert').alert();
      }
    });
  }
});
