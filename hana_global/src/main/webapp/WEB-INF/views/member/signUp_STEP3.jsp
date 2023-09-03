<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-14
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Stepper Styles -->
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <link rel="stylesheet" href="./css/step3.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <%--    주소 api 링크--%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./js/main.js"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/flag-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <title>본인 확인</title>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function authorize() {

            event.preventDefault();
            let url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
                +"response_type=code"
                +"&client_id=53b902d1-c485-49ec-bfaa-034c00aeb53e"
                +"&redirect_uri=http://localhost:8080/signUp_STEP3"
                +"&scope=login inquiry transfer"
                +"&state=b80BLsfigm9OokPTjy03elbJqRHOfGSY"
                +"&auth_type=0";

            window.open(url, "width=1200,height=900,scrollbars=yes,resizable=yes");

        }

        $(document).on("ready", function(){
            callbackURL = window.parent.document.URL;
            //alert(callbackURL)
            console.log(callbackURL)

            if(callbackURL.indexOf('callback') == -1){
                window.close();
            }

        });
    </script>
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
                        <h2>휴대폰 본인확인</h2>
                        <div class="title-area clearfix">
                            <h3 class="fleft">고객정보</h3>
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
                            <td class="th">성명</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" class="ipt uiAct" title="성명 입력" id="userName"
                                           name="userName" <%--value="${sessionScope.name}"--%>>
                                </div>
                            </td>
                        </tr>
                        <%--                        외국인 등록번호 입력--%>
                        <tr>
                            <td class="th">생년월일/성별</td>
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
                            <td class="th">통신사 선택</td>
                            <%--                            <th scope="row"><label for="mobile01">휴대폰 번호</label><em>*</em></th>--%>
                            <td>
                                <div class="iptWrap setPhone">
                                    <select class="ipt notDel uiAct" title="휴대폰 앞 3자리 선택" id="mobile_carrier"
                                            name="mobile_carrier">
                                        <option value="SKT">SKT</option>
                                        <option value="KT">KT</option>
                                        <option value="LG">LG U+</option>
                                        <option value="SKT_MVNO">SKT 알뜰폰</option>
                                        <option value="KT_MVNO">KT 알뜰폰</option>
                                        <option value="LG_MVNO">LG U+ 알뜰폰</option>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <%--                        TODO: 시간되면 휴대폰 인증 따로 빼기--%>
                        <%--                        휴대폰 번호 시작--%>
                        <tr>
                            <td class="th">휴대폰 번호</td>
                            <%--                            <th scope="row"><label for="mobile01">휴대폰 번호</label><em>*</em></th>--%>
                            <td>
                                <div class="iptWrap setPhone">
                                    <input type="text" id="mobileDigit" name="mobileDigit" class="ipt notDel uiAct"
                                           maxlength="11" title="휴대전화 국번 입력">
                                    <button id="mobileAuth" name="mobileAuth" class="btn_p" onclick="authorize()">인증요청</button>
                                </div>
                            </td>
                        </tr>
                        <%--                        휴대폰 번호 끝--%>

                        </tbody>
                    </table>
                </section>

                <section>
                    <div class="titArea">
                        <h2>고객정보 변경을 위한 기본 정보 입력</h2>
                        <h3 class="titH3">신청인 정보</h3>
                        <div class="title-area clearfix">
                            <div class="infor mt4">
                                <span class="asterisk">*필수입력항목 표시가 있는 항목은 필수 입력사항입니다.</span>
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
                            <td class="th">이메일</td>
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
                            <td class="th">국적</td>
                            <td>
                                <div class="iptWrap">
                                    <select class="ipt uiAct" title="국가선택" id="nationality" name="nationality"
                                            onchange="changeCountryCode()">
                                        <option value="KOR">대한민국 (Republic of Korea)</option>
                                        <option value="CHN">中国 (China)</option>
                                        <option value="TWN">台灣 (Taiwan)</option>
                                        <option value="JPN">日本 (Japan)</option>
                                        <option value="THA">ประเทศไทย (Thailand)</option>
                                        <option value="BGR">България (Bulgaria)</option>
                                        <option value="CZE">Česko (Czech Republic)</option>
                                        <option value="DNK">Danmark (Denmark)</option>
                                        <option value="DEU">Deutschland (Germany)</option>
                                        <option value="ESP">España (Spain)</option>
                                        <option value="LAM">América Latina (Latin America)</option>
                                        <option value="GRC">Ελλάδα (Greece)</option>
                                        <option value="FRA">France (France)</option>
                                        <option value="ITA">Italia (Italy)</option>
                                        <option value="IDN">Indonesia (Indonesia)</option>
                                        <option value="HUN">Magyarország (Hungary)</option>
                                        <option value="NLD">Nederland (Netherlands)</option>
                                        <option value="NOR">Norge (Norway)</option>
                                        <option value="POL">Polska (Poland)</option>
                                        <option value="PRT">Portugal (Portugal)</option>
                                        <option value="BRA">Brasil (Brazil)</option>
                                        <option value="ROU">România (Romania)</option>
                                        <option value="RUS">Россия (Russia)</option>
                                        <option value="FIN">Suomi (Finland)</option>
                                        <option value="SWE">Sverige (Sweden)</option>
                                        <option value="TUR">Türkiye (Turkey)</option>
                                        <option value="VNM">Việt Nam (Vietnam)</option>
                                        <option value="UKR">Україна (Ukraine)</option>

                                    </select>
                                </div>
                            </td>
                        </tr>

                        <!-- 국가코드 -->
                        <tr>
                            <td class="th">국가코드</td>
                            <td>
                                <div class="iptWrap">
                                    <input type="text" class="ipt uiAct" title="국가코드" id="countryCode"
                                           name="countryCode" readonly>
                                </div>
                            </td>
                        </tr>
                        <!-- 성별 시작 -->
