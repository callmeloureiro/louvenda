// $('#new_user').submit(function() {  
//   var valuesToSubmit = $(this).serialize();
//   $.ajax({
//     type: "POST",
//     url: $(this).attr('action'),
//     data: valuesToSubmit,
//   }).success(function(){
//     swal("Cliente adicionado com sucesso!", "Clique para continuar", "success");
//     $('#modalcliente').modal('hide');
//   }).fail(function() {
//     sweetAlert("Este cliente já consta registrado no sistema...", "Por favor, revise as informações e tente novamente!", "error");
//   });
//     return false; // prevents normal behaviour
// });

// $('.modal-dialog #new_user').submit(function() {  
//   var valuesToSubmit = $(this).serialize();
//   $.ajax({
//     type: "POST",
//     dataType: 'json',
//     url: $(this).attr('action'),
//     data: valuesToSubmit,
//     beforeSend: function( xhr ) {
//       var token = $('meta[name="csrf-token"]').attr('content');
//       if (token) xhr.setRequestHeader('X-CSRF-Token', token);
//     },
//     success: function(data) {
//       if ( $('#clientesrecentes li').length == 10 ) {
//         $('#clientesrecentes > li:last-child').remove();
//       }
//       var newreg = $( "<li><a href='/painel/users/" + data.id + "'>" + data.name + "</a></li>" );
//       $( "#clientesrecentes" ).prepend( newreg );
//       swal("Cliente adicionado com sucesso!", "Clique para continuar", "success");
//       $('#modalcliente').modal('hide');
//     },
//     error: function(request) {
//       console.log("Código do erro: " + request.status);
//       sweetAlert("Opa! Aconteceu um erro.", "Por favor, revise as informações e tente novamente! Código do erro: " + request.status, "error");
//     }
//   })
// });

// $('.modal-dialog #new_product').submit(function() {  
//   var valuesToSubmit = $(this).serialize();
//   $.ajax({
//     type: "POST",
//     dataType: 'json',
//     url: $(this).attr('action'),
//     data: valuesToSubmit,
//     beforeSend: function( xhr ) {
//       var token = $('meta[name="csrf-token"]').attr('content');
//       if (token) xhr.setRequestHeader('X-CSRF-Token', token);
//     },
//     success: function(data) {
//       swal("Produto adicionado com sucesso!", "Clique para continuar", "success");
//       $('#modalproduto').modal('hide');
//     },
//     error: function(request) {
//       console.log("Código do erro: " + request.status);
//       sweetAlert("Opa! Aconteceu um erro.", "Por favor, revise as informações e tente novamente! Código do erro: " + request.status, "error");
//     }
//   })
// });

$('.modal-dialog #new_user').submit(function() {  
  var valuesToSubmit = $(this).serialize();
  $.ajax({
    type: "POST",
    url: $(this).attr('action'),
    data: valuesToSubmit,
  }).success(function(data){
    if ( $('#clientesrecentes li').length == 10 ) {
      $('#clientesrecentes > li:last-child').remove();
    }
    var newreg = $( "<li><a href='/painel/users/" + data.id + "'>" + data.name + "</a></li>" );
    $( "#clientesrecentes" ).prepend( newreg );
    swal("Cliente adicionado com sucesso!", "Clique para continuar", "success");
    $('#modalcliente').modal('hide');
  }).fail(function(request) {
    console.log("Código do erro: " + request.status);
    sweetAlert("Opa! Aconteceu um erro.", "Por favor, revise as informações e tente novamente! Código do erro: " + request.status, "error");
  });
  return false;
});

$('.modal-dialog #new_product').submit(function() {  
  var valuesToSubmit = $(this).serialize();
  $.ajax({
    type: "POST",
    url: $(this).attr('action'),
    data: valuesToSubmit,
  }).success(function(data){
    swal("Produto adicionado com sucesso!", "Clique para continuar", "success");
    $('#modalproduto').modal('hide');
  }).fail(function(request) {
    console.log("Código do erro: " + request.status);
    sweetAlert("Opa! Aconteceu um erro.", "Por favor, revise as informações e tente novamente! Código do erro: " + request.status, "error");
  });
  return false;
});

$('.modal-dialog #new_sale').submit(function() {  
  var valuesToSubmit = $(this).serialize();
  $.ajax({
    type: "POST",
    url: $(this).attr('action'),
    data: valuesToSubmit,
  }).success(function(data){
    swal("Venda efetuada com sucesso!", "Clique para continuar", "success");
    $('#modalvenda').modal('hide');
  }).fail(function(request) {
    console.log("Código do erro: " + request.status);
    sweetAlert("Opa! Aconteceu um erro.", "Por favor, revise as informações e tente novamente! Código do erro: " + request.status, "error");
  });
  return false;
});

$(document).ready(function(){
  $('.date').mask('00/00/0000');
  $('.cep').mask('00000-000');
  $('.cpf').mask('000.000.000-00', {reverse: true});
  $('.phone').mask('(00) 0000-0000');
});

$(document).ready(function() {
  $('#example0').DataTable( {
    "language": {                
      "url": "//cdn.datatables.net/plug-ins/1.10.6/i18n/Portuguese-Brasil.json"            
    }
  });
});

$(document).ready(function() {

  $('select').select2({ width: '100%' });

  var table = $('#example').DataTable({
    "columnDefs": [
    { "visible": false, "targets": 2 }
    ],
    "order": [[ 2, 'asc' ]],
    "displayLength": 25,
    "drawCallback": function ( settings ) {
      var api = this.api();
      var rows = api.rows( {page:'current'} ).nodes();
      var last=null;

      api.column(2, {page:'current'} ).data().each( function ( group, i ) {
        if ( last !== group ) {
          $(rows).eq( i ).before(
            '<tr class="group"><td colspan="5">'+group+'</td></tr>'
            );

          last = group;
        }
      } );
    }
  } );

    // Order by the grouping
    $('#example tbody').on( 'click', 'tr.group', function () {
      var currentOrder = table.order()[0];
      if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
        table.order( [ 2, 'desc' ] ).draw();
      }
      else {
        table.order( [ 2, 'asc' ] ).draw();
      }
    } );
  } );