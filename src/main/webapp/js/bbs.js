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
			dataType: "json",
			cache: false,
			success:function(rs){
				if(rs.result == 1){
					alert("댓글을 등록했습니다.");
					location.reload();
				}
			},
			error: function(rs){
				console.log("에러");
			}
		})
	})
	
	$("#memoeditForm").submit(function(e){
		e.preventDefault();
		let $form = $("#memoeditForm").serialize();
		$.ajax({
			url: "action/memo.jsp",
			type: "post",
			data: $form,
			dataType: "json",
			cache: false,
			success: function(rs){
				if(rs.result < 1){
					alert("비밀번호를 입력하세요.");
					return false;
				}else if(rs.result == 1){
					alert("비밀번호를 다시 확인하세요.");
					return false;
				} else{
					alert("성공적으로 수정했습니다.");
					location.reload();
				}
			},
			error: function(rs){
				console.log("에러");
			}
		});
	});
	
	$(".memodel").click(function(e){
		e.preventDefault();
		let r = prompt("비밀번호를 입력하세요.", "");
		let memoid = $(this).data("memoid");
		let bbs_id = $(this).data("bbs_id");
		if(r){
			$.get("action/memo.jsp?mode=del&pwd="+r+"&memoid="+memoid + "&bbs_id="+bbs_id, function(rs){
				if(rs.result == 0){
					alert("비밀번호를 넣어주세요.");
					return false;
				}else if(rs.result == 1){
					alert("비밀번호를 다시 확인하세요.");
					return false;
				}else{
					alert("삭제하였습니다.");
					location.reload();
				}
			});
		}
	})
	
	$(".memodal").click(function(e){
		e.preventDefault();
		let id = $(this).data("memoid");
		let content = $.trim($("#content_"+id).text());
		$("#memoid").val(id);
		$("#memocomment").val(content);
		$(".popup").fadeIn();
	});
	
	$(".closebtn").click(function(e){
		e.preventDefault();
		$(".popup").fadeOut();
	})
});