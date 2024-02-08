
function sendCheckValue(result) {
    var openJoinfrm = opener.document.joinForm;

    if (result == "1") {
        alert("다른 아이디를 입력해주세요.");
        openJoinfrm.id.focus();
    } else if (result == "0") {
        // 중복체크 결과인 idCheck 값을 전달
        openJoinfrm.idDuplication.value = "idCheck";
        openJoinfrm.dbCheckId.disabled = true;
        openJoinfrm.dbCheckId.style.opacity = 0.6;
        openJoinfrm.dbCheckId.style.cursor = "default";
    } else {
        alert("중복 확인 중 오류가 발생했습니다.");
    }

    window.close();
}