﻿
$(document).ready(function () {
    var t = $('#tablaFactura').DataTable({
        "data": [],
        "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [1]
            },
            {
                "targets": [2]
            },
            {
                "targets": [3]
            },
            {
                "targets": [4]
            }
        ]
    });

    $.ajax({
        type: "GET",
        url: '/Facturas/setJson',
        //contentType: "application/json; charset=utf-8",
        //dataType: "json",
        success: function (response) {
            debugger
            var lol = response.replace("\"[", "'[").replace("\"", "'").replace(new RegExp("'", 'g'), "\"");
            var obj = $.parseJSON(lol);
            t.rows.add(obj).draw();
        },
        failure: function (response) {
            debugger
            alert("Fallo");
        },
        error: function (response) {
            debugger
            alert("Error");
        }
    });

    function SumarColumna() {
        debugger
        var total = 0;
        var resultVal = $(tablaFactura).dataTable().api().column(4).data();
        for (var i = 1, len = resultVal.length; i < len; i++) {
            total += parseInt(resultVal[i]);
        }
        $('#txt_totalFactura').val(total);
    }

    $('#addRow').on('click', function () {
        debugger
        var ddlProductos = $('#ddl_Productos')[0];
        var producto = ddlProductos.options[ddlProductos.selectedIndex].innerHTML;
        var idproducto = ddlProductos.options[ddlProductos.selectedIndex].value;
        var txtCantidad = $('#txt_cantidad')[0].value;
        var lblPrecio = $('#lbl_precioUnitario')[0].innerHTML;
        var lblTotalProducto = $('#lbl_totalProducto')[0].innerHTML;
        var rows = $(tablaFactura).dataTable().api().rows().data();
        if (rows.length >= 1) {
            for (var i = 0, len = rows.length; i < len; i++) {
                if (rows[i][0] == idproducto) {
                    var newRow = [idproducto, producto, parseInt(txtCantidad) + parseInt(rows[i][2]), lblPrecio, parseInt(lblTotalProducto) + parseInt(rows[i][4])];
                    $(tablaFactura).dataTable().api().row(i).data(newRow).draw();
                    $("#alerta_Error").hide();
                    $('#ddl_Productos').val("");
                    $("#lbl_precioUnitario")[0].innerText = "";
                    $("#lbl_totalProducto")[0].innerText = "";
                    $("#txt_cantidad").val("");
                    SumarColumna();
                    return;
                }
            }

            if (producto != "" && txtCantidad != "") {
                t.row.add([
                    idproducto,
                    producto,
                    txtCantidad,
                    lblPrecio,
                    lblTotalProducto
                ]).draw(false);
                $("#alerta_Error").hide();
                $('#ddl_Productos').val("");
                $("#lbl_precioUnitario")[0].innerText = "";
                $("#lbl_totalProducto")[0].innerText = "";
                $("#txt_cantidad").val("");
            } else {
                $("#alerta_Error").show();

            }
        }
        else if (producto != "" && txtCantidad != "") {
            t.row.add([
                idproducto,
                producto,
                txtCantidad,
                lblPrecio,
                lblTotalProducto
            ]).draw(false);
            $("#alerta_Error").hide();
            $('#ddl_Productos').val("");
            $("#lbl_precioUnitario")[0].innerText = "";
            $("#lbl_totalProducto")[0].innerText = "";
            $("#txt_cantidad").val("");
        } else {
            $("#alerta_Error").show();
        }
        SumarColumna();
    });
});

$(document).ready(function () {
    var table = $('#tablaFactura').DataTable();

    $('#tablaFactura tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });

    $('#removeRow').click(function () {
        debugger
        if (table.row('.selected').hasClass != "noEliminar") {
            table.row('.selected').remove().draw(false);

        }
    });
});

$('#ddl_Productos').change(function () {
    $('#txt_cantidad').val("");
    $('#alerta_Error1').hide();
    var idProducto = $(ddl_Productos)[0].value;
    if (idProducto != "") {
        $.ajax({
            type: "POST",
            url: '/Facturas/SelectPrecio',
            data: '{id: "' + idProducto + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $("#lbl_precioUnitario")[0].innerText = response;
            },
            failure: function (response) {
                debugger
                alert("Fallo");
            },
            error: function (response) {
                debugger
                alert("Error");
            }
        });
    } else {
        $("#lbl_precioUnitario")[0].innerText = "0";
        $("#lbl_totalProducto")[0].innerText = "0";
        $("#txt_cantidad").val("");
    }

});

$('#txt_cantidad').change(function () {
    var idProducto = $(ddl_Productos)[0].value;
    if (idProducto != "") {
        var PrecioUnitario = $("#lbl_precioUnitario").text();
        var TotalProducto = $("#lbl_totalProducto").text();
        var Cantidad = $("#txt_cantidad").val();
        TotalProducto = PrecioUnitario * Cantidad;
        $("#lbl_totalProducto")[0].innerText = TotalProducto;
    } else {
        $("#alerta_Error1").show();
    }

});

$('#addFactura').click(function () {
    var rows = $(tablaFactura).dataTable().api().rows().data();
    rows.toArray();
    $.ajax({
        type: "POST",
        url: "/Facturas/Detalle?rows=" + setJson(rows.toArray()),
        contentType: 'application/json; charset=utf-8',
        //traditional: true,
        //data:JSON.stringify({ 'rows': setJson(rows.toArray())}),
        //dataType: 'json',
        success: function (response) {
            debugger
            $("#crearFactura").submit();
        },
        error: function (response) {
            debugger
            alert('Error: ' + xhr.statusText);
        }
    });
});

function setJson(rows) {
    debugger
    var json = '[';

    for (var i = 0, len = rows.length; i < len; i++) {
        if (i == 0) {
            json += '{"Numero_Factura":"0",' +
            '"Id_Producto":"' + rows[i][0] + '"' +
            ',"Cantidad":"' + rows[i][2] + '"' +
            ',"Precio_Total_Producto":"' + rows[i][3] + '"' +
            ',"Precio_Unitario":"' + rows[i][4] + '"}';
        }
        else {
            json += ',{"Numero_Factura":"0",' +
            '"Id_Producto":"' + rows[i][0] + '"' +
            ',"Cantidad":"' + rows[i][2] + '"' +
            ',"Precio_Total_Producto":"' + rows[i][3] + '"' +
            ',"Precio_Unitario":"' + rows[i][4] + '"}';
        }
    }
    json += ']';
    return json;
}