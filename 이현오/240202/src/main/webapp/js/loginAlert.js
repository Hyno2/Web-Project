 $(document).ready(function(){
      $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
      // 로그인 실패했을때
      var loginError = '<%= request.getParameter("loginError") %>';
      if (loginError === "true") {
          alert("입력하신 정보가 올바르지 않습니다.");
      }
   		// 로그아웃 성공 시에만 alert 표시
      var logoutSuccess = '<%= request.getParameter("logoutSuccess") %>';
      if (logoutSuccess === "true") {
          alert("로그아웃되었습니다.");
      }
      });
        