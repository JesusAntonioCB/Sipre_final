$(document).ready(function() {
  if ($('.homeConter').length) {
    document.cookie = "time=; expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
  }
  $('body').on('click','.btnEntrada', function() {
    $('.RegisterUser').removeClass("hide");
    $('.homeConter').addClass("hide");
  });
  $('body').on('click','.btnSalida', function() {
    $('.loginUser').removeClass("hide");
    $('.homeConter').addClass("hide");
  });
  $('body').on('change','#exampleFormControlSelect1', function() {
    if (this.options[this.selectedIndex].value === "Vespertino") {
      $("#selectMaestro1V").removeClass("hide");
      $("#selectMaestro2V").removeClass("hide");
      $("#selectMaestro3V").removeClass("hide");
      $("#selectMaestro1N").addClass("hide");
      $("#selectMaestro2N").addClass("hide");
      $("#selectMaestro3N").addClass("hide");
    }else {
      $("#selectMaestro1V").addClass("hide");
      $("#selectMaestro2V").addClass("hide");
      $("#selectMaestro3V").addClass("hide");
      $("#selectMaestro1N").removeClass("hide");
      $("#selectMaestro2N").removeClass("hide");
      $("#selectMaestro3N").removeClass("hide");
    }
  });
  $('body').on('click','.registerAlumno', function() {
    var bandera= true,
        expOnlyLetters= /^[a-zA-Z\s]+$/,
        none="'none'",
        boxLastName= document.getElementById('lastName').value,
        boxName= boxLastName+" "+document.getElementById('userName').value,
        boxpass= document.getElementById('password').value,
        boxUserName= document.getElementById('userNameUni').value,
        boxCarrera= document.getElementById('userCarrera'),
        boxCarrera=boxCarrera.options[boxCarrera.selectedIndex].value,
        boxTurno= document.getElementById('exampleFormControlSelect1'),
        boxTurno=boxTurno.options[boxTurno.selectedIndex].value;
    if ($(this).attr("data_propedeutico") == 'true') {
      var boxGrupo= document.getElementById('txtGrupo'),
          boxGrupo=boxGrupo.options[boxGrupo.selectedIndex].value,
          boxEval= "Entrada";
      if (boxTurno === "Vespertino") {
        var boxMaestro1= document.getElementById('selectMaestro1V'),
            boxMaestro1=boxMaestro1.options[boxMaestro1.selectedIndex].value,
            boxMaestro2= document.getElementById('selectMaestro2V'),
            boxMaestro2=boxMaestro2.options[boxMaestro2.selectedIndex].value,
            boxMaestro3= document.getElementById('selectMaestro3V'),
            boxMaestro3=boxMaestro3.options[boxMaestro3.selectedIndex].value;
      }else {
        var boxMaestro1= document.getElementById('selectMaestro1N'),
            boxMaestro1=boxMaestro1.options[boxMaestro1.selectedIndex].value,
            boxMaestro2= document.getElementById('selectMaestro2N'),
            boxMaestro2=boxMaestro2.options[boxMaestro2.selectedIndex].value,
            boxMaestro3= document.getElementById('selectMaestro3N'),
            boxMaestro3=boxMaestro3.options[boxMaestro3.selectedIndex].value;
      }
    }else {
      var boxGrupo= document.getElementById('txtGrupo').value,
          boxEval= "Unico",
          boxMaestro1= "",
          boxMaestro2= "",
          boxMaestro3= "";
    }
    if (boxName===""||boxCarrera==="-1"||boxTurno==="-1"||boxGrupo==="-1"||boxEval===""||
        boxMaestro3==="-1"||boxMaestro2==="-1"||boxMaestro1==="-1"||boxUserName===""||boxpass=="") {
    var bandera= false;
    $(".loginContainer").append('\
    <div class="alert alert-danger alert-dismissible fade show" role="alert">\
       <span class="closebtn" onclick="this.parentElement.style.display='+none+';">&times;</span> \
       <strong>¡Alerta!</strong> Debes de llenar todos los campos.\
   </div>\
    ');
    window.setTimeout(function() { $(".alert").fadeTo(500, 0).slideUp(500, function(){ $(this).remove(); }); }, 2500);
    return;
    }
    if (bandera) {
    var data = {
      "alumno" : boxName,
      "userName" : boxUserName,
      "pass" : boxpass,
      "carrera" : boxCarrera,
      "turno" : boxTurno,
      "grupo" : boxGrupo,
      "maestro1" : boxMaestro1,
      "maestro2" : boxMaestro2,
      "maestro3" : boxMaestro3,
      "evaluacion" : boxEval
    }
    $.ajax({
      url: 'register',
      type: 'POST',
      dataType: "json",
      data:  data,
      beforeSend: function() {
        $('body').append('\
        <div class="loadingContent" id="divLoading">\
          <h1>\
          <span class="let1">S</span>\
          <span class="let2">i</span>\
          <span class="let3">p</span>\
          <span class="let4">r</span>\
          <span class="let5">e</span>\
          <span class="let6">.</span>\
          <span class="let7">.</span>\
          </h1>\
          <div class="overlay"></div>\
        </div>\
        ')
      },
      success: function (data) {
        alert(data.mensaje);
        if (data.mensaje === "Registro exitoso") {
          $.setCookie("UID",data.UID,1);
          $.setCookie("examen",data.examen,1);
          location.reload();
        }
      },
      complete: function() {
        $('.loadingContent').remove();
      },
    });
  }
});
  $('body').on('click','.loginAlumno', function() {
    var bandera= true,
        expOnlyLetters= /^[a-zA-Z\s]+$/,
        none="'none'",
        boxpass= document.getElementById('passwordLogin').value,
        boxUserName= document.getElementById('userNameUniLogin').value;
    if ($(this).attr("data_propedeutico") == 'true') {
      var boxEval= "Salida";
    }else {
      var boxEval= "Unico";
    }
    if (boxUserName===""||boxpass==="") {
    var bandera= false;
    $(".loginContainer").append('\
    <div class="alert alert-danger alert-dismissible fade show" role="alert">\
       <span class="closebtn" onclick="this.parentElement.style.display='+none+';">&times;</span> \
       <strong>¡Alerta!</strong> Debes de llenar todos los campos.\
   </div>\
    ');
    window.setTimeout(function() { $(".alert").fadeTo(500, 0).slideUp(500, function(){ $(this).remove(); }); }, 2500);
    return;
    }
    if (bandera) {
      var generalData = "";
    var data = {
      "userName" : boxUserName,
      "evaluacion" : boxEval,
      "pass" : boxpass
    }
    $.ajax({
      url: 'login',
      type: 'POST',
      dataType: "json",
      data:  data,
      beforeSend: function() {
        $('body').append('\
        <div class="loadingContent" id="divLoading">\
          <h1>\
          <span class="let1">S</span>\
          <span class="let2">i</span>\
          <span class="let3">p</span>\
          <span class="let4">r</span>\
          <span class="let5">e</span>\
          <span class="let6">.</span>\
          <span class="let7">.</span>\
          </h1>\
          <div class="overlay"></div>\
        </div>\
        ')
      },
      success: function (data) {
        generalData= data;
        if (data.bandera) {
          $.confirmModal(data.mensaje,
            function() {
              $.setCookie("UID",data.UID,1);
              $.setCookie("examen",data.examen,1);
              location.reload();
            },
            function() {
              $.ajax({ //inicio de funciones de AJAX
                url: '/ModalUpdateGrup',
                type: 'POST',
                success: function send(dataModal) { //Funciones si hay éxito en el envio
                  $('body').append(dataModal);
                  $('#ModalUpdateGrup').modal();
                }, //final de success()
                complete: function() { //funciones una vez completada la petición
                  $('body').on('click','#btn-newGrup', function() {
                    var boxUserName = document.getElementById('lbl-NewGrup').value;
                    var data = {
                      "UID" : generalData.UID,
                      "newGrup" : boxUserName
                    }
                    $.ajax({ //inicio de funciones de AJAX
                      url: '/UpdateGrup',
                      type: 'POST',
                      data:  data,
                      success: function send(dataGrup) { //Funciones si hay éxito en el envio
                        if (dataGrup.bandera) {
                          $.setCookie("UID",generalData.UID,1);
                          $.setCookie("examen",generalData.examen,1);
                          location.reload();
                        }else {
                          alert("algo salio mal por favor vuelve a intentarlo");
                          $('.loadingContent').remove();
                        }
                      }
                    }); //final de AJAX
                  });
                } //final de complete
              }); //final de AJAX
            }
          );
        }else {
          alert(data.mensaje);
          $('.loadingContent').remove();
        }
      }
    });
  }
  });
});
$.confirmModal = function(msg, yesCallback, noCallback) {
  var $content =  "<div id='modalConfirm' class='modal'>" +
               "<div class='modal-dialog modal-dialog-centered'><div class='modal-content'><header class='modal-header'>" +
                     " <h3 class='modal-title'> ¡¡Importante!! </h3> " +
                 "</header>" +
                 "<div class='modal-body'>" +
                   "<div class='form-group'>"+
                     "<label for='recipient-name' class='col-form-label'>" + msg + "</label>"+
                   "</div>"+
                 "</div>" +
                 "<div class='modal-footer'>" +
                     "<div class='controls'>" +
                        " <button class='btn btn-secondary cancelAction' data-dismiss='modal'>No</button> " +
                         " <button class='btn btn-primary doAction'>Si</button> " +
                     "</div>" +
                 "</div>" +
               "</div>" +
            "</div>" +
          "</div>";
  $('body').prepend($content);
  $('#modalConfirm').modal();
  $('.doAction').click(function () {
    yesCallback();
    $(this).parents('.dialog-ovelay').fadeOut(500, function () {
      $(this).remove();
    });
  });
  $('.cancelAction, .close').click(function () {
    noCallback();
    $(this).parents('.dialog-ovelay').fadeOut(500, function () {
      $(this).remove();
    });
  });
}
$.setCookie = function(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires="+d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
