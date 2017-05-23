$.ajax({
  url: "member.jsp",
  data: "$('#account').value"
  type: "POST",
  dataType: 'text',

  success: function(response) {
    alert(response);
  },

  error: function(xhr, ajaxOptions, thrownError) {
    alert(xhr.status);
    alert(thrownError);
  }
});

function checkDuplicateAccount(String response) {
  String r = response.serialize();
  String account = $('#account').value();

}

$(document).ready(function() {
  $("form").submit(function() {
    // 取得表單欄位值
    var nameVal = $('#account').val();
    // 使用HTTP POST方法送出Ajax請求
    $.post('checkDuplicateAccount.jsp', {
        name: nameVal,
        type: typeVal
      },
      function(data) {
        // 取出XML元素值
        $('#account').value('');
        alert("帳號重複");
      }
    );
    return false;
  });
});
