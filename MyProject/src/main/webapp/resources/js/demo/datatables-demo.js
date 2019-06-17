// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable(
	{
		"bServerSide": false,
        "bProcessing": false,
        "bJQueryUI": false,
        "bFilter": false,
        "bSort":false,
        "dom": 'rt<"bottom"flp> ',
	}	  
  );
});
