$(function(){
  $(window).load(function(){
    $('.loading').fadeOut(1000);
  });

	$('.colname>a').click(function(){
		let col = $(this).data("name");
		let val = $(this).text();
		$('.btn-title').text(val);
		$('#colname').val(col);
	})
	
	
	$('#commentForm').submit(function(e){
		e.preventDefault();
		let $form = $('#commentForm').serialize();
		$.ajax({
			url: "action/memo.jsp",
			type:"post",
			data: $form,
			dataType: 'json',
			success:function(rs){
				if(rs == 1){
					alert("댓글을 등록했습니다.");
					location.reload();
				}
			},
			error: function(rs){
				console.log("에러");
			}
		})
	})
});