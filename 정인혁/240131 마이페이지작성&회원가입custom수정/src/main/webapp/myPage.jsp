<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Session.SessionUtil" %>
<%@ page import="com.javalex.ex.DAO.MemberDAO" %>
<%@ page import="com.javalex.ex.DTO.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
    String userId = SessionUtil.getLoginId(request);

    if (userId != null) {
        MemberDAO dao = new MemberDAO();
        ArrayList<MemberDTO> userInfo = dao.MemberSelectById(userId);

        if (!userInfo.isEmpty()) {
            MemberDTO user = userInfo.get(0);
%>


            <form id="userInfoForm" action="update.do" method="post">
            	<input type="hidden" id="id" name="id" value="<%=user.getId()%>">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" value="<%=user.getId()%>" disabled><br>

                <label for="pw">비밀번호:</label>
                <input type="text" id="pw" name="pw" value="<%=user.getPw()%>" disabled><br>

                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="<%=user.getName()%>" disabled><br>

                <label for="hp">폰번호:</label>
                <input type="text" id="hp" name="hp" value="<%=user.getHp()%>" disabled><br>

                <label for="email">이메일:</label>
                <input type="text" id="email" name="email" value="<%=user.getEmail()%>" disabled><br>

                <input type="button" value="수정" onclick="enableEdit()">
                <input type="submit" value="저장" style="display:none;">
                <input type="button" value="취소" onclick="cancelEdit()" style="display:none;">
                <br>
            </form>
            <a href="javascript:void(0);" onclick="confirmDelete('<%= user.getId() %>')">회원탈퇴</a>

			<script>
    			function confirmDelete(userId) {
        			var confirmResult = confirm("정말로 삭제하시겠습니까?");
        			if (confirmResult) {
            			// 예를 눌렀을 경우 userId를 delete.do에 전달
            			window.location.href = "delete.do?id=" + userId;
       			 }
    			}
			</script>

            <script>
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
            </script>
<%
        }
    }
%>
<%
    // updateSuccess 파라미터가 true일 경우에만 알림창을 띄움
    String updateSuccess = request.getParameter("updateSuccess");
    if ("true".equals(updateSuccess)) {
%>
<script>
    alert("수정이 완료되었습니다.");
</script>
<%
    }
%>
