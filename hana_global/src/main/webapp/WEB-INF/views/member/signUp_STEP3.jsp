<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <link rel="stylesheet" href="./css/step3.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <%--    주소 api 링크--%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/flag-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <title>본인 확인</title>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<div class="main-container">
    <%--  공통 헤더--%>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <main>
        <%--  단계 --%>
        <%@ include file="/WEB-INF/views/includes/stepper.jsp" %>

        <div class="content">
            <%--    1002962104821--%>
            <form name="frm" action="${pageContext.request.contextPath}/signUp_STEP4" method="post" id="frm">
            <input type="hidden" id="foreignRegNo" name="foreignRegNo" value="${sessionScope.foreignRegNo}">
                <section>
                    <div class="titArea">
                        <h2>Mobile Authentication</h2>
                        <div class="title-area clearfix">
                            <h3 class="fleft">Customer Information</h3>
                            <div class="infor mt4">
                            </div>
                        </div>
                    </div>

                    <table class="tableY formTbl">
                        <colgroup>
                            <col style="width:185px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <%--                        성명 입력--%>
                        <tr>
                            <td class="th">Full Name</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" class="ipt uiAct" title="성명 입력" id="userName"
                                           name="userName" <%--value="${sessionScope.name}"--%>>
                                </div>
                            </td>
                        </tr>
                        <%--                        외국인 등록번호 입력--%>
                        <tr>
                            <td class="th">BirthDate/Gender</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" class="ipt uiAct" style="max-width: 120px" maxlength="6"
                                           title="주민등록번호 입력" id="birthDate" name="birthDate"/>
                                    -
                                    <input type="text" class="ipt uiAct" maxlength="1"
                                           title="주민등록번호 입력" id="gender" name="gender"/> ●●●●●●
                                </div>
                            </td>
                        </tr>

                        <%--                        휴대폰 번호 시작--%>
                        <tr>
                            <td class="th">Carrier</td>
                            <td>
                                <div class="iptWrap setPhone">
                                    <select class="ipt notDel uiAct" title="휴대폰 앞 3자리 선택" id="mobile_carrier"
                                            name="mobile_carrier">
                                        <option value="SKT">SKT</option>
                                        <option value="KT">KT</option>
                                        <option value="LG">LG U+</option>
                                        <option value="SKT_MVNO">SKT Budget</option>
                                        <option value="KT_MVNO">KT Budget</option>
                                        <option value="LG_MVNO">LG U+ Budget</option>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="th">Mobile No.</td>
                            <td>
                                <div class="iptWrap setPhone">
                                    <input type="text" id="mobileDigit" name="mobileDigit" class="ipt notDel uiAct"
                                           maxlength="11" title="휴대전화 국번 입력">
                                    <button id="requestCodeButton" name="requestCodeButton" class="btn_p">Send</button>
                                </div>
                            </td>
                        </tr>
<%--                       coolsms 문자 인증 시작--%>
                        <tr id="phoneCodeInput" hidden>
                            <td class="th">Authenticate</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" id="phoneCode" name="phoneCode" class="ipt uiAct"
                                           maxlength="6" title="인증번호 입력">
                                    <button id="phoneCodeSubmitButton" name="phoneCodeSubmitButton" class="btn_p" hidden>Confirm</button>
                                </div>
                                <div id="InvalidPhoneNumber" class="error-message" hidden>Invalid mobile number.</div>
                                <div id="InvalidCode" class="error-message" hidden>Invalid authentication code.</div>
                                <div id="validCode" class="success-message" hidden>Authentication code verified!</div>
                            </td>
                        </tr>
<%--                       coolsms 문자 인증 끝--%>
                        </tbody>
                    </table>
                </section>

                <section>
                    <div class="titArea">
                        <h2>Basic Information for Customer Details</h2>
                        <h3 class="titH3">Applicant Information</h3>
                        <div class="title-area clearfix">
                            <div class="infor mt4">
                                <span class="asterisk">*Fields marked with an asterisk are mandatory.</span>
                            </div>
                        </div>
                    </div>

                    <table class="tableY formTbl">
                        <colgroup>
                            <col style="width:185px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
<%--                        이메일 시작--%>
                        <tr>
                            <td class="th">Email*</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="email" class="ipt uiAct" title="이메일 입력" id="emailId"
                                           name="emailId" placeholder="hanaglobal@kopo.ac.kr">
                                </div>
                            </td>
                        </tr>
