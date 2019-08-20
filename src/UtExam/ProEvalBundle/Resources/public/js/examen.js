$(document).ready(function() {
  var totalTime= "";
  if ($('.examenInterfaz').length) {
    var timerExamen = document.getElementById("examTimerContainer");
    // var timerExamen = document.getElementById("examTimerContainer").innerHTML;
    var totalSeconds = 0;
    var modal = document.getElementById("imgModal");
    function count() {
      if (getCookie("time")) {
        var startTime=getCookie("time");
      }else{
        var startTime = timerExamen.innerHTML;
      }
      var pieces = startTime.split(":");
      var time = new Date();    time.setHours(pieces[0]);
      time.setMinutes(pieces[1]);
      time.setSeconds(pieces[2]);
      var timedif = new Date(time.valueOf() - 1000);
      var newtime = timedif.toTimeString().split(" ")[0];
      timerExamen.innerHTML=newtime;
      document.cookie = "time="+newtime+";null; path=/";
      if (newtime==="00:00:00" ||newtime==="00:00:01") {
        var timeOrigin= $("#examTimerContainer").attr("data-time");
        var timeFinish = document.getElementById("examTimerContainer").innerHTML;
        var piecesOrigin = timeOrigin.split(":");
        var piecesFinish = timeFinish.split(":");
        var hTosecons= (parseInt(piecesOrigin[0])*60)*60;
        var mTosecons= parseInt(piecesOrigin[1])*60;
        var originSecons= parseInt(piecesOrigin[2])+mTosecons+hTosecons;
        var hToseconsF= (parseInt(piecesFinish[0])*60)*60;
        var mToseconsF= parseInt(piecesFinish[1])*60;
        var finishSecons= parseInt(piecesFinish[2])+mToseconsF+hToseconsF;
        var totalSecons= originSecons-finishSecons;
        var totalTime= secondsToHms(totalSecons);
        var arrayQByGrup= [];
        var qByGrup1= false;
        var qByGrup2= false;
        var qByGrup3= false;
        $(".questionByGrup").each(function(){
          arrayQByGrup.push($(this).attr("data-question"));
        });
        if (arrayQByGrup[0]!=null||arrayQByGrup[0]!="") {
          qByGrup1=arrayQByGrup[0];
        }
        if (arrayQByGrup[1]!=null||arrayQByGrup[1]!="") {
          qByGrup2=arrayQByGrup[1];
        }
        if (arrayQByGrup[2]!=null||arrayQByGrup[2]!="") {
          qByGrup3=arrayQByGrup[2];
        }
        var respuestas=[];
        var question= $(".totalQuestion").attr("data-quetion");
        $("input:checkbox[class=checkbox]:checked").each(function(){
            respuestas.push($(this).val().split('=;'));
        });
        var datos={
          respuestas:respuestas,
          time:totalTime,
          dquestion:question,
          QByGrup1:qByGrup1,
          QByGrup2:qByGrup2,
          QByGrup3:qByGrup3,
        }
        var herf= window.location.pathname;
        if (herf==="/") {
          herf="";
        }
        $.ajax({//inicio de funciones de AJAX
          type: 'POST',
          data: datos,
          url: 'get-Results',
          beforeSend: function() {//funciones antes de cargar
          },//final de beforeSend()
          success: function send(data) {//Funciones si hay éxito en el envio
            document.cookie = "examen=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "UID=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            alert(data);
            location.reload();
          }
        });//final de AJAX
        document.cookie = "time=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
        alert("El tiempo ha finalizado. se calificara solo tus preguntas contestadas");
        return;
      }
      timeoutHandle=setTimeout(count, 1000);
    }
    count();

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
      var timeOrigin= $("#examTimerContainer").attr("data-time");
      var timeFinish = document.getElementById("examTimerContainer").innerHTML;
      var piecesOrigin = timeOrigin.split(":");
      var piecesFinish = timeFinish.split(":");
      var hTosecons= (parseInt(piecesOrigin[0])*60)*60;
      var mTosecons= parseInt(piecesOrigin[1])*60;
      var originSecons= parseInt(piecesOrigin[2])+mTosecons+hTosecons;
      var hToseconsF= (parseInt(piecesFinish[0])*60)*60;
      var mToseconsF= parseInt(piecesFinish[1])*60;
      var finishSecons= parseInt(piecesFinish[2])+mToseconsF+hToseconsF;
      var totalSecons= originSecons-finishSecons;
      var totalTime= secondsToHms(totalSecons);
      var arrayQByGrup= [];
      var qByGrup1= false;
      var qByGrup2= false;
      var qByGrup3= false;
      $(".questionByGrup").each(function(){
        arrayQByGrup.push($(this).attr("data-question"));
      });
      if (arrayQByGrup[0]!=null||arrayQByGrup[0]!="") {
        qByGrup1=arrayQByGrup[0];
      }
      if (arrayQByGrup[1]!=null||arrayQByGrup[1]!="") {
        qByGrup2=arrayQByGrup[1];
      }
      if (arrayQByGrup[2]!=null||arrayQByGrup[2]!="") {
        qByGrup3=arrayQByGrup[2];
      }
      var respuestas=[];
      var question= $(".totalQuestion").attr("data-quetion");
      $("input:checkbox[class=checkbox]:checked").each(function(){
          respuestas.push($(this).val().split('=;'));
      });
      if (Number(question)===respuestas.length) {
        var datos={
          respuestas:respuestas,
          time:totalTime,
          dquestion:question,
          QByGrup1:qByGrup1,
          QByGrup2:qByGrup2,
          QByGrup3:qByGrup3,
        }
        var herf= window.location.pathname;
        if (herf==="/") {
          herf="";
        }
        $.ajax({//inicio de funciones de AJAX
          type: 'POST',
          data: datos,
          url: 'get-Results',
          beforeSend: function() {//funciones antes de cargar
          },//final de beforeSend()
          success: function send(data) {//Funciones si hay éxito en el envio
            document.cookie = "time=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "examen=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            document.cookie = "UID=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            alert(data);
            location.reload();
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
    // Get the modal

    $('body').on('click','.examImg', function(){
      var modalImg = document.getElementById("img01");
      var captionText = document.getElementById("caption");
      var span = document.getElementsByClassName("close")[0];
      modal.style.display = "block";
      modalImg.src = this.src;
      captionText.innerHTML = this.alt;
    });
    $('body').on('click','.closeModal', function(){
      modal.style.display = "none";
    });
  }
  function secondsToHms(d) {
    d = Number(d);
    var h = Math.floor(d / 3600);
    var m = Math.floor(d % 3600 / 60);
    var s = Math.floor(d % 3600 % 60);

    var hDisplay = h > 0 ? h + (h == 1 ? ":" : ":") : "00:";
    var mDisplay = m > 0 ? m + (m == 1 ? ":" : ":") : "00:";
    var sDisplay = s > 0 ? s + (s == 1 ? "" : "") : "00";
    return hDisplay + mDisplay + sDisplay;
  }
  function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }
});
