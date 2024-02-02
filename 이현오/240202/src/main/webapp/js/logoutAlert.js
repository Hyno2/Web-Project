$(document).ready(function(){
      $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
      // 로그아웃 성공 시에만 alert 표시
      var logoutSuccess = '<%= request.getParameter("logoutSuccess") %>';
      if (logoutSuccess === "true") {
          alert("로그아웃되었습니다.");
      }
      });
        