<%--                        <tr>--%>
<%--                            <td class="th">성별</td>--%>
<%--                            <td>--%>
<%--                                <div class="iptWrap">--%>
<%--                                    <!-- 숨겨진 입력 필드 추가 -->--%>
<%--                                    <input type="hidden" name="gender" id="gender" value="">--%>
<%--                                    <button type="button" id="maleBtn" class="genderBtn" onclick="selectGender('male')">--%>
<%--                                        M--%>
<%--                                    </button>--%>
<%--                                    <button type="button" id="femaleBtn" class="genderBtn"--%>
<%--                                            onclick="selectGender('female')">F--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        <!-- 성별 끝 -->

                        <%--주소 시작--%>
                        <tr>
                            <td class="th"><b>주소</b></td>
                            <td>
                                <div class="iptWrap">
                                    <div class="postcodeContainer">
                                        <input type="text" class="ipt uiAct" id="postcode" name="sample4_postcode"
                                               placeholder="우편번호">
                                        <button class="valiButton" onclick="sample4_execDaumPostcode(event)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <input type="text" class="ipt uiAct" id="roadAddress" name="roadAddress"
                                           placeholder="도로명주소"><br>
                                    <input type="text" class="ipt uiAct" id="jibunAddress" name="jibunAddress"
                                           placeholder="지번주소"><br>
                                    <input type="text" class="ipt uiAct" id="detailAddress" name="detailAddress"
                                           placeholder="상세주소"><br>
                                    <input type="text" class="ipt uiAct" id="extraAddress" name="extraAddress"
                                           placeholder="참고항목">
                                </div>
                            </td>
                        </tr>
                        <%--주소 끝--%>

                        </tbody>
                    </table>
                </section>

                <section class="certContain">
                    <div class="btnArea" id="btnFclArea">
                        <a href="/signUp_STEP2" id="btnCancel" class="btn_s">이전</a>
                        <button type="submit" id="btnNext" class="btn_p">다음</button>
                    </div>
                </section>
            </form>
        </div>
    </main>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 페이지가 로드될 때 기본으로 한국어와 한국 코드를 선택
        document.getElementById('nationality').value = 'KOR';
        document.getElementById('countryCode').value = 'KOR';
    });

    // 국적과 국가코드 연결
    function changeCountryCode() {
        let nationality = document.getElementById('nationality').value;
        document.getElementById('countryCode').value = nationality;
    }

    // function changeCountryCode() {
    //     let nationality = document.getElementById("nationality");
    //     let countryCode = document.getElementById("countryCode");
    //     let selectedNationality = nationality.value;
    //
    //     countryCode.value = selectedNationality;
    // }
    // 국적 선택 시 국가코드 자동 연결
    function changeCountryCode() {
        let nationalitySelect = document.getElementById("nationality");
        let countryCode = document.getElementById("countryCode");
        let selectedNationalityValue = nationalitySelect.value;
        // let selectedNationalityText = nationalitySelect.options[nationalitySelect.selectedIndex].text.split(" ")[0];
        // 괄호안에 텍스트 가져오기
        let selectedNationalityText = nationalitySelect.options[nationalitySelect.selectedIndex].text.match(/\(([^)]+)\)/)[1];

        // 선택된 국적에 따라 국가 코드 변경
        countryCode.value = selectedNationalityValue;
        nationalitySelect.value = selectedNationalityText;
    }

</script>
</body>
</html>
