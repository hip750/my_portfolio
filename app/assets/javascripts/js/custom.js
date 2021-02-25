// .jpostal
$(window).ready( function() {
  $('#user_postcode').jpostal({
    postcode: ['#user_postcode'],
    address: {
      '#user_prefecture_code': '%3',
      '#user_city': '%4',
      '#user_street': '%5%6%7',
    },
  });
});

// image size alert
$("#recruit_image").bind("change", function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert("ファイルの最大サイズは5MBです。");
    $("#recruit_image").val("");
  }
});
