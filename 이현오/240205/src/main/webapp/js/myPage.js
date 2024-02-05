function confirmDelete(userId) {
    var confirmResult = confirm("정말로 삭제하시겠습니까?");
    if (confirmResult) {
        // 예를 눌렀을 경우 userId를 delete.do에 전달
        window.location.href = "delete.do?id=" + userId;
    }
}

function enableEdit() {
    // 아이디를 제외한 다른 입력란만 활성화
    document.getElementById("pw").disabled = false;
    document.getElementById("name").disabled = false;
    document.getElementById("hp").disabled = false;
    document.getElementById("email").disabled = false;

    // "수정" 버튼 숨기고 "저장"과 "취소" 버튼 표시
    document.querySelector('input[value="수정"]').style.display = 'none';
    document.querySelector('input[value="저장"]').style.display = 'inline';
    document.querySelector('input[value="취소"]').style.display = 'inline';
}

function cancelEdit() {
    // 폼의 입력 상태를 초기화하고 disabled 상태로 돌아감
    document.getElementById("pw").value = "<%=user.getPw()%>";
    document.getElementById("name").value = "<%=user.getName()%>";
    document.getElementById("hp").value = "<%=user.getHp()%>";
    document.getElementById("email").value = "<%=user.getEmail()%>";

    // 모든 입력란을 다시 disabled 상태로 변경
    document.getElementById("pw").disabled = true;
    document.getElementById("name").disabled = true;
    document.getElementById("hp").disabled = true;
    document.getElementById("email").disabled = true;

    // "수정" 버튼과 "저장", "취소" 버튼 순서대로 표시
    document.querySelector('input[value="수정"]').style.display = 'inline';
    document.querySelector('input[value="저장"]').style.display = 'none';
    document.querySelector('input[value="취소"]').style.display = 'none';
}
