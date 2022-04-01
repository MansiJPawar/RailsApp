$(document).ready(function(){
    $('#user-list').DataTable({
      lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
          url: "/get_dataset",
          dataSrc: 'profiles',
          serverSide: true,
        },
        columns: [
        {title: 'Email', data: 'email'},
        {title: 'Provider', data: 'provider'},
       
        ],
          order: [['1', 'desc']]
    });
});