$(document).ready(function() {
  $('body').on('click','.btnEntrada', function() {
    $('.RegisterUser').removeClass("hide");
    $('.homeConter').addClass("hide");
  });
  $('body').on('click','.btnSalida', function() {
    $('.loginUser').removeClass("hide");
    $('.homeConter').addClass("hide");
  });
  $('body').on('click','#exampleFormControlSelect1', function() {
    if (this.value === "Vespertino") {
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
        boxName= document.getElementById('userName').value,
        boxpass= document.getElementById('password').value,
        boxUserName= document.getElementById('userNameUni').value,
        boxGrupo= document.getElementById('txtGrupo').value,
        boxCarrera= document.getElementById('userCarrera').value,
        boxEval= "Entrada",
        boxTurno= document.getElementById('exampleFormControlSelect1').value;
    if (boxTurno === "Vespertino") {
      var boxMaestro1= document.getElementById('selectMaestro1V').value,
          boxMaestro2= document.getElementById('selectMaestro2V').value,
          boxMaestro3= document.getElementById('selectMaestro3V').value;
    }else {
      var boxMaestro1= document.getElementById('selectMaestro1N').value,
          boxMaestro2= document.getElementById('selectMaestro2N').value,
          boxMaestro3= document.getElementById('selectMaestro3N').value;
    }
    console.log(boxName);
    console.log(boxpass);
    console.log(boxUserName);
    console.log(boxGrupo);
    console.log(boxCarrera);
    console.log(boxEval);
    console.log(boxTurno);
    console.log(boxMaestro1);
    console.log(boxMaestro2);
    console.log(boxMaestro3);
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
  $('body').on('click','.loginAlumno', function() {
    var bandera= true,
        expOnlyLetters= /^[a-zA-Z\s]+$/,
        none="'none'",
        boxpass= document.getElementById('passwordLogin').value,
        boxUserName= document.getElementById('userNameUniLogin').value;
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
    var data = {
      "userName" : boxUserName,
      "pass" : boxpass
    }
    $.ajax({
      url: 'login',
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
