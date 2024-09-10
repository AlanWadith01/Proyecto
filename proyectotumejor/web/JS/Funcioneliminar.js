/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("tr #btneliminar").click(function () {
        var idu = $(this).parent().find("#id").val();
        //alert("idp="+idp);
        swal({
            title: "Esta seguro que desea eliminar?",
            text: "Una vez eliminado, no podra recuperarlo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idu);
                        swal("Poof! El usuario ha sido eliminado!", {
                            icon: "success"
                        }).then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "CtrOdontologo?accion=eliminar";
                            }
                        });
                    } else {
                        swal("Usuario no eliminado!");
                    }
                });
    });

    function eliminar(idu) {
        var url = "CtrOdontologo?accion=eliminar";
        $.ajax({
            type: 'get',
            url: url,
            data: "id=" + idu,
            success: function (data, textStatus, jqXHR) {

            }
        });
    };

});