<%--                        이메일 끝--%>

                        <!-- 국적 -->
                        <tr>
                            <td class="th">Nationality*</td>
                            <td>
                                <div class="iptWrap">
    <input type="text" value="${sessionScope.country}" class="ipt uiAct" title="국적" id="nationality" name="nationality" readonly>
                                </div>
                            </td>
                        </tr>

                        <!-- 국가코드 -->
                        <tr>
                            <td class="th">Country Code*</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" class="ipt uiAct" title="국가코드" id="countryCode"
                                           name="countryCode" readonly>
                                </div>
                            </td>
                        </tr>

                        <%--주소 시작--%>
                        <tr>
                            <td class="th"><b>Address*</b></td>
                            <td>
                                <div class="iptWrap">
                                    <div class="postcodeContainer">
                                        <input type="text" class="ipt uiAct" id="postcode" name="sample4_postcode"
                                               placeholder="ZipCode">
                                        <button class="valiButton" onclick="sample4_execDaumPostcode(event)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <input type="text" class="ipt uiAct" id="roadAddress" name="roadAddress" placeholder="Street Address"><br>
                                    <input type="text" class="ipt uiAct" id="jibunAddress" name="jibunAddress" placeholder="Parcel Address"><br>
                                    <input type="text" class="ipt uiAct" id="detailAddress" name="detailAddress" placeholder="Detailed Address"><br>
                                    <input type="text" class="ipt uiAct" id="extraAddress" name="extraAddress" placeholder="Reference Item">
                                </div>
                            </td>
                        </tr>
                        <%--주소 끝--%>

                        </tbody>
                    </table>
                </section>

                <section class="certContain">
                    <div class="btnArea" id="btnFclArea">
                        <a href="/signUp_STEP2" id="btnCancel" class="btn_s">Prev</a>
                        <button type="submit" id="btnNext" class="btn_p">Next</button>
                    </div>
                </section>
            </form>
        </div>
    </main>
</div>

<script>
    // 국적과 국가코드 자동 입력
    document.addEventListener('DOMContentLoaded', function () {
        const countryFromSession = "${sessionScope.country}";  // 여기서 세션의 'country' 값을 가져와야 합니다.
        setCountryAndCodeBasedOnName(countryFromSession);
    });

    function setCountryAndCodeBasedOnName(countryName) {
        const countries = {
            "Dominion of Canada": "CAN",
            "대한민국 (Republic of Korea)": "KOR",
            "中国 (China)": "CHN",
            "台灣 (Taiwan)": "TWN",
            "日本 (Japan)": "JPN",
            "ประเทศไทย (Thailand)": "THA",
            "България (Bulgaria)": "BGR",
            "Česko (Czech Republic)": "CZE",
            "Danmark (Denmark)": "DNK",
            "Deutschland (Germany)": "DEU",
            "España (Spain)": "ESP",
            "América Latina (Latin America)": "LAM",
            "Ελλάδα (Greece)": "GRC",
            "France (France)": "FRA",
            "Italia (Italy)": "ITA",
            "Indonesia (Indonesia)": "IDN",
            "Magyarország (Hungary)": "HUN",
            "Nederland (Netherlands)": "NLD",
            "Norge (Norway)": "NOR",
            "Polska (Poland)": "POL",
            "Portugal (Portugal)": "PRT",
            "Brasil (Brazil)": "BRA",
            "România (Romania)": "ROU",
            "Россия (Russia)": "RUS",
            "Suomi (Finland)": "FIN",
            "Sverige (Sweden)": "SWE",
            "Türkiye (Turkey)": "TUR",
            "Việt Nam (Vietnam)": "VNM",
            "Україна (Ukraine)": "UKR"
        };

        document.getElementById('nationality').value = countryName;
        document.getElementById('countryCode').value = countries[countryName] || "Unknown"; // 국가코드가 존재하지 않을 경우 "Unknown" 출력
    }

    $("#requestCodeButton").click(function (event) {
        let phone = $("#mobileDigit").val();
        event.preventDefault(); // 기본 동작 방지
        console.log(phone);
        if (phone) {
            $.ajax({
                type: 'GET',
                url: '/sms',
                data: {
                    phone: phone
                },
                success: function () {
                    // 인증번호 입력창 띄우기
                    $("#phoneCodeInput").removeAttr("hidden");
                    document.getElementById("requestCodeButton").disabled = true;
                    document.getElementById("phoneCodeSubmitButton").hidden = false;
                },
                error: function (error) {
                    // 유효하지 않은 휴대전화
                    $("#InvalidPhoneNumber").removeAttr("hidden");
                }
            });

        } else {
            alert("휴대폰 번호를 입력해주세요.");
        }
    });

    // 휴대폰 인증번호 확인 버튼 클릭
    $("#phoneCodeSubmitButton").click(function (event) {
        event.preventDefault();
        let code = $("#phoneCode").val();
        console.log("인증번호는 ", code);
        if (code) {
            $.ajax({
                type: 'POST',
                url: '/sms',
                data: {
                    phoneCodeInput: code
                },
                success: function () {
                    // 인증번호 입력창 띄우기
                    $("#validCode").removeAttr("hidden");
                    document.getElementById("InvalidCode").hidden = true;
                },
                error: function (error) {
                    // 유효하지 않은 휴대전화
                    $("#InvalidCode").removeAttr("hidden");
                }
            });
        } else {
            alert("인증번호를 입력해주세요.");
        }
    });


</script>
</body>
</html>
