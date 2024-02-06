  function guestAlert() {
        // 폼 요소를 가져옴
        var form = document.getElementById("guestForm");
        // 폼을 서버로 제출
        form.submit();
        // 제출 후 메시지를 표시
        alert("이메일 저장 완료");
        // 혹은 다른 처리를 수행하도록 코드를 추가할 수 있음
    }