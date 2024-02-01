function setEmailDomain(select_Value) {
		let emailDomainInput = document.getElementById("email_domain");

		if (select_Value === "custom") {
			emailDomainInput.disabled = false;
		} else {
			emailDomainInput.disabled = true;
			if (select_Value !== "custom") {
				emailDomainInput.value = select_Value;
			}
		}
	}

	// 회원가입시 빈칸있으면 빈칸에 따라 에러메세지 출력하는 메소드
	function emptyError() {
		let idInput = document.getElementById("id");
		let pwInput = document.getElementById("pw");
		let nameInput = document.getElementById("name");
		let hpInput = document.getElementById("hp");
		let emailIdInput = document.getElementById("email_id");
		let emailDomainInput = document.getElementById("email_domain");
		let idDuplication = document.getElementsByName("idDuplication")[0].value;


		// 이메일 아이디와 도메인을 합쳐서 새로운 입력란에 저장
		let email = document.createElement("input");
		email.type = "hidden";
		email.name = "email";
		email.value = emailIdInput.value + "@" + emailDomainInput.value;

		// form에 새로운 입력란 추가
		document.forms[0].appendChild(email);

		// 빈칸 체크를 수행하고, 필요한 경우 에러 메시지를 표시
		if (!idInput.value) {
			alert("아이디를 입력해주세요.");
			return false;
		}

		if (idDuplication !== 'idCheck') {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (!pwInput.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		if (!nameInput.value) {
			alert("이름을 입력해주세요.");
			return false;
		}

		if (!hpInput.value) {
			alert("전화번호를 입력해주세요.");
			return false;
		}

		if (!emailIdInput.value || !emailDomainInput.value) {
			alert("이메일을 입력해주세요.");
			return false;
		}

		// 회원가입 완료 시
		alert("회원가입 완료");


		return true;
	}

	function fn_dbCheckId() {
		let id = document.getElementById("id");

		if (!id || id.value.trim() === "") {
			alert("아이디를 입력해주세요.");
		} else {
			// 중복 확인을 서블릿으로 진행
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						// 서버로부터 응답을 받아 처리
						let result = xhr.responseText;

						if (result === "1") {
							alert("이미 사용 중인 아이디입니다.");
						} else if (result === "0") {
							alert("사용 가능한 아이디입니다.");

							// 중복 확인 결과를 감지하는 코드 추가
							let idDuplicationInput = document.getElementsByName("idDuplication")[0];
							idDuplicationInput.value = "idCheck";

							// 중복 확인 버튼 비활성화
							let dbCheckIdButton = document.getElementsByName("dbCheckId")[0];
							dbCheckIdButton.disabled = true;
							dbCheckIdButton.style.opacity = 0.6;
							dbCheckIdButton.style.cursor = "default";
						} else {
							alert("중복 확인 중 오류가 발생했습니다.");
						}
					}
				}
			};

			xhr.open("GET", 'checkID.do?id=' + encodeURIComponent(id.value), true);
			xhr.send();
		}
	}