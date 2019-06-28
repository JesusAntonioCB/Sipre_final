$(document).ready(function() {
  $('body').on('click','.registerAlumno', function() {
    var bandera= true,
        expOnlyLetters= /^[a-zA-Z\s]+$/,
        none="'none'",
        boxName= document.getElementById('userName').value,
        boxpass= document.getElementById('password').value,
        boxUserName= document.getElementById('userNameUni').value,
        boxGrupo= document.getElementById('txtGrupo').value,
        boxMaestro1= document.getElementById('selectMaestro1').value,
        boxMaestro2= document.getElementById('selectMaestro2').value,
        boxMaestro3= document.getElementById('selectMaestro3').value,
        boxCarrera= document.getElementById('userCarrera').value,
        boxEval= "Entrada",
        boxTurno= document.getElementById('exampleFormControlSelect1').value;
    if (boxName===""||boxCarrera===""||boxTurno===""||boxGrupo===""||boxEval===""||
        boxMaestro3===""||boxMaestro2===""||boxMaestro1===""||boxUserName===""||boxpass=="") {
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
        alert(data);
        location.reload();
      },
      complete: function() {
        $('.loadingContent').remove();
      },
    });
  }
});
});
