import 'tableexport';
$(document).ready(function() {
    $('#searchExambtn').on('click',function(){
      var user = $('select[name=selectUser]').val();
      var tipoExam = $('select[name=selectTipoExam]').val();
      $.ajax({
          url: "/sipre/web/admin/getListExam",
          type: "GET",
          dataType: "json",
          data: {
              user: user,
              tipoExam: tipoExam
          },
          success: function (examenList) {
            $(".examenList").html('');
            for (var i = 0; i < examenList.length; i++) {
              $(".examenList").append('\
                <tr>\
                  <td class="sonata-ba-list-field sonata-ba-list-field-text" objectid="1">\
                    <a class="sonata-link-identifier" href="/admin/openPdf/'+i+'">\
                      '+examenList[i].titulo+'\
                    </a>\
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
      var generacion = document.getElementById('selectGen').value,
          typeReporte = document.getElementById('selectTypeReporte').value,
          grupo = document.getElementById('selectgrup').value,
          turno = document.getElementById('selectTurno').value,
          bandera= true,
          datos= {};
      if (parseInt(typeReporte)!=0) {
        if (parseInt(typeReporte)===1) {
          if (generacion != 0) {
            datos={
              typeReporte: "generacion",
              generacion: generacion
            }
          }else {
            alert("Debes seleccionar el tipo de Reporte que deseas");
            bandera=false;
          }

        }
        if (parseInt(typeReporte)===2) {
          if (grupo!=0||turno!=0) {
            datos={
              typeReporte: "grupo",
              grupo: grupo,
              turno: turno,
              generacion: generacion
            }
          }else {
            alert("debes seleccionar el grupo y el turno");
            bandera=false;
          }
        }
      }else {
        alert("Debes seleccionar el tipo de Reporte que deseas");
        bandera=false;
      }
      if (bandera) {
        $.ajax({
            url: "/sipre/web/admin/getReport",
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
