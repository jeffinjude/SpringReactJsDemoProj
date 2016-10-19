$( document ).ready(function() {
	$(".deleteUser").click(function () {
		var id = $(this).attr('id');
		$("#record_"+id).css("backgroundColor","#fb6c6c");
		
		setTimeout(function(){
			var r = confirm("Are you sure you want to delete this record?");
		    if (r == false) {
		    	$("#record_"+id).css("backgroundColor","#d4d1d5");
		        event.preventDefault();
		    }
		    else
		    {
				$.ajax({
					type: 'get',
					url: 'DeleteUserDetails?userId='+id,
					beforeSend: function() {
						
					},
					success: function() {
						$("#record_"+id).css("display","none");
					}
				});
		    }
		}, 500);
	});
});