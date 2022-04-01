// Load user details for Admin panel via DataTable
$(document).ready(function(){
  $('#user-list').DataTable({
    lengthMenu: [5, 10, 15, 25, 50],
      ajax: {
        url: "/get_dataset",
        dataSrc: 'omniauth_callbacks',
        serverSide: true,
      },
      columns: [
      {title: 'Email', data: 'email'},
      {title: 'Provider', data: 'provider'},
      {title: 'Name', data: 'name'},
      {title: 'UID', data: 'uid'},
      ],
  });
});