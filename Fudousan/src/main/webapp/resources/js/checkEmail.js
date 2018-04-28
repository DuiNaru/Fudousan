/**
 * 
 */

	$(function() {
			var idRegexp = /^[0-9a-zA-Z]{1,20}$/;
			
			function idClass(status) {
				switch(status) {
					case 'reset':
						$('#id').parent().removeClass('has-success');
						$('#id').parent().removeClass('has-error');
						$('#id').parent().find('span').removeClass('glyphicon-remove');
						$('#id').parent().find('span').removeClass('glyphicon-ok');
						break;
					case 'success':
						$('#id').parent().addClass('has-success');
						$('#id').parent().find('span').addClass('glyphicon-ok');
						break;
					case 'error':
						$('#id').parent().addClass('has-error');
						$('#id').parent().find('span').addClass('glyphicon-remove');
						break;
				}
			}
						
			$('form').on('submit', function formCheck() {
				var id = $('#id').val();
				var password = $('#password').val();
				var name = $('#name').val();
				
				if (id == null || !idRegexp.test(id)) {
					idClass('error');
					$('#id').focus();
					return false;
				}
					return true;
			})
			
			$('#id').on('change', function() {
				idClass('reset');
				if (!idRegexp.test($('#id').val())) {
					idClass('error');
					return false;
				} else {
					$.ajax({
						url:'emailCheck',
						tyep:'GET',
						data:{
							email:$(this).val()
						},
						dataType:'text',
						success:function(data) {
							if (data=='true') {
								idClass('error');
							} else {
								idClass('success');
							}
						},
						error:function(err) {
							console.log(err);
						}
					});
				}
			});
			
			$('#password').on('change', function() {
				$('#password2').removeClass('hidden');	

				if ($('#password').val() == $('#password2').val()) {
					passwordClass('success');
				} else {
					passwordClass('error');
				}
			});
			$('#password2').on('change', function() {
				if ($('#password').val() == $('#password2').val()) {
					passwordClass('success');
				} else {
					passwordClass('error');
				}
			});
			
			$('#name').on('change', function() {
				if ($('#name').val().length > 30) {
					nameClass('error');
				} else {
					nameClass('success');
				}
			});
		})