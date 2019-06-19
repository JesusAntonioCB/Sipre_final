
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
    })

});
