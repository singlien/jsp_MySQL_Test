$.ajax({
                url: "member.jsp",
                data:"$('#account').value"
                type:"POST",
                dataType:'text',

                success:function(response){
                  alert(response);
                },

                 error:function(xhr, ajaxOptions, thrownError){
                    alert(xhr.status);
                    alert(thrownError);
                 }
            });

function checkDuplicateAccount(String response){
  String r = response.serialize();
  String account = $('#account').value();

}
