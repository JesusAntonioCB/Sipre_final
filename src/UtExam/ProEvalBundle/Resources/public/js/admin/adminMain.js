import 'tableexport';
$(document).ready(function() {
    $('#searchExambtn').on('click',function(){
      var user = $('select[name=selectUser]').val();
      var tipoExam = $('select[name=selectTipoExam]').val();
      $.ajax({
          url: "/admin/getListExam",
          type: "GET",
          dataType: "json",
          data: {
              user: user,
              tipoExam: tipoExam
          },
          success: function (examenList) {
            $(".examenList").html('');
            for (var i = 0; i < examenList.length; i++) {
              var materiaModa= "";
              if (typeof examenList[i].materiaModa !== 'undefined') {
                var materiaModa = examenList[i].materiaModa.nombre;
              }
              $(".examenList").append('\
                <tr>\
                  <td class="sonata-ba-list-field row sonata-ba-list-field-text">\
                  '+examenList[i].titulo+'\
                  </td>\
                </tr>\
                <tr>\
                    <td class="sonata-ba-list-field row sonata-ba-list-field-text" objectid="'+examenList[i].id+'">\
                      <form method="GET" action="/admin/openPdf" target="_blank">\
                        <div class="col-md-2">\
                          <textarea class="col-md-12 mw-100" name="examTitle">'+ materiaModa +'</textarea>\
                        </div>\
                        <div class="col-md-1">\
                          <input class="col-md-12 mw-100" type="text" name="examId" value="'+examenList[i].id+'"  readonly>\
                        </div>\
                        <div class="col-md-1">\
                          <input class="col-md-12 mw-100" type="text" name="examType" value="'+tipoExam+'"  readonly>\
                        </div>\
                        <div class="col-md-2">\
                          <textarea class="col-md-12 mw-100" name="examdata1"></textarea>\
                        </div>\
                        <div class="col-md-2">\
                          <input class="col-md-12 mw-100" type="text" name="examdata2">\
                        </div>\
                        <div class="col-md-2">\
                          <textarea class="col-md-12 mw-100" name="examdata3"></textarea>\
                        </div>\
                        <div class="col-md-2">\
                          <button class="col-md-12 mw-100" type="submit" name="submit">Generar PDF</button>\
                        </div>\
                      </form>\
                    </td>\
                </tr>\
              ')
            }

          },
          error: function (err) {
              // alert("Ocurrio un error al cargar los datos...");
          }
      });
    });
    $('#searchReport').on('click',function(){
      var generacion = document.getElementById('selectGen'),
          generacion = generacion.options[generacion.selectedIndex].value,
          typeReporte = document.getElementById('selectTypeReporte'),
          typeReporte = typeReporte.options[typeReporte.selectedIndex].value,
          grupo = document.getElementById('selectgrup'),
          grupo = grupo.options[grupo.selectedIndex].value,
          turno = document.getElementById('selectTurno'),
          turno = turno.options[turno.selectedIndex].value,
          examen = document.getElementById('selectExam'),
          examen = examen.options[examen.selectedIndex].value,
          typeExam = document.getElementById('selectTypeExam'),
          typeExam = typeExam.options[typeExam.selectedIndex].value,
          bandera= true,
          datos= {};
      if (parseInt(typeReporte)!=0) {
        if (parseInt(typeReporte)===1) {
          if (parseInt(generacion)!=0 && parseInt(examen)!=0) {
            datos={
              typeReporte: "generacion",
              exam: examen,
              generacion: generacion
            }
          }else {
            alert("Debes seleccionar el grupo y examen");
            bandera=false;
          }
        }
        if (parseInt(typeReporte)===2) {
          if (parseInt(grupo)!=0 && parseInt(turno)!=0 && parseInt(examen)!=0) {
            datos={
              typeReporte: "grupo",
              exam: examen,
              grupo: grupo,
              turno: turno,
              generacion: generacion,
              typeExam: typeExam
            }
          }else {
            alert("Debes seleccionar el grupo, turno y examen");
            bandera=false;
          }
        }
      }else {
        alert("Debes seleccionar el tipo de Reporte que deseas");
        bandera=false;
      }
      if (bandera) {
        $.ajax({
            url: "/admin/getReport",
            type: "GET",
            data: datos,
            success: function(data) {
              $(".contentTable").html(data);
              // $(".examenList").html('');
              // for (var i = 0; i < examenList.length; i++) {
              //   $(".examenList").append('\
              //     <tr>\
              //       <td class="sonata-ba-list-field sonata-ba-list-field-text" objectid="1">\
              //         <a class="sonata-link-identifier" href="/admin/openPdf/'+i+'">\
              //           '+examenList[i].titulo+'\
              //         </a>\
              //       </td>\
              //     </tr>\
              //   ')
              // }
            },
            complete: function(){
              $("table").tableExport({
                formats: ['xlsx', 'csv'],
                bootstrap: true
              });
            },
            error: function (err) {
                alert("Ocurrio un error al cargar los datos...");
            }
        });
      }

    });

});
